import 'package:flutter/material.dart';
import '../constants.dart';

class MyTextField extends StatelessWidget {
  final String txt;
  final String icon;
  final String hintText;
  final String errorText;
  final TextEditingController controller;
  final ValueChanged onChanged;
  final bool isPassword;

  MyTextField({
    this.txt = "",
    this.icon = "",
    this.hintText = "",
    this.errorText = "",
    required this.controller,
    required this.onChanged,
    this.isPassword = false,
  });

  @override
  Widget build(BuildContext context) =>
      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
            width: double.infinity,
            padding: const EdgeInsets.only(left: 16),
            decoration: BoxDecoration(
              color: const Color(0xFFF4F4F4),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(children: [
              const SizedBox(width: 13.2),
              SizedBox(
                  width: 250,
                  child: TextFormField(
                      controller: controller,
                      onChanged: onChanged,
                      obscureText: isPassword,
                      cursorColor: text,
                      decoration: InputDecoration(
                          fillColor: Colors.red,
                          border: InputBorder.none,
                          hintText: hintText,
                          hintStyle: TextStyle(
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                              color: semiText))))
            ])),
        Text(errorText,
            style: const TextStyle(
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.normal,
                fontSize: 12,
                color: Colors.red))
      ]);
}
