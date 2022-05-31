import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ia_card/constants.dart';
import 'package:ia_card/pages/login.dart';
import 'package:ia_card/widgets/auth_gate.dart';

class SignupPage extends StatefulWidget {
  @override
  State<SignupPage> createState() => _SignupPageState();
}

enum FormType { costumer, restaurant }

class _SignupPageState extends State<SignupPage> {
  FormType? formType = FormType.costumer;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final restaurantNameController = TextEditingController();
  final user = FirebaseAuth.instance.currentUser;
  var authHandler = new AuthGate();

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
              color: kPrimaryLightColor,
            )),
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
          'Sign Up',
          style: GoogleFonts.passionOne(
              fontStyle: FontStyle.normal,
              fontSize: 40,
              color: kPrimaryLightColor),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height -
            70 -
            MediaQuery.of(context).padding.top,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Create an Account, Its free",
              style: TextStyle(
                fontSize: 15,
                color: Colors.grey[700],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 0),
              child: Column(
                children: [
                  makeInput(
                    label: "Email",
                    ctrl: emailController,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  makeInput(
                    label: "Password",
                    obsureText: true,
                    ctrl: passwordController,
                  ),
                  formType == FormType.restaurant
                      ? SizedBox(
                          height: 20,
                        )
                      : Container(),
                  formType == FormType.restaurant
                      ? makeInput(
                          label: "Restaurant name",
                          ctrl: restaurantNameController,
                        )
                      : Container(),
                  SizedBox(
                    height: 15,
                  ),
                  //makeInput(label: "Confirm Paswor
                  ListTile(
                    contentPadding: EdgeInsets.all(0),
                    horizontalTitleGap: 5,
                    minVerticalPadding: 0,
                    title: Text(
                      "Costumer",
                      style: TextStyle(color: kTextColorHard),
                    ),
                    leading: Radio<FormType>(
                      fillColor: MaterialStateColor.resolveWith(
                          (states) => kPrimaryLightColor),
                      value: FormType.costumer,
                      groupValue: formType,
                      onChanged: (FormType? value) {
                        setState(() {
                          formType = value;
                        });
                      },
                    ),
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.all(0),
                    horizontalTitleGap: 5,
                    minVerticalPadding: 0,
                    title: Text(
                      "Restaurant",
                      style: TextStyle(color: kTextColorHard),
                    ),
                    leading: Radio<FormType>(
                      fillColor: MaterialStateColor.resolveWith(
                          (states) => kPrimaryLightColor),
                      value: FormType.restaurant,
                      groupValue: formType,
                      onChanged: (FormType? value) {
                        setState(() {
                          formType = value;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 40, right: 40, top: 20),
              child: ElevatedButton(
                onPressed: () {
                  authHandler
                      .handleSignUp(emailController.text.toLowerCase(),
                          passwordController.text, formType,
                          restaurantName:
                              restaurantNameController.text.toLowerCase())
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
                  ">  Sign Up  <",
                  style: GoogleFonts.acme(
                    color: Colors.white,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w300,
                    fontSize: 26.0,
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already have an account? "),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    //alignment: Alignment.centerLeft,
                    primary: Colors.white,
                    elevation: 0.0,
                  ),
                  child: Text(
                    "Login",
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
    );
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
      ],
    );
  }
}
