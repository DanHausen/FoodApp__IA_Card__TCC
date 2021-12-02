import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_search_bar/flutter_search_bar.dart';
import 'package:ia_card/pages/Product_page.dart';
import 'package:ia_card/pages/cart_page.dart';

class CardPage extends StatefulWidget {
  @override
  _CardPageState createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  SearchBar searchBar;

  AppBar buildAppBar(BuildContext context) {
    return new AppBar(
      toolbarHeight: 150,
      centerTitle: true,
      leading: Padding(
        padding: const EdgeInsets.only(left: 30.0),
        child: IconButton(
          icon: Icon(Icons.search, size: 35),
          onPressed: () {},
        ),
      ),
      title: new Text('Restaurante',
          style: GoogleFonts.passionOne(
              fontStyle: FontStyle.normal, fontSize: 40)),
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
      backgroundColor: Color.fromRGBO(255, 161, 73, 1),
    );
  }

  _CardPageState() {
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
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildVerticalSpace(),
          Text('Categorias',
              style: GoogleFonts.metrophobic(
                  fontStyle: FontStyle.normal,
                  fontSize: 25,
                  color: Colors.white,
                  fontWeight: FontWeight.bold)),
          _buildVerticalSpace(),
          _buildCategory(),
          _buildVerticalSpace(),
          Text('Mais pedidos',
              style: GoogleFonts.metrophobic(
                  fontStyle: FontStyle.normal,
                  fontSize: 25,
                  color: Colors.white,
                  fontWeight: FontWeight.bold)),
          _buildVerticalSpace(),
          _buildPedidos(),
        ],
      ),
    );
  }

  _buildCategory() {
    return Align(
      alignment: Alignment.center,
      child: Wrap(
        spacing: 30, // gap between adjacent chips
        runSpacing: 20, // gap between lines
        children: <Widget>[
          Container(
            child: ButtonTheme(
                buttonColor: Colors.white,
                child: Stack(children: [
                  Container(
                    width: 170,
                    height: 40.0,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      // ignore: deprecated_member_use
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          side: BorderSide(
                            width: 2,
                            color: Colors.orange,
                          ),
                        ),
                        child: Text(
                          'Drink',
                          style: GoogleFonts.metrophobic(
                            color: Colors.grey[700],
                            fontStyle: FontStyle.normal,
                            fontSize: 18.0,
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    ProductPageClass(name: "Drink")),
                          );
                        },
                      ),
                    ),
                  ),
                  Positioned(
                    // image in right
                    top: -3,
                    right: -5,
                    child: new Image.asset(
                      'assets/images/categories/bebidas.png',
                      width: 50.0,
                      height: 50.0,
                    ),
                  )
                ])),
          ),
          Container(
            child: ButtonTheme(
                buttonColor: Colors.white,
                child: Stack(children: [
                  Container(
                    width: 170,
                    height: 40.0,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      // ignore: deprecated_member_use
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          side: BorderSide(
                            width: 2,
                            color: Colors.orange,
                          ),
                        ),
                        child: Text(
                          'Porções',
                          style: GoogleFonts.metrophobic(
                            color: Colors.grey[700],
                            fontStyle: FontStyle.normal,
                            fontSize: 18.0,
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    ProductPageClass(name: "Portions")),
                          );
                        },
                      ),
                    ),
                  ),
                  Positioned(
                    // image in right
                    top: -3,
                    right: -5,
                    child: new Image.asset(
                      'assets/images/categories/porcoes.png',
                      width: 50.0,
                      height: 50.0,
                    ),
                  )
                ])),
          ),
          Container(
            child: ButtonTheme(
                buttonColor: Colors.white,
                child: Stack(children: [
                  Container(
                    width: 170,
                    height: 40.0,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      // ignore: deprecated_member_use
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          side: BorderSide(
                            width: 2,
                            color: Colors.orange,
                          ),
                        ),
                        child: Text(
                          'Lanches',
                          style: GoogleFonts.metrophobic(
                            color: Colors.grey[700],
                            fontStyle: FontStyle.normal,
                            fontSize: 18.0,
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    ProductPageClass(name: "Lanches")),
                          );
                        },
                      ),
                    ),
                  ),
                  Positioned(
                    // image in right
                    top: -3,
                    right: -5,
                    child: new Image.asset(
                      'assets/images/categories/lanches.png',
                      width: 50.0,
                      height: 50.0,
                    ),
                  )
                ])),
          ),
          Container(
            child: ButtonTheme(
                buttonColor: Colors.white,
                child: Stack(children: [
                  Container(
                    width: 170,
                    height: 40.0,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      // ignore: deprecated_member_use
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          side: BorderSide(
                            width: 2,
                            color: Colors.orange,
                          ),
                        ),
                        child: Text(
                          'A la carte',
                          style: GoogleFonts.metrophobic(
                            color: Colors.grey[700],
                            fontStyle: FontStyle.normal,
                            fontSize: 18.0,
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    ProductPageClass(name: "A la carte")),
                          );
                        },
                      ),
                    ),
                  ),
                  Positioned(
                    // image in right
                    top: -3,
                    right: -5,
                    child: new Image.asset(
                      'assets/images/categories/a_la_carte.png',
                      width: 50.0,
                      height: 50.0,
                    ),
                  )
                ])),
          ),
          Container(
            child: ButtonTheme(
              buttonColor: Colors.white,
              child: Stack(
                children: [
                  Container(
                    width: 170,
                    height: 40.0,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      // ignore: deprecated_member_use
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          side: BorderSide(
                            width: 2,
                            color: Colors.orange,
                          ),
                        ),
                        child: Text(
                          'Saladas',
                          style: GoogleFonts.metrophobic(
                            color: Colors.grey[700],
                            fontStyle: FontStyle.normal,
                            fontSize: 18.0,
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    ProductPageClass(name: "Saladas")),
                          );
                        },
                      ),
                    ),
                  ),
                  Positioned(
                    // image in right
                    top: -3,
                    right: -5,
                    child: new Image.asset(
                      'assets/images/categories/saladas.png',
                      width: 50.0,
                      height: 50.0,
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            child: ButtonTheme(
              buttonColor: Colors.white,
              child: Stack(
                children: [
                  Container(
                    width: 170,
                    height: 40.0,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      // ignore: deprecated_member_use
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          side: BorderSide(
                            width: 2,
                            color: Colors.orange,
                          ),
                        ),
                        child: Text(
                          'Sobremesas',
                          style: GoogleFonts.metrophobic(
                            color: Colors.grey[700],
                            fontStyle: FontStyle.normal,
                            fontSize: 18.0,
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    ProductPageClass(name: "Sobremesas")),
                          );
                        },
                      ),
                    ),
                  ),
                  Positioned(
                    // image in right
                    top: -3,
                    right: -5,
                    child: new Image.asset(
                      'assets/images/categories/sobremesas.png',
                      width: 50.0,
                      height: 50.0,
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  _buildPedidos() {
    return Expanded(
      child: GridView.builder(
        itemCount: 2,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
        ),
        itemBuilder: _buildTile,
      ),
    );
  }

  Widget _buildTile(context, index) {
    return GestureDetector(
      // ///   onTap: () => _onMarkTile(index),

      child: Container(
        decoration: BoxDecoration(
            border: Border.all(
              color: Color.fromRGBO(196, 196, 196, 1),
            ),
            borderRadius: BorderRadius.all(Radius.circular(20))),
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Center(),
      ),
    );
  }

  _buildVerticalSpace({double height = 20.0}) {
    return SizedBox(height: height);
  }
}
