import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ia_card/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ia_card/pages/initial_sign_redirect_page.dart';

class RestaurantPageSettings extends StatelessWidget {
  const RestaurantPageSettings({Key? key, required this.user})
      : super(key: key);

  final User user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        elevation: 1,
        centerTitle: true,
        title: Column(
          children: [
            Text(
              'Usuário',
              style: GoogleFonts.passionOne(
                  fontStyle: FontStyle.normal, fontSize: 40),
            ),
          ],
        ),
        backgroundColor: K_PRIMARY_COLOR_LIGHT,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(25),
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Text(user.email!, style: TextStyle(fontSize: 20)),
          SizedBox(
            height: 20,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: K_PRIMARY_COLOR_LIGHT,
                elevation: 0.0,
              ),
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                  (Route<dynamic> route) => false,
                );
              },
              child: Text("Log Out"),
            ),
          ),
        ],
      ),
    );
  }
}
