import 'package:flutter/material.dart';
import 'package:stinger_web/pages/auth/login.dart';

void main() {
  //FluroRouterClass.setupRouter();
  runApp(MaterialApp(
      //onGenerateRoute: FluroRouterClass.router.generator,
      theme: ThemeData(
        fontFamily: 'Montserrat',
      ),
      home: const LogIn()));
}
