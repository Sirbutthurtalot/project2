import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/providers.dart';

class PaymentSelector extends ConsumerWidget {
  final List<String> list = ["Credit Card from settings", "Online Bank"];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String? dropdownValue = ref.watch(paymentProvider);
    return DropdownButton<String>(
      hint: const Text("Choose a payment option"),
      value: dropdownValue,
      onChanged: (String? value) {
        // This is called when the user selects an item.
        ref.watch(paymentProvider.notifier).update((state) => value);
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
