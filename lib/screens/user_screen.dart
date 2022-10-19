import 'package:dad_project_2/widgets/top_bar.dart';
import 'package:flutter/material.dart';

import '../widgets/remembering_text_field.dart';

class UserScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: TopBar(),
        body: SingleChildScrollView(child: Form(child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth < 600) {
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
    return Container(padding: const EdgeInsets.all(16), child: Settings());
  }
}

class LaptopLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.grey[200],
        padding: const EdgeInsets.all(16),
        child: Settings());
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
            child: Settings()));
  }
}

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      RememberingTextField("name"),
      RememberingTextField("address"),
      const Padding(
          padding: EdgeInsets.all(16),
          child: ElevatedButton(onPressed: (null), child: Text("Save")))
    ]);
  }
}
