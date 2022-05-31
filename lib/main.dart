import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ia_card/firebase_options.dart';
import 'package:ia_card/pages/Sign_page.dart';
import 'constants.dart';
import 'models/Product.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> app =
      Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  static late List<Product> cartList;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        //title: 'Food Card',
        theme: new ThemeData(
          scaffoldBackgroundColor: Colors.white,
          backgroundColor: Colors.white,
          textTheme: TextTheme(
            bodyText1: TextStyle(color: kTextColorMedium),
            bodyText2: TextStyle(color: kTextColorMedium),
          ),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: LoginScreen(),
      ),
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
            borderSide: BorderSide(color: kTextColorLight, width: 2.0),
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: kPrimaryLightColor, width: 2.0),
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          prefixIcon: Icon(
            Icons.search,
            size: 35,
            color: kPrimaryLightColor,
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
