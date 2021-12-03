import 'package:flutter/material.dart';
import 'package:stinger_web/pages/auth/login.dart';

import '../constants.dart';

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
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        children: [
          Image.asset(
            'assets/icons/logo.png',
            fit: BoxFit.cover,
          ),
          const Spacer(flex: 1),
          for (int i = 0; i < menuItemsText.length; i++)
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => menuItemsPages[i]));
              },
              child: SizedBox(
                  width: 140,
                  child: Text(
                    menuItemsText[i],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: text, fontSize: 16, fontWeight: FontWeight.w500),
                  )),
            ),
          const Spacer(flex: 1),
          SizedBox(
              width: 140,
              height: 50,
              child: Align(
                alignment: Alignment.centerRight,
                child: notificationBtn(12),
              )),
        ],
      ),
    );
  }

  Widget notificationBtn(int count) => Container(
        width: 60,
        height: 50,
        child: Stack(
          children: [
            IconButton(
                onPressed: onTapNotification,
                icon: Icon(
                  Icons.notifications_none,
                  size: 34,
                )),
            Positioned(
              left: 20,
              child: Container(
                width: 40,
                height: 25,
                decoration: BoxDecoration(
                  color: mainGreen,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Center(
                  child: Text(
                    count.toString(),
                    style: TextStyle(color: white, fontSize: 16),
                  ),
                ),
              ),
            ),
          ],
        ),
      );

  void onTapNotification() {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (BuildContext context) => Container()));
  }
}
