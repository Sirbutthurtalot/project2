import 'package:dad_project_2/widgets/top_bar.dart';
import 'package:flutter/material.dart';

import '../widgets/remembering_text_field.dart';
import '../widgets/credit_card.dart';

class UserScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: TopBar(),
        body: SingleChildScrollView(child: Form(child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth < 650) {
            return PhoneLayout();
          } else if (constraints.maxWidth < 800) {
            return LaptopLayout();
          } else {
            return DesktopLayout();
          }
        }))));
  }
}

class PhoneLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(16),
        child: Column(children: [
          Container(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 16), child: Settings()),
          CreditCard()
        ]));
  }
}

class LaptopLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DesktopLayout();
  }
}

class DesktopLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
            width: 800,
            color: Colors.grey[200],
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Container(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 64),
                    child: Settings()),
                CreditCard()
              ],
            )));
  }
}

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      RememberingTextField("Name"),
      RememberingTextField("Address"),
      /*
      const Padding(
          padding: EdgeInsets.all(16),
          child: ElevatedButton(onPressed: (null), child: Text("Save")))
      */
    ]);
  }
}
