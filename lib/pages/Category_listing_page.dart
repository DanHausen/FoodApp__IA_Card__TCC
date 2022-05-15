import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_search_bar/flutter_search_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ia_card/main.dart';
import 'package:ia_card/models/Product.dart';
import 'package:ia_card/pages/Cart_listing_page.dart';
import 'package:ia_card/widgets/Product_tile.dart';

class CategoryListingPageClass extends StatefulWidget {
  CategoryListingPageClass({this.name});
  final String name;

  @override
  _CategoryListingPageClassState createState() =>
      _CategoryListingPageClassState();
}

class _CategoryListingPageClassState extends State<CategoryListingPageClass> {
  final fb = FirebaseDatabase.instance.ref().child("Products");
  final List<Product> list = [];
  static var productList = {};
  int n = 01;
  final searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    fb.once().then((DatabaseEvent snapEvent) {
      var value = snapEvent.snapshot.value;
      list.clear();
      (value as dynamic).forEach(
        (key, value) {
          Product product = new Product(
            id: value[n.toString().padLeft(n + 1, '0')]["id"],
            name: value[n.toString().padLeft(n + 1, '0')]["name"],
            filtros: value[n.toString().padLeft(n + 1, '0')]["filtros"],
            price: value[n.toString().padLeft(n + 1, '0')]["price"],
            description: value[n.toString().padLeft(n + 1, '0')]["description"],
            image: value[n.toString().padLeft(n + 1, '0')]["image"],
            key: key,
          );
          productList[key] = [
            [
              product.id,
              product.name,
              product.filtros,
              product.price,
              product.description,
              product.image,
              product.key
            ]
          ];
          list.add(product);
        },
      );
      setState(() {});
    });
  }

  SearchBar searchBar;
  AppBar buildAppBar(BuildContext context) {
    return new AppBar(
      toolbarHeight: 70,
      elevation: 1,
      centerTitle: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(25),
        ),
      ),
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right: 30.0),
          child: IconButton(
            icon: Icon(Icons.shopping_cart, size: 35),
            color: Colors.white,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CartListingPage()),
              );
            },
          ),
        )
      ],
      title: new Text(
        widget.name,
        style:
            GoogleFonts.passionOne(fontStyle: FontStyle.normal, fontSize: 40),
      ),
      backgroundColor: Color.fromRGBO(255, 161, 73, 1),
    );
  }

  _CategoryListingPageClassState() {
    searchBar = new SearchBar(
        inBar: false,
        setState: setState,
        onSubmitted: print,
        buildDefaultAppBar: buildAppBar);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: fb.get(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            print('Temos um erro! ${snapshot.error.toString()}');
            return Text('Algo deu errado');
          } else if (snapshot.hasData) {
            return new Scaffold(
              resizeToAvoidBottomInset: false,
              appBar: searchBar.build(context),
              body: _buildBody(),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.orange),
              ),
            );
          }
        });
  }

  _buildBody() {
    return Column(
      children: [
        _buildVerticalSpace(height: 39),
        MyApp.searchBarBuilderStatic(searchController),
        _buildVerticalSpace(height: 46),
        Expanded(child: _listBuilder()),
      ],
    );
  }

  _buildVerticalSpace({double height = 26.0}) {
    return SizedBox(height: height);
  }

  ListView _listBuilder() {
    return ListView.builder(
        itemCount: productList[widget.name].length,
        itemBuilder: (ctx, i) {
          return ProductTile(list[checkNameProduct()]);
        });
  }

  int checkNameProduct() {
    for (var i = 0; i < productList.length; i++) {
      if (widget.name == list[i].key) return i;
    }
    return null;
  }
}
