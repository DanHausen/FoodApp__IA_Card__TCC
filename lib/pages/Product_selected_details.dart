import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ia_card/constants.dart';
import 'package:ia_card/models/Product.dart';
import 'package:ia_card/widgets/Cart.dart';
import 'package:ia_card/pages/Cart_listing_page.dart';

int qtdeItems = 1;

class ProductSelectedDetails extends StatelessWidget {
  final Product productModel;
  // ignore: non_constant_identifier_names
  const ProductSelectedDetails({key, required this.productModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        elevation: 1,
        centerTitle: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(25),
          ),
        ),
        backgroundColor: kPrimaryLightColor,
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
      ),
      body: ProductPage(productModel: productModel),
    );
  }
}

class ProductPage extends StatefulWidget {
  const ProductPage({
    key,
    required this.productModel,
  }) : super(key: key);

  final Product productModel;

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  var item = new Map();

  @override
  void initState() {
    qtdeItems = 1;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          new Container(
            decoration: new BoxDecoration(color: Colors.white),
            padding: const EdgeInsets.all(40.0),
            alignment: Alignment.topCenter,
            child: Image.network(widget.productModel.image),
          ),
          Row(
            children: [
              Flexible(
                flex: 1,
                child: new Container(
                  decoration: new BoxDecoration(color: Colors.white),
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: new Text(
                      widget.productModel.name,
                      style: GoogleFonts.metrophobic(
                          fontWeight: FontWeight.w300,
                          fontSize: 25,
                          color: Colors.black),
                    ),
                  ),
                ),
              ),
              Flexible(
                flex: 1,
                child: new Container(
                  decoration: new BoxDecoration(color: Colors.white),
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      'R\$ ' + widget.productModel.price,
                      style: GoogleFonts.metrophobic(
                        fontWeight: FontWeight.w900,
                        fontSize: 25,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 4,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Container(
                decoration: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
              ),
            ),
          ),
          new Container(
            decoration: new BoxDecoration(color: kTextColorExtraLight),
            padding: const EdgeInsets.only(left: 40, top: 10),
            alignment: Alignment.topLeft,
            child: Text(
              widget.productModel.description,
              style: GoogleFonts.metrophobic(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: kTextColorHard,
              ),
            ),
          ),
          new Container(
            decoration: new BoxDecoration(color: kTextColorExtraLight),
            padding: const EdgeInsets.only(left: 40, bottom: 10),
            alignment: Alignment.topLeft,
            child: Text(
              "Filtros: " + widget.productModel.filtros,
              style: GoogleFonts.metrophobic(
                fontWeight: FontWeight.normal,
                fontSize: 13,
                color: kTextColorHard,
              ),
            ),
          ),
          SizedBox(height: 20),
          new Container(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: TextField(
                decoration: InputDecoration(
                  labelStyle: TextStyle(color: kTextColorHard),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: kTextColorHard, width: 1.5),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: kTextColorHard, width: 1.5),
                  ),
                  border: OutlineInputBorder(),
                  labelText: 'obs: ',
                ),
              )),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: kTextColorExtraLight),
                        child: InkWell(
                            onTap: () {
                              //Adicionei o setState para atualizar o valor
                              if (qtdeItems > 1) {
                                setState(() {
                                  qtdeItems--;
                                });
                              }
                            },
                            child: Icon(
                              Icons.remove,
                              color: kTextColorExtraHard,
                              size: 25,
                            )),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: kPrimaryLightColor),
                        child: Align(
                          child: Text(
                            qtdeItems.toString(),
                            style: GoogleFonts.roboto(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: kTextColorExtraLight),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              qtdeItems++;
                            });
                          },
                          child: Icon(
                            Icons.add,
                            color: kTextColorExtraHard,
                            size: 25,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(right: 20),
                  child: (SizedBox(
                    height: 50,
                    width: 125,
                    child: InkWell(
                      child: TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: kPrimaryLightColor,
                        ),
                        child: Text(
                          'ADICIONAR',
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.w900),
                        ),
                        onPressed: () {
                          Cart.itemAddToCart(
                              widget.productModel.name,
                              qtdeItems,
                              double.parse(widget.productModel.price) *
                                  qtdeItems);
                        },
                      ),
                    ),
                  )),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
