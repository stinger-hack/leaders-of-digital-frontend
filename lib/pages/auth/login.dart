import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:stinger_web/components/my_button.dart';
import 'package:stinger_web/components/my_textfield.dart';
import 'package:stinger_web/pages/showcase/showcase_page.dart';
import '../../constants.dart';
import '../main_page.dart';
import 'auth.dart';
import 'forgot_passwort.dart';

class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> with SingleTickerProviderStateMixin {
  bool canGetName = false, canGetPassword = false;
  String errorName = "", errorPassword = "";

  TextEditingController email = TextEditingController(),
      password = TextEditingController();

  void checkCanGetPassword(String value) {
    if (value.isNotEmpty) {
      setState(() {
        canGetPassword = true;
        canGetName = true;
      });
    } else {
      setState(() {
        canGetPassword = false;
        canGetName = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthPage(
        width: 480,
        height: 500,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            FittedBox(
              child: Text(
                "Добро пожаловать!",
                style: TextStyle(
                  fontStyle: FontStyle.normal,
                  fontSize: 32,
                  color: text,
                ),
              ),
            ),
            Text(
              "Войдите, чтобы продолжить",
              style: TextStyle(
                fontStyle: FontStyle.normal,
                fontSize: 14,
                color: semiText,
              ),
            ),
            Container(
              width: 300,
              child: Column(
                children: [
                  MyTextField(
                    controller: email,
                    onChanged: (value) => checkCanGetPassword(value),
                    hintText: "Логин (email)",
                    errorText: errorName,
                  ),
                  MyTextField(
                      controller: password,
                      onChanged: (value) => checkCanGetPassword(value),
                      hintText: "Пароль",
                      errorText: errorPassword,
                      isPassword: true),
                  MyButton(
                    txt: 'Войти',
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MainPage()));
                      // FluroRouterClass.router.navigateTo(context, "/showcase",
                      //     transition: TransitionType.fadeIn);


                      // bool canSignUp = true;
                      // if (canGetName) {
                      //   setState(() => errorName = "");
                      // } else {
                      //   setState(() {
                      //     errorName = "Пустое поле недопустимо";
                      //     canSignUp = false;
                      //   });
                      // }
                      // if (canGetPassword) {
                      //   setState(() => errorPassword = "");
                      // } else {
                      //   setState(() {
                      //     errorPassword = "Не указан пароль";
                      //     canSignUp = false;
                      //   });
                      // }
                      // if (canSignUp) {
                      //   //signUp();
                      // }
                    },
                  ),
                ],
              ),
            ),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: TextStyle(
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: text),
                children: <TextSpan>[
                  TextSpan(
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ForgotPassword())), //
                      text: 'Забыли пароль?',
                      style:
                          TextStyle(color: mainGreen, fontFamily: 'Montserrat'))
                ],
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
          ],
        ),
      ),
    );
  }
}
