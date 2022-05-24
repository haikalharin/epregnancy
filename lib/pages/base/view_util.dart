import 'package:flutter/material.dart';

extension ViewUtil on String {
  showSnackbar(BuildContext context) {
    return Scaffold.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(content: Text(this)),
      );
  }
// ···
}

extension ViewUtil2 on BuildContext {
  showSnackbar(String message) {
    return Scaffold.of(this)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(content: Text(message)),
      );
  }
// ···
}

extension NumberParsing on String {
  int parseInt() {
    return int.parse(this);
  }

  double parseDouble() {
    return double.parse(this);
  }
}
