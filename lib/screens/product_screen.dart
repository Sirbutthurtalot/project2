import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../services/product_service.dart';
import '../widgets/top_bar.dart';
import '../widgets/shopping_cart_button.dart';

class ProductScreen extends ConsumerWidget {
  final int id;
  ProductScreen(this.id);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Future<Product> product = ProductService().get(id);
    return Scaffold(
        appBar: TopBar(),
        body: SingleChildScrollView(
            child: FutureBuilder(
                future: product,
                builder: ((context, snapshot) {
                  if (snapshot.hasData) {
                    Product p = snapshot.data!;
                    return Center(child: LayoutBuilder(builder:
                        (BuildContext context, BoxConstraints constraints) {
                      if (constraints.maxWidth < 957) {
                        return PhoneLayout(p);
                      } else if (constraints.maxWidth < 1200) {
                        return DesktopLayout(p);
                      } else {
                        return DesktopLayout(p);
                      }
                    }));
                  } else {
                    return const Text("Waiting for data");
                  }
                }))));
  }
}

class PhoneLayout extends StatelessWidget {
  final Product product;
  PhoneLayout(this.product);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.grey[200],
        width: 1200,
        padding: const EdgeInsets.all(16),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image(image: NetworkImage(product.img)),
              Container(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 5),
                child: Text(textScaleFactor: 3, product.name),
              ),
              Text(product.desc),
              Container(
                  padding: EdgeInsets.all(50),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("Price: ${product.price.toString()}"),
                        ShoppingCartButton(product)
                      ]))
            ]));
  }
}

class DesktopLayout extends StatelessWidget {
  final Product product;
  DesktopLayout(this.product);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.grey[200],
        width: 1200,
        padding: const EdgeInsets.all(16),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Image(height: 500, image: NetworkImage(product.img)),
            Container(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 5),
              child: Text(textScaleFactor: 3, product.name),
            ),
            Text(product.desc)
          ]),
          Container(
              padding: const EdgeInsets.all(50),
              child: Column(children: [
                Text("Price: ${product.price.toString()}"),
                ShoppingCartButton(product)
              ]))
        ]));
  }
}
