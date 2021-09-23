import 'package:flutter/material.dart';
import 'package:custom_splash/custom_splash.dart';
import 'pages/card_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'IA Card',
        theme: new ThemeData(scaffoldBackgroundColor: const Color(0xFFEFEFEF)),
        home: CustomSplash(
          imagePath: 'assets/images/logo.png',
          backGroundColor: Color.fromRGBO(255, 161, 73, 1),
          animationEffect: 'zoom-in',
          logoSize: 200,
          home: CardPage(),
          duration: 2500,
          type: CustomSplashType.StaticDuration,
        ));
  }
}
