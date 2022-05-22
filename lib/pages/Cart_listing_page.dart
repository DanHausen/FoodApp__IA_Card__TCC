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
  var cartTotalPrice = Cart.totalPrice;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        centerTitle: true,
        title: Column(
          children: [
            Text(
              'Seu carrinho',
              style: GoogleFonts.passionOne(
                  fontStyle: FontStyle.normal, fontSize: 40),
            ),
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
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              "$cartAmount items",
              style: TextStyle(color: Colors.grey[500]),
            ),
          ),
          Expanded(
            child: Container(
              child: new ListView.builder(
                  itemCount: cartLength,
                  itemBuilder: (BuildContext context, int index) =>
                      buildCartCard(context, index)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: totalCartPricingText(cartAmount),
          ),
          finishCartButton(cartAmount),
        ],
      ),
    );
  }

  Align totalCartPricingText(int cartAmount) {
    if (cartAmount >= 1) {
      return Align(
        alignment: Alignment.bottomCenter,
        child: Text(
          'R\$ ' + "$cartTotalPrice",
          style: TextStyle(
            color: Colors.grey[600],
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      );
    } else {
      return Align(
        child: Text(""),
      );
    }
  }

  Align finishCartButton(int cartAmount) {
    if (cartAmount >= 1) {
      return Align(
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
      );
    } else {
      return Align(
        child: Text(""),
      );
    }
  }

  Widget buildCartCard(BuildContext context, int index) {
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
                        cartList.values.elementAt(index)["Name"],
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
                        Cart.deleteSelectedCartItem(
                            cartList.keys.elementAt(index));
                        cartLength = Cart.cartList.length;
                        cartAmount = Cart.cartAmount;
                        cartList = Cart.cartList;
                        cartTotalPrice = Cart.totalPrice;
                        setState(() {});
                      },
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Row(children: [
                    Text(
                        "Quantidade: " +
                            cartList.values
                                .elementAt(index)["Quantidade"]
                                .toString(),
                        style: new TextStyle(fontSize: 16)),
                    Spacer(),
                    Text(
                        'R\$ ' +
                            cartList.values
                                .elementAt(index)["Price"]
                                .toString(),
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
