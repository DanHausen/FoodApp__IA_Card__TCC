import 'package:flutter/material.dart';
import 'package:ia_card/models/drink.dart';
import 'package:google_fonts/google_fonts.dart';

class DrinkDetail extends StatelessWidget {
  final Drink drinkDataModel;
  // ignore: non_constant_identifier_names
  const DrinkDetail({Key key, @required this.drinkDataModel}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 75,
        centerTitle: true,
        backgroundColor: Color.fromRGBO(255, 161, 73, 1),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.shopping_basket,
              color: Colors.white,
            ),
            onPressed: (
                //TODO
                ) {
              // do something
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            new Container(
              decoration: new BoxDecoration(color: Colors.white),
              padding: const EdgeInsets.all(40.0),
              alignment: Alignment.topCenter,
              child: Image.network(drinkDataModel.image),
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
                      padding: const EdgeInsets.all(8.0),
                      child: new Text(
                        drinkDataModel.name,
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
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'R\$ ' + drinkDataModel.value,
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
            SizedBox(height: 20),
            new Container(
              decoration: new BoxDecoration(color: Colors.grey[90]),
              padding: const EdgeInsets.symmetric(horizontal: 40),
              alignment: Alignment.topLeft,
              child: Text(
                drinkDataModel.desc,
                style: GoogleFonts.metrophobic(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ),
            new Container(
              decoration: new BoxDecoration(color: Colors.grey[90]),
              padding: const EdgeInsets.symmetric(horizontal: 40),
              alignment: Alignment.topLeft,
              child: Text(
                "Filtros: " + drinkDataModel.filtros,
                style: GoogleFonts.metrophobic(
                  fontWeight: FontWeight.normal,
                  fontSize: 13,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 20),
            new Container(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: TextField(
                  decoration: InputDecoration(
                    labelStyle: TextStyle(color: Colors.white),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 1.5),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 1.5),
                    ),
                    border: OutlineInputBorder(),
                    labelText: 'obs: ',
                  ),
                )),
            SizedBox(height: 20),
            SizedBox(height: 20),
            Row(
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
                          onTap: () {},
                          child: Icon(
                            Icons.remove,
                            color: Colors.black54,
                            size: 20,
                          )),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        padding:
                            EdgeInsets.symmetric(horizontal: 3, vertical: 5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3),
                            color: Colors.black12),
                        child: Text(
                          ' 0 ',
                          style: GoogleFonts.roboto(
                              color: Colors.black, fontSize: 20),
                        ),
                      ),
                      InkWell(
                          onTap: () {},
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
                            color: Colors.white,
                          ),
                        ),
                        onPressed: () {},
                      ),
                    ))),
              ],
            )
          ],
        ),
      ),
    );
  }
}
