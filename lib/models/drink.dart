
import 'package:flutter/cupertino.dart';

class Drink {

  final String name;
  final int id;
  final String desc;
  final String image;
  final String value;

  const Drink({
    @required this.name,
    @required this.id,
    @required this.desc,
    @required this.image,
    @required this.value,

  });
}