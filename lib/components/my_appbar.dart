import 'package:flutter/material.dart';
import 'package:stinger_web/pages/auth/login.dart';

import '../constants.dart';
import 'my_button.dart';

class MyAppBar extends StatefulWidget with PreferredSizeWidget {
  const MyAppBar({Key? key}) : super(key: key);

  @override
  _MyAppBarState createState() => _MyAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(80);
}

class _MyAppBarState extends State<MyAppBar> {
  static const menuItemsText = [
    'Проекты',
    'Новости',
    'Избранное',
    'Карта событий',
  ];
  static const menuItemsPages = [
    LogIn(),
    LogIn(),
    LogIn(),
    LogIn(),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 110,vertical: 10),
      child: Row(
        children: [
          Image.asset(
            'assets/icons/logo.png',
            fit: BoxFit.cover,
          ),
          const Spacer(flex: 1),
          for (int i = 0; i < menuItemsText.length; i++)
            SizedBox(
                width: 140,
                child: Text(
                  menuItemsText[i],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: text, fontSize: 16, fontWeight: FontWeight.w500),
                )),
          const Spacer(flex: 1),
          SizedBox(width: 140, height: 50, child: signInBtn(() {})),
        ],
      ),
    );
  }

  Widget signInBtn(onTap) => ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(
            horizontal: 40.0,
            vertical: 20.0,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          primary: Colors.white,
        ),
        onPressed: onTap,
        child: Center(
          child: Text(
            'Войти',
            style: TextStyle(
              fontStyle: FontStyle.normal,
              fontSize: 16,
              color: button,
            ),
          ),
        ),
      );

}
