import 'package:flutter/material.dart';

import '../constants.dart';

class MySearchField extends StatefulWidget {
  final TextEditingController controller;

  const MySearchField({Key? key, required this.controller}) : super(key: key);

  @override
  _MySearchFieldState createState() => _MySearchFieldState();
}

class _MySearchFieldState extends State<MySearchField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.5,
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
              borderRadius: BorderRadius.circular(16),
            ),
            child: Center(
              child: TextField(
                controller: widget.controller,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: white,
                  labelText: 'Поиск',
                  labelStyle: TextStyle(color: semiGrey),
                  prefixIcon: const Icon(Icons.search),
                  hoverColor: white,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: white),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: mainGreen),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ),
          ),
          const Spacer(),
          findButton(),
          const Spacer(),
          createRequestButton(),
        ],
      ),
    );
  }

  Widget findButton() => Container(
        height: 50,
        width: 190,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            primary: white,
          ),
          onPressed: () {},
          child: Center(
            child: FittedBox(
              fit: BoxFit.cover,
              child: Text(
                'Найти',
                style: TextStyle(
                  fontStyle: FontStyle.normal,
                  fontSize: 20,
                  color: text,
                ),
              ),
            ),
          ),
        ),
      );

  Widget createRequestButton() => Container(
        height: 50,
        width: 190,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            primary: white,
          ),
          onPressed: () {},
          child: Center(
            child: FittedBox(
              fit: BoxFit.cover,
              child: Text(
                'Создать заявку',
                style: TextStyle(
                  fontStyle: FontStyle.normal,
                  fontSize: 20,
                  color: text,
                ),
              ),
            ),
          ),
        ),
      );
}
