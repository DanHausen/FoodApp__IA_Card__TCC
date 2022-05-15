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
      decoration: BoxDecoration(
        border: Border(left: BorderSide(color: Colors.orange, width: 3)),
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
                      child: Text(cart["Name"],
                          style: new TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                    Spacer(),
                    TextButton(
                        child: Icon(Icons.delete),
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
      ),
    );
  }
}
