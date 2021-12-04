import 'package:flutter/material.dart';
import 'package:stinger_web/pages/favorites/favorites_page.dart';
import 'package:stinger_web/pages/map/map.dart';
import 'package:stinger_web/pages/notifications.dart';
import 'package:stinger_web/pages/showcase/full_project_card.dart';
import 'package:stinger_web/pages/showcase/showcase_page.dart';

import 'my_project/my_projects_page.dart';
import 'news/news_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key, this.isAdmin = false}) : super(key: key);

  final bool isAdmin;

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin {
  TabController? tabController;
  int _index = 0;

  bool isNotification = false;

  @override
  void initState() {
    tabController = TabController(length: widget.isAdmin ? 5 : 4, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
          body: Stack(children: [
        Image.asset("images/backAuth.png",
            fit: BoxFit.cover,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width),
        SingleChildScrollView(
            child: Column(children: [
          Padding(
              padding: const EdgeInsets.only(
                  top: 38, left: 110, right: 94, bottom: 46),
              child: Row(children: [
                Image.asset("images/fund.png", height: 50, width: 146),
                const SizedBox(width: 169),
                Expanded(
                    child: TabBar(
                        controller: tabController,
                        physics: const NeverScrollableScrollPhysics(),
                        indicatorColor: const Color(0xff009A96),
                        isScrollable: true,
                        onTap: (index) => _index = index,
                        tabs: [
                      tabBarTab("Проекты"),
                      tabBarTab("Новости"),
                      tabBarTab("Избранное"),
                      if (widget.isAdmin) tabBarTab("Мои проекты"),
                      tabBarTab("События")
                    ])),
                GestureDetector(
                    onTap: () {
                      setState(() {
                        isNotification = !isNotification;
                      });
                    },
                    child: Container(
                        height: 46,
                        width: 60,
                        color: Colors.transparent,
                        child: Stack(children: [
                          Positioned(
                              left: 0,
                              bottom: 0,
                              child: Container(
                                  height: 44,
                                  width: 44,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: isNotification
                                          ? const Color(0xff009A96)
                                          : Colors.white,
                                      borderRadius: BorderRadius.circular(22),
                                      boxShadow: const [
                                        BoxShadow(
                                            offset: Offset(0, 2),
                                            blurRadius: 10,
                                            color:
                                                Color.fromRGBO(0, 0, 0, 0.05))
                                      ]),
                                  child: Image.asset("images/bell.png",
                                      color: isNotification
                                          ? Colors.white
                                          : const Color(0xff25222C),
                                      height: 20,
                                      width: 18))),
                          Positioned(
                              top: 0,
                              right: 0,
                              child: Container(
                                  height: 24,
                                  width: 40,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: isNotification
                                          ? Colors.white
                                          : const Color(0xff009A96),
                                      borderRadius: BorderRadius.circular(16),
                                      boxShadow: const [
                                        BoxShadow(
                                            offset: Offset(0, 4),
                                            blurRadius: 4,
                                            color:
                                                Color.fromRGBO(0, 0, 0, 0.05))
                                      ]),
                                  child: Text("7",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16,
                                          color: isNotification
                                              ? const Color(0xff009A96)
                                              : Colors.white))))
                        ])))
              ])),
          SizedBox(
              height: MediaQuery.of(context).size.height - 136,
              child: TabBarView(controller: tabController, children: [
                const ShowcasePage(),
                const NewsPage(),
                const FavoritesPage(),
                if (widget.isAdmin) const MyProjectsPage(),
                isNotification ? NotificationsPage() : const GoogleMap()
              ]))
        ]))
      ]));

  Container tabBarTab(String text) => Container(
      width: 114,
      child: Tab(
          child: Text(text,
              style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  color: Color(0xff25222C)))));
}
