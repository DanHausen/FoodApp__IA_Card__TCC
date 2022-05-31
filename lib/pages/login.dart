import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ia_card/constants.dart';
import 'package:ia_card/pages/signup.dart';
import 'package:ia_card/widgets/auth_gate.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  var authHandler = new AuthGate();
  final user = FirebaseAuth.instance.currentUser;

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              size: 20,
              color: Colors.white,
            )),
        toolbarHeight: 70,
        elevation: 0,
        centerTitle: true,
        backgroundColor: kPrimaryLightColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(25),
          ),
        ),
        title: new Text(
          'Login',
          style: GoogleFonts.passionOne(
              fontStyle: FontStyle.normal, fontSize: 40, color: Colors.white),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height -
                70 -
                MediaQuery.of(context).padding.top,
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  child: Column(
                    children: [
                      makeInput(label: "Email", ctrl: emailController),
                      makeInput(
                          label: "Password",
                          obsureText: true,
                          ctrl: passwordController),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  child: ElevatedButton(
                    onPressed: () {
                      authHandler
                          .handleSignInEmail(emailController.text.toLowerCase(),
                              passwordController.text)
                          .then((user) {
                        authHandler.navigateRoute(context);
                      }).catchError((e) => print(e));
                    },
                    style: ElevatedButton.styleFrom(
                      //alignment: Alignment.centerLeft,
                      primary: kPrimaryLightColor,
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
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Dont have an account? "),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => SignupPage()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        //alignment: Alignment.centerLeft,
                        primary: Colors.white,
                        elevation: 0.0,
                      ),
                      child: Text(
                        "Sign Up",
                        style: GoogleFonts.acme(
                          color: kPrimaryLightColor,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w300,
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget makeInput({label, obsureText = false, ctrl}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        label,
        style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w900,
            color: kPrimaryLightColor),
      ),
      SizedBox(
        height: 5,
      ),
      TextField(
        controller: ctrl,
        obscureText: obsureText,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: kTextColorMedium,
            ),
          ),
          border: OutlineInputBorder(
              borderSide: BorderSide(color: kTextColorMedium)),
        ),
      ),
      SizedBox(
        height: 30,
      )
    ],
  );
}
