import 'dart:convert';

import '../util/asset_loader.dart';

class ProductService {
  Future<Product> get(int id) {
    return loadData().then((data) {
      Map decoded = jsonDecode(data);
      List products = decoded['shop']['data'];
      var match = products.where((product) => product['id'] == id);
      if (match.isNotEmpty) {
        return Product.fromMap(match.first);
      } else {
        throw ("NO item found");
      }
    });
  }

  Future<List<Product>> getCategory(String tag) {
    return loadData().then((data) {
      Map decoded = jsonDecode(data);
      List products = decoded['shop']['data'];
      var match = products.where((product) => product['tags'].contains(tag));
      List<Product> ps = match.map((map) => Product.fromMap(map)).toList();
      return ps;
    });
  }

  Future<List<Product>> getAll() {
    return loadData().then((data) {
      Map decoded = jsonDecode(data);
      List products = decoded['shop']['data'];
      List<Product> ps = products.map((map) => Product.fromMap(map)).toList();
      return ps;
    });
  }

  Future<List<String>> getListOfCategories() {
    return getAll().then((products) {
      Set<String> tags = Set();
      products.forEach((p) {
        p.tags.forEach((t) {
          tags.add(t);
        });
      });
      return tags.toList();
    });
  }
}

class Product {
  final int id;
  final String name;
  final String desc;
  final double price;
  final String img;
  final List tags;
  Product(this.id, this.name, this.desc, this.price, this.img, this.tags);
  Product.fromMap(Map dataMap)
      : id = dataMap['id'],
        name = dataMap['name'],
        desc = dataMap.containsKey('desc')
            ? dataMap['desc']
            : "Lorem ipsum dolor sit amet, consectetur adipiscing elit",
        price = dataMap['price'],
        img = dataMap['img'],
        tags = dataMap['tags'];
}
