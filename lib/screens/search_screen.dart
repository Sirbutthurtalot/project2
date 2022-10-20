import 'package:dad_project_2/widgets/product_displayer_vertical.dart';
import 'package:dad_project_2/widgets/top_bar.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String searchWord = "";
  @override
  Widget build(BuildContext) {
    return Scaffold(
        appBar: TopBar(),
        body: SingleChildScrollView(
            child: Center(
                child: Container(
                    padding: EdgeInsets.all(8),
                    width: 600,
                    child: Column(
                      children: [
                        Container(
                            padding: EdgeInsets.all(16),
                            child: TextField(
                              decoration: const InputDecoration(
                                  icon: Icon(Icons.search),
                                  hintText: "Type words here",
                                  labelText: "Search"),
                              onChanged: (String value) => setState(() {
                                searchWord = value;
                              }),
                            )),
                        ProductDisplayerVertical(searchWord, true)
                      ],
                    )))));
  }
}
