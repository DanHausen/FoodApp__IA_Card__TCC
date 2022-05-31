import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ia_card/constants.dart';
import 'package:ia_card/pages/Customer/client_home_page.dart';
import 'package:ia_card/pages/login.dart';
import 'package:ia_card/pages/signup.dart';

class CustomSignInWidget extends StatelessWidget {
  const CustomSignInWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomEmailSignInForm(),
    );
  }
}

class CustomEmailSignInForm extends StatelessWidget {
  CustomEmailSignInForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FirebaseAuth.instance.userChanges().listen((User? user) {
      if (user != null) {
        HomePage(user: user);
      }
    });
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        elevation: 1,
        centerTitle: true,
        backgroundColor: K_PRIMARY_COLOR_LIGHT,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(25),
          ),
        ),
        title: new Text(
          'Hello!',
          style: GoogleFonts.passionOne(
              fontStyle: FontStyle.normal, fontSize: 40, color: Colors.white),
        ),
      ),
      body: Body(),
    );
  }
}

class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                //alignment: Alignment.centerLeft,
                primary: K_PRIMARY_COLOR_LIGHT,
                minimumSize: Size(double.infinity, 42),
                elevation: 0.0,
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(15.0),
                ),
              ),
              child: Text(
                ">  Login  <",
                style: GoogleFonts.acme(
                  color: Colors.white,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w300,
                  fontSize: 26.0,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignupPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                //alignment: Alignment.centerLeft,
                primary: Colors.white,
                minimumSize: Size(MediaQuery.of(context).size.width / 3, 21),
                elevation: 0.0,
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(15.0),
                ),
              ),
              child: Text(
                "Sign Up",
                style: GoogleFonts.acme(
                  color: K_PRIMARY_COLOR_LIGHT,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w300,
                  fontSize: 16.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
