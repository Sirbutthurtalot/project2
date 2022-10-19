import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../widgets/top_bar.dart';
import '../services/product_service.dart';
import '../providers/providers.dart';

class ShoppingCart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      if (constraints.maxWidth < 600) {
        return PhoneLayout();
      } else if (constraints.maxWidth < 1200) {
        return LaptopLayout();
      } else {
        return DesktopLayout();
      }
    });
  }
}

class PhoneLayout extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Product> products = ref.watch(cartProvider);
    return Scaffold(
        appBar: TopBar(),
        body: Center(
            child: Container(
                padding: const EdgeInsets.all(16),
                child: products.isEmpty
                    ? const Center(child: Text("Shopping Cart is empty"))
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [CartContentDisplayer(), CheckoutBox()]))));
  }
}

class LaptopLayout extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Product> products = ref.watch(cartProvider);
    return Scaffold(
        appBar: TopBar(),
        body: Center(
            child: Container(
                padding: const EdgeInsets.all(16),
                child: products.isEmpty
                    ? const Center(child: Text("Shopping Cart is empty"))
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [CartContentDisplayer(), CheckoutBox()]))));
  }
}

class DesktopLayout extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Product> products = ref.watch(cartProvider);
    return Scaffold(
        appBar: TopBar(),
        body: Center(
            child: Container(
                padding: const EdgeInsets.all(16),
                width: 1200,
                child: products.isEmpty
                    ? const Center(child: Text("Shopping Cart is empty"))
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [CartContentDisplayer(), CheckoutBox()]))));
  }
}

class CartContentDisplayer extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Product> products = ref.watch(cartProvider);
    return Column(
        children: List.generate(products.length, (index) {
      Product p = products[index];
      return SizedBox(
          width: 400,
          child: Card(
              child: ListTile(
                  leading: Container(
                      padding: EdgeInsets.all(2),
                      child: Image(
                          height: 100, width: 100, image: NetworkImage(p.img))),
                  title: Row(children: [
                    Expanded(child: Text(p.name)),
                    Text(p.price.toString())
                  ]),
                  trailing: IconButton(
                      onPressed: () =>
                          ref.watch(cartProvider.notifier).remove(p),
                      icon: const Icon(Icons.delete)))));
    }));
  }
}

class CheckoutBox extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Product> products = ref.watch(cartProvider);
    double sum = products.isEmpty
        ? 0
        : products.map((p) => p.price).reduce((sum, p) => sum + p);
    return Container(
        padding: const EdgeInsets.all(16),
        child: Column(children: [
          Container(
              padding: EdgeInsets.all(8),
              child: Text("Total price: ${sum.toString()}")),
          ElevatedButton(
              onPressed: () => context.go("/checkout"),
              child: const Icon(Icons.shopping_cart_checkout))
        ]));
  }
}
