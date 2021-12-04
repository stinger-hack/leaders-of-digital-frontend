import 'package:flutter/material.dart';

/// Кнопка скачивания файлов
class MyDownload extends StatelessWidget {
  const MyDownload({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
      height: 33,
      width: 119,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(22)
      ),
      child: const Text(
          "Скачать",
          style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14,
              color: Color(0xff009A96)
          )
      )
  );
}