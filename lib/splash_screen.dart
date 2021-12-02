import 'package:flutter/material.dart';
import 'package:stinger_web/pages/auth/login.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const LogIn()));
          },
          child: const Text('Жопа, ахах'),
        ),
      ),
    );
  }
}
