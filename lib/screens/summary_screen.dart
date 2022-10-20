import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../widgets/top_bar.dart';
import '../widgets/product_lister.dart';
import '../providers/providers.dart';
import '../services/product_service.dart';

class SummaryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: TopBar(),
        body: SingleChildScrollView(child: Center(child: LayoutBuilder(
            builder: ((BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth < 600) {
            return PhoneLayout();
          } else if (constraints.maxWidth < 1200) {
            return LaptopLayout();
          } else {
            return DesktopLayout();
          }
        })))));
  }
}

class PhoneLayout extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Product> products = ref.watch(summaryProvider);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SummaryText(),
        ProductLister(products),
      ],
    );
  }
}

class LaptopLayout extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Product> products = ref.watch(summaryProvider);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SummaryText(),
        ProductLister(products),
      ],
    );
  }
}

class DesktopLayout extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Product> products = ref.watch(summaryProvider);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SummaryText(),
        ProductLister(products),
      ],
    );
  }
}

class SummaryText extends StatelessWidget {
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(16), child: const Text("You ordered :"));
  }
}
