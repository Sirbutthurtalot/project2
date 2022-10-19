import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../services/product_service.dart';
import '../widgets/shopping_cart_button.dart';

class ProductDisplayerVertical extends StatelessWidget {
  final String tag;
  ProductDisplayerVertical(this.tag);

  @override
  Widget build(BuildContext context) {
    Future<List<Product>> data = tag == ""
        ? ProductService().getAll()
        : ProductService().getCategory(tag);
    return FutureBuilder(
        future: data,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List data = snapshot.data!;
            return LimitedBox(
                maxWidth: 500,
                maxHeight: 1000,
                child: ListView(
                    scrollDirection: Axis.vertical,
                    padding: const EdgeInsets.all(8),
                    children: List.generate(data.length, (index) {
                      Product p = data[index];
                      return Container(
                          padding: const EdgeInsets.all(2),
                          child: Card(
                              child: InkWell(
                                  splashColor: Colors.blue.withAlpha(50),
                                  onTap: () => context.go('/product/${p.id}'),
                                  child: Container(
                                      margin: const EdgeInsets.all(8),
                                      child: Row(children: [
                                        Container(
                                            padding: const EdgeInsets.all(8),
                                            child: Image(
                                                height: 100,
                                                width: 100,
                                                image: NetworkImage(p.img))),
                                        Expanded(
                                            child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                              Container(
                                                  child: Text(
                                                      textScaleFactor: 2,
                                                      p.name)),
                                              Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Container(
                                                        child: Text(
                                                            textScaleFactor:
                                                                1.5,
                                                            p.price
                                                                .toString())),
                                                    Container(
                                                        child:
                                                            ShoppingCartButton(
                                                                p))
                                                  ])
                                            ]))
                                      ])))));
                    })));
          } else {
            return const Text("Waiting for data...");
          }
        });
  }
}
