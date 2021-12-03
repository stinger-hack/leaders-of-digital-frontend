import 'dart:ui';
import 'package:flutter/material.dart';
import '../../constants.dart';
import '../../requests.dart';

/// Заглавный виджет авторизации пользователя
class AuthPage extends StatelessWidget {
  const AuthPage({
    required this.child,
    required this.width,
    required this.height,
    Key? key,
  }) : super(key: key);
  final Widget child;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/images/backAuth.png',
            fit: BoxFit.cover,
            width: 10000,
            height: 10000,
          ),
          Container(
            width: double.infinity,
            height: double.infinity,
          ),
          Center(
            child: ClipRRect(
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(color: shadow, blurRadius: 10, spreadRadius: 1)
                  ],
                  color: white,
                  borderRadius: BorderRadius.circular(20),
                ),
                margin: const EdgeInsets.all(20),
                height: height,
                width: width,
                child: Container(child: child),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
