import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:ia_card/constants.dart';
import 'package:ia_card/main.dart';
import 'package:ia_card/models/Product.dart';
import 'package:ia_card/pages/Customer/cart_listing_page.dart';
import 'package:ia_card/widgets/appBar.dart';
import 'package:ia_card/widgets/product_tile.dart';

class CategoryListingPageClass extends StatefulWidget {
  CategoryListingPageClass({required this.name});
  final String name;

  @override
  _CategoryListingPageClassState createState() =>
      _CategoryListingPageClassState();
}

class _CategoryListingPageClassState extends State<CategoryListingPageClass> {
  final fb = FirebaseDatabase.instance.ref().child("Products");
  final List<Product> list = [];
  int n = 01;
  final searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    fb.once().then((DatabaseEvent snapEvent) {
      var value =
          snapEvent.snapshot.value; //value recebe tudo que está dentro do banco
      list.clear();
      (value as dynamic).forEach(
        //value aqui é um map do tipo do produto, ex: "lanches ou a la carte"
        (key, value) {
          //Key é o nome do tipo de produto, ex: "lanches"
          if (widget.name == key) {
            (value as dynamic).forEach(
              (k, v) {
                Product product = new Product(
                  id: v["id"],
                  name: v["name"],
                  filtros: v["filtros"],
                  price: v["price"],
                  description: v["description"],
                  image: v["image"],
                  key: key,
                );
                list.add(product);
              },
            );
          }
        },
      );
      setState(() {});
    });
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
              appBar: AppBarWidget(
                textTitle: widget.name,
              ),
              body: _buildBody(),
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

  _buildBody() {
    return Column(
      children: [
        _buildVerticalSpace(height: 39),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: MyApp.searchBarBuilderStatic(searchController),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: IconButton(
                icon: Icon(Icons.shopping_cart, size: 35),
                color: K_PRIMARY_COLOR_LIGHT,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CartListingPage()),
                  );
                },
              ),
            ),
          ],
        ),
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
      itemCount: list.length,
      itemBuilder: (ctx, i) {
        return ProductTile(list[i]);
      },
    );
  }
}
