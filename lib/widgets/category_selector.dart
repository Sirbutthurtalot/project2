import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/providers.dart';

class CategorySelector extends ConsumerWidget {
  final List<String> list;
  CategorySelector(this.list);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String? dropdownValue = ref.watch(categoryProvider);
    return DropdownButton<String>(
      hint: const Text("Choose a category"),
      value: dropdownValue,
      onChanged: (String? value) {
        // This is called when the user selects an item.
        ref.watch(categoryProvider.notifier).update((state) => value);
      },
      items: list.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
