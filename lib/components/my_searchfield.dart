import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stinger_web/create_project/create_project_page.dart';
import 'package:stinger_web/pages/favorites/compare.dart';

import '../constants.dart';

class MySearchField extends StatefulWidget {
  final TextEditingController controller;
  final bool isFavorite;

  const MySearchField({
    Key? key,
    required this.controller,
    this.isFavorite = false
  }) : super(key: key);

  @override
  _MySearchFieldState createState() => _MySearchFieldState();
}

class _MySearchFieldState extends State<MySearchField>{
  final ContainerTransitionType _transitionType = ContainerTransitionType.fade;
  SharedPreferences? preferences;
bool isAdmin = false;
  getData() async {
    preferences = await SharedPreferences.getInstance();
    isAdmin = preferences!.getBool('admin')!;
    setState(() {});
  }

  @override
  void initState() {
    getData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          child: Container(
              height: 50,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: shadow,
                    blurRadius: 1,
                    spreadRadius: 1,
                    offset: const Offset(0, 1),
                  ),
                ],
                borderRadius: BorderRadius.circular(20),
              ),
              child: TextField(
                controller: widget.controller,
                onChanged: (text) {

                },
                decoration: InputDecoration(
                  filled: true,
                  fillColor: white,
                  labelText: 'Поиск',
                  labelStyle: TextStyle(color: semiGrey),
                  prefixIcon: const Icon(Icons.search),
                  hoverColor: white,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: white),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: mainGreen),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              )
          )
        ),
        const SizedBox(width: 40),
        GestureDetector(
            onTap: () {},
            child: Container(
                height: 48,
                width: 170,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: const [BoxShadow(
                        offset: Offset(0, 2),
                        blurRadius: 2,
                        spreadRadius: 1,
                        color: Color.fromRGBO(0, 0, 0, 0.05)
                    )]
                ),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("images/filter.png"),
                      const SizedBox(width: 6),
                      const Text(
                          "Фильтры",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: Color(0xff25222C)
                          )
                      )
                    ]
                )
            )
        ),
        if(isAdmin) const SizedBox(width: 40),
        if(isAdmin) OpenContainer(
          transitionType: _transitionType,
          openBuilder: (BuildContext context, VoidCallback _) {
            return widget.isFavorite ? const ComparePage() : const CreateProjectPage();
          },
          closedElevation: 6.0,
          closedShape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(28.0)
            )
          ),
          closedColor: Theme.of(context).colorScheme.secondary,
          closedBuilder: (BuildContext context, VoidCallback openContainer) {
            return Container(
                height: 48,
                width: 170,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(14),
                    boxShadow: const [BoxShadow(
                        offset: Offset(0, 2),
                        blurRadius: 10,
                        color: Color.fromRGBO(0, 0, 0, 0.05)
                    )]
                ),
                child: Text(
                    widget.isFavorite ? "Сравнить" : "Загрузить",
                    style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: Color(0xff25222C)
                    )
                )
            );
          },
        )
      ]
    );
  }
}
