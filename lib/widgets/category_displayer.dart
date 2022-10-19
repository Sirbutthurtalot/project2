import 'package:dad_project_2/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../services/product_service.dart';
import '../widgets/category_selector.dart';
import '../widgets/product_displayer_horizontal.dart';
import '../widgets/product_displayer_vertical.dart';

class CategoryDisplayer extends ConsumerWidget {
  final String axis;
  CategoryDisplayer(this.axis);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Future<List<String>> data = ProductService().getListOfCategories();
    String? cat = ref.watch(categoryProvider);
    String selectedCategory = cat == null ? "" : cat;
    return FutureBuilder(
        future: data,
        builder: (((context, snapshot) {
          if (snapshot.hasData) {
            List<String> categories = snapshot.data!;
            return Column(children: [
              CategorySelector(categories),
              axis == 'horizontal'
                  ? ProductDisplayerHorizontal(selectedCategory)
                  : ProductDisplayerVertical(selectedCategory)
            ]);
          } else {
            print(snapshot);
            return Text('Waiting for data!');
          }
        })));
  }
}
