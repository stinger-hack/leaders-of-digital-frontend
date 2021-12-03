import 'package:flutter/material.dart';
import 'package:stinger_web/pages/auth/login.dart';
import 'package:stinger_web/pages/showcase/full_project_card.dart';
import 'package:stinger_web/pages/showcase/showcase_page.dart';
import 'package:stinger_web/router.dart';

import 'models/favorite_model.dart';

void main() {
  //FluroRouterClass.setupRouter();
  runApp(MaterialApp(
      //onGenerateRoute: FluroRouterClass.router.generator,
      theme: ThemeData(
        fontFamily: 'Montserrat',
      ),
      home: const LogIn()));
}
