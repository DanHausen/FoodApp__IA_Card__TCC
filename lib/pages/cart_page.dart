import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CartPage extends StatelessWidget {
  static String routeName = "/cart";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(255, 161, 73, 1),
          toolbarHeight: 100,
          centerTitle: true,
          title: Column(
            children: [
              Text(
                'Seu carrinho',
                style: GoogleFonts.passionOne(
                    fontStyle: FontStyle.normal, fontSize: 40),
              ),
              Text("X items")
            ],
          ),
        ),
        body: Column(children: [
          //TODO página do carrinho para mostrar os produtos adicionados
        ]));
  }
}
