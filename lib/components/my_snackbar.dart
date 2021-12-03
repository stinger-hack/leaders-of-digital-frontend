import 'package:flutter/material.dart';

import '../constants.dart';

class MySnackbar {
  static void show(context, String text) {
    var snackBar = SnackBar(
      content: text.isEmpty ? const Text('Что-то пошло не так') : Text(text),
      backgroundColor: mainGreen,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}