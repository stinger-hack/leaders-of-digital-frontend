import 'package:flutter/material.dart';
import 'package:stinger_web/pages/auth/login.dart';

/// Точка запуска приложения
void main() {
  runApp(MaterialApp(
      theme: ThemeData(
        fontFamily: 'Montserrat',
      ),
      home: const LogIn()));
}
