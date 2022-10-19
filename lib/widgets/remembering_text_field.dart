import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RememberingTextField extends StatefulWidget {
  final String storageKey;
  RememberingTextField(this.storageKey);
  @override
  State<RememberingTextField> createState() => _TextState(storageKey);
}

class _TextState extends State<RememberingTextField> {
  final _controller = TextEditingController();
  final String key;
  _TextState(this.key);

  @override
  void initState() {
    super.initState();

    _controller.addListener(() {
      updateValue(key, _controller.text);
    });

    WidgetsBinding.instance.addPostFrameCallback(
        (_) => getValue(key).then((name) => _controller.text = name));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controller,
      decoration: InputDecoration(labelText: key),
    );
  }
}

Future<String> getValue(String s) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  if (prefs.containsKey(s)) {
    return prefs.getString(s)!;
  } else {
    return "";
  }
}

updateValue(String key, String value) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString(key, value);
}
