import 'package:flutter/material.dart';
import 'package:ia_card/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ia_card/pages/Sign_page.dart';

class UserPageSettings extends StatelessWidget {
  const UserPageSettings({Key? key, required this.user}) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        elevation: 1,
        centerTitle: true,
        backgroundColor: kPrimaryLightColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(25),
          ),
        ),
      ),
      body: Center(
        child: Column(children: [
          Text(user.email!, style: TextStyle(fontSize: 20)),
          ElevatedButton(
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                  (Route<dynamic> route) => false,
                );
              },
              child: Text("oi")),
        ]),
      ),
    );
  }
}
