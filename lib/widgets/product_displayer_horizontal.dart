import 'package:dad_project_2/widgets/shopping_cart_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../services/product_service.dart';

class ProductDisplayerHorizontal extends StatelessWidget {
  final String tag;
  final bool isSearch;
  ProductDisplayerHorizontal(this.tag, [this.isSearch = true]);

  @override
  Widget build(BuildContext context) {
    Future<List<Product>> data = isSearch
        ? ProductService().getSearch(tag)
        : tag == ""
            ? ProductService().getAll()
            : ProductService().getCategory(tag);
    return FutureBuilder(
        future: data,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List data = snapshot.data!;
            return Container(
                height: 400,
                child: ListView(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.all(8),
                    children: List.generate(data.length, (index) {
                      Product p = data[index];
                      return Container(
                          width: 200,
                          height: 400,
                          padding: const EdgeInsets.all(2),
                          child: Card(
                              child: InkWell(
                                  splashColor: Colors.blue.withAlpha(50),
                                  onTap: () => context.go('/product/${p.id}'),
                                  child: Container(
                                      margin: const EdgeInsets.all(8),
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Image(
                                                height: 200,
                                                image: NetworkImage(p.img)),
                                            Text(textScaleFactor: 2, p.name),
                                            Expanded(child: Text(p.desc)),
                                            Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                      textScaleFactor: 1.5,
                                                      p.price.toString()),
                                                  ShoppingCartButton(p)
                                                ]),
                                          ])))));
                    })));
          } else {
            return const Text("Waiting for data...");
          }
        });
  }
}
