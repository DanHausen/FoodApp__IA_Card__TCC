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
  final searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    searchController.addListener(() {
      setState(() {});
    });
  }

  AppBar buildAppBar(BuildContext context) {
    return new AppBar(
      toolbarHeight: 70,
      elevation: 0.0,
      centerTitle: true,
      title: new Text(
        'Restaurante',
        style: GoogleFonts.passionOne(
            fontStyle: FontStyle.normal, fontSize: 40, color: Colors.white),
      ),
      backgroundColor: Color.fromRGBO(255, 161, 73, 1),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(25),
        ),
      ),
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
      resizeToAvoidBottomInset: false,
      appBar: searchBar.build(context),
      body: _buildBody(),
    );
  }

  _buildBody() {
    return Column(
      children: [
        _buildVerticalSpace(height: 26),
        _buildToolBar(),
        _buildVerticalSpace(height: 26),
        _categoryBuilder(),
        _buildVerticalSpace(height: 26),
        _buildCategoryOptions(),
        _buildVerticalSpace(height: 54),
        _buildHistoryButton(),
      ],
    );
  }

  Align _categoryBuilder() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        width: 225,
        decoration: new BoxDecoration(
          color: Color.fromRGBO(255, 161, 73, 1),
          borderRadius: new BorderRadius.only(
            bottomRight: const Radius.circular(25),
            topRight: const Radius.circular(25),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Text(
            'Categorias',
            style: GoogleFonts.metrophobic(
              color: Colors.white,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w900,
              fontSize: 18.0,
            ),
          ),
        ),
      ),
    );
  }

  Container _buildToolBar() {
    return Container(
      color: Colors.white,
      height: 70,
      child: Wrap(
        children: [
          Container(
            width: 316,
            height: 40,
            child: TextField(
              maxLines: 1,
              textAlignVertical: TextAlignVertical.center,
              controller: searchController,
              textInputAction: TextInputAction.done,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  //labelText: "Buscar",
                  //hintText: "Guaraná",
                  contentPadding: EdgeInsets.zero,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey[300], width: 2.0),
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Color.fromRGBO(255, 161, 73, 1), width: 2.0),
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  prefixIcon: Icon(
                    Icons.search,
                    size: 35,
                    color: Color.fromRGBO(255, 161, 73, 1),
                  ),
                  suffixIcon: searchController.text.isEmpty
                      ? Container(
                          width: 0,
                        )
                      : IconButton(
                          icon: Icon(Icons.close),
                          onPressed: () => searchController.clear(),
                        )),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CartPage()),
              );
            },
            style: ElevatedButton.styleFrom(
              primary: Colors.white,
              elevation: 0.0,
              minimumSize: Size.zero,
              padding: EdgeInsets.zero,
            ),
            child: Icon(
              Icons.shopping_cart,
              size: 35,
              color: Color.fromRGBO(255, 161, 73, 1),
            ),
          ),
        ],
      ),
    );
  }

  Container _buildHistoryButton() {
    return Container(
      width: 269,
      height: 41,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Color.fromRGBO(255, 161, 73, 1),
          shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(15.0),
          ),
        ),
        child: Text(
          'Ver meu histórico',
          style: GoogleFonts.passionOne(
            color: Colors.white,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w400,
            fontSize: 24.0,
          ),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ProductPageClass(name: "Historico")),
          );
        },
      ),
    );
  }

  _buildCategoryOptions() {
    return Wrap(
      spacing: 39, // gap between adjacent chips
      runSpacing: 35, // gap between lines
      children: <Widget>[
        Container(
          child: stackedButtonImage(
            imageAddress: 'assets/images/categories/bebidas.png',
            categoryName: "Drink",
          ),
        ),
        Container(
          child: stackedButtonImage(
            imageAddress: 'assets/images/categories/porcoes.png',
            categoryName: "Porções",
          ),
        ),
        Container(
          child: stackedButtonImage(
            imageAddress: 'assets/images/categories/lanches.png',
            categoryName: "Lanches",
          ),
        ),
        Container(
          child: stackedButtonImage(
            imageAddress: 'assets/images/categories/a_la_carte.png',
            categoryName: "A la carte",
          ),
        ),
        Container(
          child: stackedButtonImage(
            imageAddress: 'assets/images/categories/saladas.png',
            categoryName: "Saladas",
          ),
        ),
        Container(
          child: stackedButtonImage(
            imageAddress: 'assets/images/categories/sobremesas.png',
            categoryName: "Sobremesas",
          ),
        ),
      ],
    );
  }

  Stack stackedButtonImage({
    String imageAddress = "",
    double containerWidth = 149,
    double containerHeight = 42,
    String categoryName = "",
  }) {
    return Stack(
      children: [
        Container(
          width: containerWidth,
          height: containerHeight,
          child: Row(
            children: [
              ElevatedButton(
                child: Text(
                  categoryName,
                  style: GoogleFonts.metrophobic(
                    color: Colors.black,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w400,
                    fontSize: 18.0,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 253, 237, 231),
                  minimumSize: Size(containerWidth, containerHeight),
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(15.0),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            ProductPageClass(name: categoryName)),
                  );
                },
              ),
            ],
          ),
        ),
        Positioned(
          // image in right
          top: -3,
          right: -5,
          child: new Image.asset(
            imageAddress,
            width: 50.0,
            height: 50.0,
          ),
        )
      ],
    );
  }

  _buildVerticalSpace({double height = 20.0}) {
    return SizedBox(height: height);
  }
}
