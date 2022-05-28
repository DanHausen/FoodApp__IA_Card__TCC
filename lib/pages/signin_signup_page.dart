import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:flutter/material.dart';
import 'package:ia_card/constants.dart';

import '../pages/Main_cards_page.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return SignInScreen(
            providerConfigs: const [
              EmailProviderConfiguration(),
            ],
            headerBuilder: (context, constraints, _) {
              return CircleAvatar(
                radius: 75,
                backgroundImage: AssetImage('assets/images/logo.png'),
              );
            },
            subtitleBuilder: (context, action) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Text(action == AuthAction.signIn
                    ? "Food Card Sign In"
                    : "Food Card Sign Up"),
              );
            },
            footerBuilder: (context, action) {
              return Text(
                  'By signing in, you agree to our terms and conditions.',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: kTextColorMedium));
            },
          );
        }
        return MainCardsPage(user: snapshot.data!);
      },
    );
  }
}
