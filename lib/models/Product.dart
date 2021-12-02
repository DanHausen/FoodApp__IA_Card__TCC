import 'package:flutter/cupertino.dart';

class Product {
  final String name;
  final int id;
  final String filtros;
  final String description;
  final String image;
  final String price;
  final key;

  const Product({
    @required this.name,
    this.filtros,
    @required this.id,
    @required this.description,
    @required this.image,
    @required this.price,
    this.key,
  });
}
