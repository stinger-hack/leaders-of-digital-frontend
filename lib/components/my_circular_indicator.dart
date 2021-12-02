import 'package:flutter/material.dart';
import 'package:stinger_web/constants.dart';

class Indicator {
  static Widget circle = Center(
      child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(myColor)));
}
