import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ia_card/constants.dart';
import 'package:ia_card/pages/user_profile_page.dart';

class RestaurantHomePage extends StatelessWidget {
  const RestaurantHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 70,
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.white,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(25),
            ),
          ),
          title: new Text(
            'Painel do admin',
            style: GoogleFonts.passionOne(
                fontStyle: FontStyle.normal,
                fontSize: 40,
                color: K_PRIMARY_COLOR_LIGHT),
          ),
        ),
        body: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => UserPageSettings(
                      user: FirebaseAuth.instance.currentUser!)),
            );
          },
          child: Text("oi"),
        ));
  }
}
