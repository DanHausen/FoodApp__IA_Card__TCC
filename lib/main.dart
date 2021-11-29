import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:custom_splash/custom_splash.dart';
import 'constants.dart';
import 'pages/card_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FirebaseApp app = await Firebase.initializeApp();
  runApp(MyApp(app: app));
}

class MyApp extends StatelessWidget {
  final FirebaseApp app;
  MyApp({this.app});

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
          home: CardPage(app: app),
          duration: 2500,
          type: CustomSplashType.StaticDuration,
        ));
  }
}
