import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:custom_splash/custom_splash.dart';
import 'constants.dart';
import 'models/Product.dart';
import 'pages/Main_cards_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> app = Firebase.initializeApp();

  static List<Product> cartList;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'IA Card',
          theme: new ThemeData(
            scaffoldBackgroundColor: Colors.white,
            backgroundColor: Colors.white,
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
            home: MainCardsPage(),
            duration: 2500,
            type: CustomSplashType.StaticDuration,
          )),
    );
  }

  static Container searchBarBuilderStatic(
      TextEditingController _searchController) {
    return Container(
      width: 316,
      height: 40,
      child: TextField(
        maxLines: 1,
        textAlignVertical: TextAlignVertical.center,
        controller: _searchController,
        textInputAction: TextInputAction.done,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          //labelText: "Buscar",
          //hintText: "Guaraná",
          contentPadding: EdgeInsets.zero,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey[300], width: 2.0),
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: Color.fromRGBO(255, 161, 73, 1), width: 2.0),
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          prefixIcon: Icon(
            Icons.search,
            size: 35,
            color: Color.fromRGBO(255, 161, 73, 1),
          ),
          suffixIcon: _searchController.text.isEmpty
              ? Container(
                  width: 0,
                )
              : IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () => _searchController.clear(),
                ),
        ),
      ),
    );
  }
}

/*
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:custom_splash/custom_splash.dart';
import 'constants.dart';
import 'models/Product.dart';
import 'pages/card_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key key}) : super(key: key);

  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  static List<Product> cartList;

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
        home: FutureBuilder(
          future: _initialization,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return CustomSplash(
                imagePath: 'assets/images/logo.png',
                backGroundColor: Colors.orange,
                animationEffect: 'zoom-in',
                logoSize: 200,
                home: CardPage(),
                duration: 2500,
                type: CustomSplashType.StaticDuration,
              );
            } else {
              return Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }
          },
        ));
  }
}
*/