import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ia_card/models/Product.dart';
import 'package:ia_card/widgets/Cart.dart';
import 'package:ia_card/pages/cart_page.dart';

int qtdeItems = 1;

class ProductDetails extends StatelessWidget {
  final Product productModel;
  // ignore: non_constant_identifier_names
  const ProductDetails({Key key, @required this.productModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(25),
          ),
        ),
        toolbarHeight: 75,
        centerTitle: true,
        backgroundColor: Color.fromRGBO(255, 161, 73, 1),
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
      ),
      body: ProductPage(productModel: productModel),
    );
  }
}

class ProductPage extends StatefulWidget {
  const ProductPage({
    Key key,
    @required this.productModel,
  }) : super(key: key);

  final Product productModel;

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  var item = new Map();

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
            height: 8,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
              ),
            ),
          ),
          new Container(
            decoration: new BoxDecoration(color: Colors.grey[90]),
            padding: const EdgeInsets.only(left: 40, top: 10),
            alignment: Alignment.topLeft,
            child: Text(
              widget.productModel.description,
              style: GoogleFonts.metrophobic(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.grey[700],
              ),
            ),
          ),
          new Container(
            decoration: new BoxDecoration(color: Colors.grey[90]),
            padding: const EdgeInsets.only(left: 40, bottom: 10),
            alignment: Alignment.topLeft,
            child: Text(
              "Filtros: " + widget.productModel.filtros,
              style: GoogleFonts.metrophobic(
                fontWeight: FontWeight.normal,
                fontSize: 13,
                color: Colors.grey[700],
              ),
            ),
          ),
          SizedBox(height: 20),
          new Container(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: TextField(
                decoration: InputDecoration(
                  labelStyle: TextStyle(color: Colors.grey[700]),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey[700], width: 1.5),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey[700], width: 1.5),
                  ),
                  border: OutlineInputBorder(),
                  labelText: 'obs: ',
                ),
              )),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Row(
                    children: [
                      InkWell(
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
                            color: Colors.black54,
                            size: 20,
                          )),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.black12),
                        child: Text(
                          qtdeItems.toString(),
                          style: GoogleFonts.roboto(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      InkWell(
                          onTap: () {
                            setState(() {
                              qtdeItems++;
                            });
                          },
                          child: Icon(
                            Icons.add,
                            color: Colors.black54,
                            size: 20,
                          )),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(right: 40),
                  child: (SizedBox(
                    height: 50,
                    width: 100,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.blue,
                      ),
                      child: Text(
                        'ADICIONAR',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w900),
                      ),
                      onPressed: () {
                        Cart.itemAddToCart(widget.productModel.name, qtdeItems,
                            double.parse(widget.productModel.price));
                      },
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
