import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:ia_card/widgets/cart.dart';

class ToFirebaseWidget extends StatelessWidget {
  ToFirebaseWidget({Key? key, this.userPersonalName, this.customerTableNumber})
      : super(key: key);

  final DatabaseReference dataBaseReference = FirebaseDatabase.instance
      .ref()
      .child('Restaurant name')
      .child('Customers orders');
  static final User? firebaseUser = FirebaseAuth.instance.currentUser;
  final String? userPersonalName;
  final String? customerTableNumber;

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }

  Future<void> userHistoryToFirebase() async {
    final DatabaseReference pushdataBaseReference =
        dataBaseReference.child(firebaseUser!.uid).push();
    await pushdataBaseReference.set({
      'email': firebaseUser!.email,
      'order': Cart.cartList,
      'name': this.userPersonalName,
      'tableNumber': this.customerTableNumber,
      'orderTotalPrice': 'R\$ ' + Cart.totalPrice.toString(),
    });
  }

  Future<int> userOrderAmountHistory() async {
    await dataBaseReference.once().then((DatabaseEvent snapEvent) {
      var value = snapEvent.snapshot.value;
      (value as dynamic).forEach((k, v) {
        return v.length;
      });
    });
    return 0;
  }

  static Future<int> getCustomerHistoryLength() async {
    await getCustomerHistory(firebaseUser!.uid).then((value) {
      return value.length;
    });
    return 0;
  }

  static Future<Map> getCustomerHistory(uid) async {
    final fb = FirebaseDatabase.instance
        .ref()
        .child("Restaurant name")
        .child('Customers orders')
        .child(uid);

    var historyList;

    await fb.once().then((DatabaseEvent snapEvent) {
      var value = snapEvent.snapshot.value;
      historyList = value;
    });
    print(historyList);
    return historyList;
  }
}
