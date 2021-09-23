import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_search_bar/flutter_search_bar.dart';

class TestePage extends StatefulWidget {
  @override
  _TestePageState createState() => _TestePageState();
}

class _TestePageState extends State<TestePage> {
  SearchBar searchBar;

  AppBar buildAppBar(BuildContext context) {
    return new AppBar(
      toolbarHeight: 90,
      centerTitle: true,
      title: new Text('teste',
          style: GoogleFonts.passionOne(
              fontStyle: FontStyle.normal, fontSize: 40)),
      actions: [searchBar.getSearchAction(context)],
      backgroundColor: Color.fromRGBO(255, 161, 73, 1),
    );
  }

  _TestePageState() {
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
      body: _buildBody(),
    );
  }

  _buildBody() {
    FutureBuilder(
        future: getDados(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Erro: ${snapshot.error}');
          }

          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return LinearProgressIndicator();
              break;
            default:
              Map<String, dynamic> teste =
                  snapshot.data.data() as Map<String, dynamic>;
              return Center(child: Text("Servimos: ${teste['nome']}"));
          }
        });
  }

  Future<DocumentSnapshot> getDados() async {
    await Firebase.initializeApp();
    return await FirebaseFirestore.instance
        .collection('Bebidas')
        .doc('Bebida01')
        .get();
  }
}
