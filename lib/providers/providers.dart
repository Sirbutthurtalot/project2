import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../services/product_service.dart';

class ProductNotifier extends StateNotifier<List<Product>> {
  ProductNotifier() : super([]);

  addMany(String json) {
    var data = jsonDecode(json);
    var products = data['shop']['data'];
    print(products);
  }
}

final productProvider = StateNotifierProvider<ProductNotifier, List<Product>>(
    (ref) => ProductNotifier());

class CartNotifier extends StateNotifier<List<Product>> {
  CartNotifier() : super([]);

  add(Product product) {
    state = [...state, product];
  }

  remove(Product product) {
    List<Product> newState = state;
    newState.remove(product);
    state = [...newState];
  }

  removeAll() {
    state = [];
  }
}

final cartProvider =
    StateNotifierProvider<CartNotifier, List<Product>>((ref) => CartNotifier());

final categoryProvider = StateProvider<String?>((ref) => null);
