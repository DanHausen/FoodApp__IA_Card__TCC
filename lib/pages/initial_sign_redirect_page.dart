import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ia_card/widgets/auth_gate.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final authHandler = new AuthGate();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      builder: (context, snapshot) {
        print(FirebaseAuth.instance.currentUser);
        authHandler.navigateRoute(context);
        return Container();
      },
    );
  }
}
