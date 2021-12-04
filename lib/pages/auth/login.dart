import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
  SharedPreferences? preferences;

  TextEditingController email = TextEditingController(),
      password = TextEditingController();

  getData() async {
    preferences = await SharedPreferences.getInstance();
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

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

  bool isChecked = false;

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
            SizedBox(
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
                      preferences!.setBool('admin', isChecked);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MainPage(
                                    isAdmin: isChecked,
                                  )));
                      // FluroRouterClass.router.navigateTo(context, "/showcase",
                      //     transition: TransitionType.fadeIn);
                    },
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Checkbox(
                        checkColor: mainGreen,
                        activeColor: mainGreen,
                        value: isChecked,
                        onChanged: (bool? value) {
                          setState(() {
                            isChecked = value!;
                            preferences!.setBool('admin', value);
                            print(preferences!.getBool('admin'));
                          });
                        },
                      ),
                      const Text('Я - Администратор'),
                    ],
                  )
                ],
              ),
            ),
            RichText(
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
                                  builder: (context) =>
                                      const ForgotPassword())),
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
