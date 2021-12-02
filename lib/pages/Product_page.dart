import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_search_bar/flutter_search_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ia_card/models/Product.dart';
import 'package:ia_card/pages/cart_page.dart';
import 'package:ia_card/widgets/Product_tile.dart';

class ProductPageClass extends StatefulWidget {
  ProductPageClass({this.name}); //TODO deixar o código melhor
  final String name;

  @override
  _ProductPageClassState createState() => _ProductPageClassState();
}

class _ProductPageClassState extends State<ProductPageClass> {
  final fb = FirebaseDatabase.instance.reference().child("Products");
  final List<Product> list = [];
  static var productList = {};

  @override
  void initState() {
    super.initState();
    fb.once().then((DataSnapshot snap) {
      var data = snap.value;
      data.forEach((key, value) {
        Product product = new Product(
          id: value["01"]["id"],
          name: value["01"]["name"],
          filtros: value["01"]["filtros"],
          price: value["01"]["price"],
          description: value["01"]["description"],
          image: value["01"]["image"],
          key: key,
        );
        productList[key] = [
          [
            product.id,
            product.name,
            product.filtros,
            product.price,
            product.description,
            product.image,
            product.key
          ]
        ];
        list.add(product);
      });
      setState(() {});
    });
  }

  SearchBar searchBar;
  AppBar buildAppBar(BuildContext context) {
    return new AppBar(
      toolbarHeight: 90,
      centerTitle: true,
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right: 30.0),
          child: IconButton(
            icon: Icon(Icons.shopping_basket, size: 35),
            color: Colors.white,
            onPressed: () {
              print(list[1].image);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CartPage()),
              );
            },
          ),
        )
      ],
      title: new Text('Bebidas',
          style: GoogleFonts.passionOne(
              fontStyle: FontStyle.normal, fontSize: 40)),
      backgroundColor: Color.fromRGBO(255, 161, 73, 1),
    );
  }

  _ProductPageClassState() {
    searchBar = new SearchBar(
        inBar: false,
        setState: setState,
        onSubmitted: print,
        buildDefaultAppBar: buildAppBar);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: searchBar.build(context),
      body: ListView.builder(
        itemCount: productList["Drink"].length,
        itemBuilder: (ctx, i) => ProductTile(list[i]),
      ),
    );
  }
}
