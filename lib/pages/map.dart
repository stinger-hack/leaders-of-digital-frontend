import 'package:flutter/material.dart';

class GoogleMap extends StatelessWidget {
  const GoogleMap({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
        height: 700,
      child: HtmlElementView(viewType: "7")
    );
  }
}