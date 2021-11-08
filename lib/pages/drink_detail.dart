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
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
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
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
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
                drinkDataModel.desc,
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
                "Filtros: " + drinkDataModel.filtros,
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
                      borderSide:
                          BorderSide(color: Colors.grey[700], width: 1.5),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.grey[700], width: 1.5),
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
                            onTap: () {},
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
                            ' 1 ',
                            style: GoogleFonts.roboto(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
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
                              color: Colors.white, fontWeight: FontWeight.w900),
                        ),
                        onPressed: () {},
                      ),
                    )),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
