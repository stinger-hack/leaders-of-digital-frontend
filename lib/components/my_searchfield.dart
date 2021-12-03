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
        height: 50,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: shadow,
              blurRadius: 2,
              spreadRadius: 1,
              offset: Offset(0, 2),
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
        ));
  }
}
