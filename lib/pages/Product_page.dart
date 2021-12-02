//TODO Utilizar essa pagina como unica para construir os detalhes
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:ia_card/models/Product.dart';

class ProductPageClass extends StatefulWidget {
  @override
  _ProductPageClassState createState() => _ProductPageClassState();
}

class _ProductPageClassState extends State<ProductPageClass> {
  final fb = FirebaseDatabase.instance.reference().child("Products");
  List<Product> list = [];

  @override
  void initState() {
    super.initState();
    fb.once().then((DataSnapshot snap) {
      var data = snap.value;
      list.clear();
      data.forEach((key, value) {
        print(value["name"]);
        Product product = new Product(
          id: value["id"],
          name: value["name"],
          filtros: value["filtros"],
          price: value["price"],
          description: value["description"],
          image: value["image"],
          key: key,
        );
        list.add(product);
      });
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
