import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ia_card/widgets/CustomSignInWidget.dart';

import '../pages/Main_cards_page.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return CustomSignInWidget();
        }
        return MainCardsPage(user: snapshot.data!);
      },
    );
  }
}
