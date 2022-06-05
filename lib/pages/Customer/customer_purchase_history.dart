import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:ia_card/constants.dart';
import 'package:ia_card/widgets/appBar.dart';
import 'package:ia_card/widgets/post_get_firebase.dart';

class HistoryListingPageClass extends StatefulWidget {
  HistoryListingPageClass({var costumerName});

  @override
  State<HistoryListingPageClass> createState() =>
      _HistoryListingPageClassState();
}

class _HistoryListingPageClassState extends State<HistoryListingPageClass> {
  final DatabaseReference dataBaseReference = FirebaseDatabase.instance
      .ref()
      .child('Restaurant name')
      .child('Customers orders');
  int listLength = 0;
  var customerHistory = ToFirebaseWidget.getCustomerHistory(
      FirebaseAuth.instance.currentUser?.uid);
  var custom;

  @override
  void initState() {
    super.initState();
    customerHistory.then((value) {
      custom = value;
      listLength = value.length;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: dataBaseReference.get(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            print('Temos um erro! ${snapshot.error.toString()}');
            return Text('Algo deu errado');
          } else if (snapshot.hasData) {
            return new Scaffold(
              resizeToAvoidBottomInset: false,
              appBar: AppBarWidget(
                textTitle: 'Histórico de pedidos',
              ),
              body: buildHistoryCard(),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(K_PRIMARY_COLOR),
              ),
            );
          }
        });
  }

  buildHistoryCard() {
    return Column(
      children: [
        SizedBox(
          height: 20,
        ),
        Expanded(
          child: ListView.builder(
            itemCount: listLength,
            itemBuilder: (ctx, i) {
              return historyOrderCard(i);
            },
          ),
        ),
      ],
    );
  }

  historyOrderCard(i) {
    return Column(
      children: [
        Center(
          child: new Container(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: K_PRIMARY_COLOR_LIGHT,
                elevation: 0.0,
              ),
              child: (Text(custom.toString())),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text("oi"),
                    content: Text(customerHistory.toString()),
                    actions: [
                      TextButton(
                        child: Text("OK"),
                        onPressed: () => Navigator.pop(context),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
