import 'package:flutter/material.dart';
import 'package:custom_splash/custom_splash.dart';
import 'constants.dart';
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
        theme: new ThemeData(
          scaffoldBackgroundColor: Colors.white,
          textTheme: TextTheme(
            bodyText1: TextStyle(color: kTextColor),
            bodyText2: TextStyle(color: kTextColor),
          ),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: CustomSplash(
          imagePath: 'assets/images/logo.png',
          backGroundColor: Colors.orange,
          animationEffect: 'zoom-in',
          logoSize: 200,
          home: CardPage(),
          duration: 2500,
          type: CustomSplashType.StaticDuration,
        ));
  }
}
