import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stinger_web/pages/showcase/showcase_page.dart';
import 'package:stinger_web/splash_screen.dart';

import 'models/favorite_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<FavoritesProvider>(
            create: (context) => FavoritesProvider()),
      ],
      child: MaterialApp(
        theme: ThemeData(
          fontFamily: 'Montserrat',
        ),
        home: const Scaffold(
          body: ShowcasePage(),
        ),
      ),
    );
  }
}
