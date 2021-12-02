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
        margin: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: const Color(0xffEAEFF3))),
        child: Center(
          child: TextField(
            controller: widget.controller,
            decoration: InputDecoration(
              fillColor: white,
              labelText: 'Поиск',
              labelStyle: TextStyle(color: semiGrey),
              prefixIcon: const Icon(Icons.search),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 1, color: border),
                borderRadius: BorderRadius.circular(8),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 1, color: semiGrey),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ));
  }
}
