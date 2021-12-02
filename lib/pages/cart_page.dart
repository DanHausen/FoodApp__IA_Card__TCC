import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ia_card/models/Cart.dart';

class CartPage extends StatefulWidget {
  static String routeName = "/cart";

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  var cartAmount = Cart.cartAmount;
  var cartLength = Cart.cartList.length;
  var cartList = Cart.cartList;

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
            Text("$cartAmount items")
          ],
        ),
      ),
      body: Container(
        child: new ListView.builder(
            itemCount: cartLength,
            itemBuilder: (BuildContext context, int index) =>
                buildCartCard(context, index)),
      ),
    );
  }

  Widget buildCartCard(BuildContext context, int index) {
    final cart = cartList[index];
    return new Container(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              Row(
                children: [
                  Text(cart["Name"],
                      style: new TextStyle(
                          fontSize: 25, fontWeight: FontWeight.bold)),
                  Spacer(),
                  TextButton(
                      child: Icon(Icons.delete),
                      onPressed: () {
                        setState(() {
                          Cart.DeleteSelectedCartItem(index);
                          cartLength = Cart.cartList.length;
                          cartAmount = Cart.cartAmount;
                        });
                      }),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Row(children: [
                  Text("Quantidade: " + cart["Quantidade"].toString(),
                      style: new TextStyle(fontSize: 25)),
                  Spacer(),
                  Text('R\$ ' + cart["Price"].toString(),
                      style: new TextStyle(
                          fontSize: 25, fontWeight: FontWeight.bold)),
                ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
