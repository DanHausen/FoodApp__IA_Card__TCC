import 'package:flutter/material.dart';

import 'Product.dart';

class ShopCart {
  String key, name, image, price;
  int quantity;
  double totalPrice;

  ShopCart({
    this.key,
    this.name,
    this.image,
    this.price,
    this.quantity,
    this.totalPrice,
  });

  ShopCart.fromJSON(Map<String, dynamic> json) {
    key = json['key'];
    name = json['name'];
    image = json['image'];
    price = json['price'];
    quantity = json['quantity'];
    totalPrice = json['totalPrice'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['key'] = this.key;
    data['name'] = this.key;
    data['image'] = this.key;
    data['price'] = this.key;
    data['quantity'] = this.key;
    data['totalPrice'] = this.key;
  }
}
