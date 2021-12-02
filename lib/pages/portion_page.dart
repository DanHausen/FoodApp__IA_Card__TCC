import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_search_bar/flutter_search_bar.dart';
import 'package:ia_card/data/teste_portion.dart';
import 'package:ia_card/pages/cart_page.dart';
import 'package:ia_card/widgets/portion_tile.dart';

class PortionPage extends StatefulWidget {
  @override
  _PortionPageState createState() => _PortionPageState();
}

final portion = {...TESTE_PORTION};

class _PortionPageState extends State<PortionPage> {
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
      title: new Text('Porções',
          style: GoogleFonts.passionOne(
              fontStyle: FontStyle.normal, fontSize: 40)),
      backgroundColor: Color.fromRGBO(255, 161, 73, 1),
    );
  }

  _PortionPageState() {
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
          itemCount: portion.length,
          itemBuilder: (ctx, i) => PortionTile(portion.values.elementAt(i)),
        ));
  }
}
