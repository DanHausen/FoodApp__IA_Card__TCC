import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:ia_card/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutterfire_ui/auth.dart';

class UserPageSettings extends StatelessWidget {
  const UserPageSettings({Key? key, required this.user}) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
          const SignOutButton(),
        ]),
      ),
    );
  }
}
