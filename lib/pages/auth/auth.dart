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
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 15.0, sigmaY: 15.0),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.grey),
                    boxShadow: [BoxShadow(color: shadow, blurRadius: 20)],
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
          ),
        ],
      ),
    );
  }
}
