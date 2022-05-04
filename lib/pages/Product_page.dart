import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_search_bar/flutter_search_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ia_card/models/Product.dart';
import 'package:ia_card/pages/cart_page.dart';
import 'package:ia_card/widgets/Product_tile.dart';

class ProductPageClass extends StatefulWidget {
  ProductPageClass({this.name});
  final String name;

  @override
  _ProductPageClassState createState() => _ProductPageClassState();
}

class _ProductPageClassState extends State<ProductPageClass> {
  final fb = FirebaseDatabase.instance.ref().child("Products");
  final List<Product> list = [];
  static var productList = {};
  int n = 01;

  @override
  void initState() {
    super.initState();
    fb.once().then((DatabaseEvent snapEvent) {
      var value = snapEvent.snapshot.value;
      list.clear();
      (value as dynamic).forEach(
        (key, value) {
          Product product = new Product(
            id: value[n.toString().padLeft(n + 1, '0')]["id"],
            name: value[n.toString().padLeft(n + 1, '0')]["name"],
            filtros: value[n.toString().padLeft(n + 1, '0')]["filtros"],
            price: value[n.toString().padLeft(n + 1, '0')]["price"],
            description: value[n.toString().padLeft(n + 1, '0')]["description"],
            image: value[n.toString().padLeft(n + 1, '0')]["image"],
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
        },
      );
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
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CartPage()),
              );
            },
          ),
        )
      ],
      title: new Text(widget.name,
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
          //TODO Adicionar o future para parar deaparecer a tela vermelha
          itemCount: productList[widget.name].length,
          itemBuilder: (ctx, i) {
            return ProductTile(list[CheckNameProduct()]);
          }),
    );
  }

  int CheckNameProduct() {
    for (var i = 0; i < productList.length; i++) {
      if (widget.name == list[i].key) return i;
    }
    return null;
  }
}
