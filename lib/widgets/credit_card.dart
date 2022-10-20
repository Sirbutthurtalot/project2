import 'package:flutter/material.dart';

import '../widgets/remembering_text_field.dart';

class CreditCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      if (constraints.maxWidth < 650) {
        return Column(children: [
          RememberingTextField('Credit Card Number'),
          RememberingTextField('Expiration Date'),
          RememberingTextField('CVC/CVV')
        ]);
      } else {
        return Column(children: [
          RememberingTextField('Credit Card Number'),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Container(
                width: 300, child: RememberingTextField('Expiration Date')),
            Container(width: 300, child: RememberingTextField('CVC/CVV'))
          ])
        ]);
      }
    });
  }
}
