import 'package:flutter/material.dart';

import '../widgets/top_bar.dart';
import '../widgets/category_displayer.dart';

class HomeScreen extends StatelessWidget {
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

class PhoneLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: TopBar(),
        body: SingleChildScrollView(
            child: Center(
                child: Container(
                    width: 1200,
                    child: Column(children: [
                      Container(
                          padding: const EdgeInsets.all(8),
                          child: const Text(
                              textScaleFactor: 3, "Welcome to Cube Shop")),
                      CategoryDisplayer('vertical'),
                    ])))));
  }
}

class LaptopLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: TopBar(),
        body: SingleChildScrollView(
            child: Center(
                child: Container(
                    width: 1200,
                    child: Column(children: [
                      Container(
                          padding: const EdgeInsets.all(8),
                          child: const Text(
                              textScaleFactor: 3, "Welcome to Cube Shop")),
                      CategoryDisplayer('horizontal'),
                    ])))));
  }
}

class DesktopLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: TopBar(),
        body: SingleChildScrollView(
            child: Center(
                child: Container(
                    width: 1200,
                    child: Column(children: [
                      Container(
                          padding: const EdgeInsets.all(8),
                          child: const Text(
                              textScaleFactor: 3, "Welcome to Cube Shop")),
                      CategoryDisplayer('horizontal'),
                    ])))));
  }
}
