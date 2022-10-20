import 'package:flutter/material.dart';

import '../services/product_service.dart';

class ProductLister extends StatelessWidget {
  List<Product> products;
  ProductLister(this.products);

  @override
  Widget build(BuildContext context) {
    return Column(
        children: List.generate(products.length, (index) {
      Product p = products[index];
      return SizedBox(
          width: 400,
          child: Card(
              child: ListTile(
            title: Text(p.name),
            leading: Image(width: 100, height: 100, image: NetworkImage(p.img)),
          )));
    }));
  }
}
