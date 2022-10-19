import 'package:dad_project_2/widgets/top_bar.dart';
import 'package:flutter/material.dart';

import '../widgets/remembering_text_field.dart';

class UserScreen extends StatefulWidget {
  @override
  State<UserScreen> createState() => _UserState();
}

class _UserState extends State<UserScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: TopBar(),
        body: Form(
            child: Column(children: [
          RememberingTextField("name"),
          RememberingTextField("address"),
          const Padding(
              padding: EdgeInsets.all(16),
              child: ElevatedButton(onPressed: null, child: Text("Save")))
        ])));
  }
}