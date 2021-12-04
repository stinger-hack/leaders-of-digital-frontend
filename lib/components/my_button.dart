import 'package:flutter/material.dart';
import '../constants.dart';

class MyButton extends StatelessWidget {
  MyButton({required this.txt, required this.onTap});

  final String txt;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: shadow,
            offset: const Offset(0, 2),
            blurRadius: 2,
            spreadRadius: 1,
          )
        ],
        borderRadius: BorderRadius.circular(24),
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 20.0,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          primary: button,
        ),
        onPressed: onTap,
        child: Center(
          child: FittedBox(
            child: Text(
              txt,
              style: const TextStyle(
                fontStyle: FontStyle.normal,
                fontSize: 22,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class MyGreenButton extends StatelessWidget {
  MyGreenButton({required this.txt, required this.onTap});

  final String txt;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: shadow,
            offset: const Offset(0, 2),
            blurRadius: 2,
            spreadRadius: 1,
          )
        ],
        borderRadius: BorderRadius.circular(24),
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 20.0,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          primary: mainGreen,
        ),
        onPressed: onTap,
        child: Center(
          child: FittedBox(
            child: Text(
              txt,
              style: const TextStyle(
                fontStyle: FontStyle.normal,
                fontSize: 22,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class MyOutlinedButton extends StatelessWidget {
  MyOutlinedButton({required this.txt, required this.onTap});

  final String txt;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 190,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: 40.0),
          side: BorderSide(color: blueText),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          primary: white,
        ),
        onPressed: onTap,
        child: Center(
          child: FittedBox(
            fit: BoxFit.cover,
            child: Text(
              txt,
              style: TextStyle(
                fontStyle: FontStyle.normal,
                fontSize: 20,
                color: blueText,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class AdminTabButton extends StatelessWidget {
  AdminTabButton({required this.text, required this.onTap});

  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 48,
        width: 220,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 0,
              blurRadius: 20,
            ),
          ],
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 28,
              color: Color(0xFF192AA7),
            ),
          ),
        ),
      ),
    );
  }
}
