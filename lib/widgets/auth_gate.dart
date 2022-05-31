import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ia_card/pages/Customer/client_home_page.dart';
import 'package:ia_card/pages/Restaurant/Restaurant_home_page.dart';
import 'package:ia_card/pages/signup.dart';
import 'package:ia_card/widgets/custom_sign_in_widget.dart';

class AuthGate extends StatelessWidget {
  AuthGate({Key? key}) : super(key: key);
  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  Future<User> handleSignInEmail(String email, String password) async {
    UserCredential result =
        await auth.signInWithEmailAndPassword(email: email, password: password);

    final User user = result.user!;
    return user;
  }

  Future<User> handleSignUp(String email, String password, _formType,
      {String? restaurantName}) async {
    UserCredential result = await auth.createUserWithEmailAndPassword(
        email: email, password: password);
    User user = result.user!;

    if (_formType == FormType.restaurant) {
      await FirebaseFirestore.instance
          .collection(restaurantName.toString())
          .add({
        'email': email,
        'uid': result.user!.uid,
        'created_at': DateTime.now(),
      });
    } else if (_formType == FormType.costumer) {
      await FirebaseFirestore.instance.collection('COSTUMER').add({
        'email': email,
        'uid': result.user!.uid,
        'created_at': DateTime.now(),
      });
    }
    return user;
  }

  Future<void> navigateRoute(BuildContext context) async {
    CollectionReference _collectionRef =
        FirebaseFirestore.instance.collection('COSTUMER');
    QuerySnapshot querySnapshot = await _collectionRef.get();
    final allData = querySnapshot.docs.map((doc) => doc['email']).toList();

    print(allData);

    if (FirebaseAuth.instance.currentUser == null) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => CustomSignInWidget()),
        (Route<dynamic> route) => false,
      );
    } else if (allData.contains(FirebaseAuth.instance.currentUser!.email) ==
        true) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
            builder: (context) =>
                HomePage(user: FirebaseAuth.instance.currentUser!)),
        (Route<dynamic> route) => false,
      );
    } else if (allData.contains(FirebaseAuth.instance.currentUser!.email) ==
        false) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => RestaurantHomePage()),
        (Route<dynamic> route) => false,
      );
    }
  }
}
