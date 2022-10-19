import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/providers.dart';

class ShoppingCartButton extends ConsumerWidget {
  final product;
  ShoppingCartButton(this.product);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
        padding: EdgeInsets.all(8),
        child: ElevatedButton(
            onPressed: () => ref.watch(cartProvider.notifier).add(product),
            child: const Icon(Icons.shopping_cart)));
  }
}
