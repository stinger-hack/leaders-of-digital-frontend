import 'package:flutter/material.dart';
import 'package:stinger_web/pages/favorites/favorites_page.dart';
import 'package:stinger_web/pages/map.dart';
import 'package:stinger_web/pages/news.dart';
import 'package:stinger_web/pages/showcase/showcase_page.dart';

import '../constants.dart';

class MyAppBar extends StatefulWidget with PreferredSizeWidget {
  final int selectedPage;
  const MyAppBar({Key? key, required this.selectedPage}) : super(key: key);

  @override
  _MyAppBarState createState() => _MyAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(70);
}

class _MyAppBarState extends State<MyAppBar> {
  static const menuItemsText = [
    'Проекты',
    'Новости',
    'Избранное',
    'Карта событий',
  ];
  static final menuItemsPages = [
    ShowcasePage(),
    NewsPage(),
    FavoritesPage(),
    GoogleMap(),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
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
                // FluroRouterClass.router.navigateTo(context, menuItemsPages[i].toString(),
                //     transition: TransitionType.fadeIn);
              },
              child: SizedBox(
                  width: 140,
                  child: Column(
                    children: [
                      Text(
                        menuItemsText[i],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: text,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                      widget.selectedPage == i ? Container(
                        width: 60,
                        height: 1.5,
                        color: mainGreen,
                      ) : Container()
                    ],
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
                icon: const Icon(
                  Icons.notifications_none,
                  size: 30,
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
