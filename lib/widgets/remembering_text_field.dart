import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
      inputFormatters: formatter(key),
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

List<TextInputFormatter>? formatter(String key) {
  if (key == 'CVC/CVV') {
    return [
      FilteringTextInputFormatter.digitsOnly,
      LengthLimitingTextInputFormatter(3)
    ];
  } else if (key == 'Expiration Date') {
    return [
      FilteringTextInputFormatter.digitsOnly,
      LengthLimitingTextInputFormatter(4)
    ];
  } else if (key == 'Credit Card Number') {
    return [
      FilteringTextInputFormatter.digitsOnly,
      LengthLimitingTextInputFormatter(20)
    ];
  } else {
    return null;
  }
}
