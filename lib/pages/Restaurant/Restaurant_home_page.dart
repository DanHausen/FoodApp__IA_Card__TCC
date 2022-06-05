import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ia_card/constants.dart';
import 'package:ia_card/pages/Restaurant/edit_menu.dart';
import 'package:ia_card/pages/Restaurant/pedidos_aguardando.dart';
import 'package:ia_card/pages/Restaurant/restaurant_profile_page.dart';
import 'package:ia_card/widgets/appBar.dart';

class RestaurantHomePage extends StatelessWidget {
  const RestaurantHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarWidget(
          textTitle: "Painel do admin",
          leading: IconButton(
            icon: Icon(Icons.person),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => RestaurantPageSettings(
                      user: FirebaseAuth.instance.currentUser!)),
            ),
          ),
        ),
        body: _bodyCreate(context));
  }

  _bodyCreate(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(height: 20),
          Container(
            width: MediaQuery.of(context).size.width * 0.75,
            height: 100,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                //alignment: Alignment.centerLeft,
                primary: K_PRIMARY_COLOR_LIGHT,
                minimumSize: Size(double.infinity, 42),
                elevation: 0.0,
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(15.0),
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => OrdersAwaiting()),
                );
              },
              child: Text(
                "Pedidos",
                style: GoogleFonts.passionOne(
                  color: Colors.white,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w400,
                  fontSize: 24.0,
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          Container(
            width: MediaQuery.of(context).size.width * 0.75,
            height: 100,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                //alignment: Alignment.centerLeft,
                primary: K_PRIMARY_COLOR_LIGHT,
                minimumSize: Size(double.infinity, 42),
                elevation: 0.0,
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(15.0),
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EditRestaurantMenu()),
                );
              },
              child: Text(
                "Editar cardápio",
                style: GoogleFonts.passionOne(
                  color: Colors.white,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w400,
                  fontSize: 24.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
