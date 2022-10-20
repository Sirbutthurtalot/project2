import 'package:dad_project_2/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../widgets/top_bar.dart';
import '../widgets/credit_card.dart';
import '../widgets/payment_selector.dart';

class CheckoutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: TopBar(),
        body: LayoutBuilder(
            builder: ((BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth < 600) {
            return PhoneLayout();
          } else if (constraints.maxWidth < 1200) {
            return LaptopLayout();
          } else {
            return DesktopLayout();
          }
        })));
  }
}

class PhoneLayout extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
        child: Container(
            padding: const EdgeInsets.all(16),
            child: Column(children: [
              PaymentSelector(),
              Container(padding: EdgeInsets.all(16), child: PaymentOption()),
              CheckoutButton()
            ])));
  }
}

class LaptopLayout extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
        child: Container(
            padding: const EdgeInsets.all(16),
            child: Column(children: [
              PaymentSelector(),
              Container(
                  width: 700,
                  padding: EdgeInsets.all(16),
                  child: PaymentOption()),
              CheckoutButton()
            ])));
  }
}

class DesktopLayout extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
        child: Container(
            padding: const EdgeInsets.all(16),
            child: Container(
                width: 800,
                child: Column(children: [
                  PaymentSelector(),
                  PaymentOption(),
                  CheckoutButton()
                ]))));
  }
}

class PaymentOption extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String? paymentOption = ref.watch(paymentProvider);
    return paymentOption != null && paymentOption.contains('settings')
        ? CreditCard()
        : const SizedBox.shrink();
  }
}

class CheckoutButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(16),
        child: ElevatedButton(
            onPressed: () => context.go('/summary'), child: Text("Checkout")));
  }
}
