import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ia_card/widgets/Cart.dart';

class CartListingPage extends StatefulWidget {
  static String routeName = "/cart";

  @override
  State<CartListingPage> createState() => _CartListingPageState();
}

class _CartListingPageState extends State<CartListingPage> {
  var cartAmount = Cart.cartAmount;
  var cartLength = Cart.cartList.length;
  var cartList = Cart.cartList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
        backgroundColor: Color.fromRGBO(255, 161, 73, 1),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(25),
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              child: new ListView.builder(
                  itemCount: cartLength,
                  itemBuilder: (BuildContext context, int index) =>
                      buildCartCard(context, index)),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Color.fromRGBO(255, 161, 73, 1),
                elevation: 0.0,
              ),
              onPressed: () {},
              child: Text(
                "Finalizar compra",
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

  Widget buildCartCard(BuildContext context, int index) {
    final cart = cartList[index];
    return new Container(
      decoration: BoxDecoration(
        border: Border(
          left: BorderSide(
            color: Color.fromRGBO(255, 161, 73, 1),
            width: 4,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 2.0),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        cart["Name"],
                        style: new TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Spacer(),
                    TextButton(
                        child: Icon(
                          Icons.delete,
                          size: 25,
                          color: Color.fromRGBO(255, 161, 73, 1),
                        ),
                        onPressed: () {
                          setState(() {
                            Cart.deleteSelectedCartItem(index);
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
                        style: new TextStyle(fontSize: 16)),
                    Spacer(),
                    Text('R\$ ' + cart["Price"].toString(),
                        style: new TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                  ]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
