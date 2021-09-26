import 'package:flutter/material.dart';
import 'package:ia_card/models/portion.dart';
import 'package:google_fonts/google_fonts.dart';


class PortionDetail extends StatelessWidget {
  final Portion portionDataModel;
  // ignore: non_constant_identifier_names
  const PortionDetail({Key key, @required this.portionDataModel}) : super(key: key);
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
              onPressed: () {
        // do something
      },
    )
  ],
    ),
      body:SingleChildScrollView(
        child: 
      
      Column(
         children: [
        new Container( 
        decoration: new BoxDecoration(color: Colors.white),
        padding: const EdgeInsets.all(40.0),
        alignment: Alignment.topCenter,
        child: 
          Image.network(portionDataModel.image),),
        new Container(
          decoration: new BoxDecoration(color: Colors.white),
            padding: const EdgeInsets.symmetric(horizontal: 30),
            alignment: Alignment.topLeft,
            child: new Text(portionDataModel.name,style:  GoogleFonts.metrophobic(fontWeight: FontWeight.bold,fontSize: 20, color: Colors.black),),
            
          ),

          SizedBox(
            height: 20),

        new Container(
          decoration: new BoxDecoration(color: Colors.white),
            padding: const EdgeInsets.symmetric(horizontal: 40),
            alignment: Alignment.topLeft,
            child: Text(portionDataModel.desc,style:  GoogleFonts.metrophobic(fontWeight: FontWeight.bold,fontSize: 18, color: Colors.grey ,
            
          ),
        ),
        ),
        SizedBox(
            height: 20),

        new Container(
          decoration: new BoxDecoration(color: Colors.white),
            padding: const EdgeInsets.symmetric(horizontal: 40),
            alignment: Alignment.topLeft,
            child: Text("Filtros: " + portionDataModel.filtros,style:  GoogleFonts.metrophobic(fontWeight: FontWeight.bold,fontSize: 13, color: Colors.grey ,
            
          ),
        ),
        ),

         SizedBox(
            height: 20),
        new Container(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: TextField(
  
              decoration: InputDecoration(
                labelStyle: TextStyle(
                        color: Colors.grey),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color.fromRGBO(255, 161, 73, 1), width: 2.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey, width: 2.0),
                ),
              border: OutlineInputBorder(),
              labelText: 'obs: ',
            ),
            )
        ),
        SizedBox(
            height: 20),

        new Container(
          decoration: new BoxDecoration(color: Colors.white),
            padding: const EdgeInsets.symmetric(horizontal: 40),
            alignment: Alignment.topLeft,
            child: Text('R\$ ' + portionDataModel.value,style:  GoogleFonts.metrophobic(fontWeight: FontWeight.bold,fontSize: 18, color: Colors.black ,
            
          ),
        ),
        ),
        SizedBox(
            height: 20),
             
             Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween, 
               children: [ Container(
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
                          style: GoogleFonts.roboto(color: Colors.black, fontSize: 20),
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
                          padding: EdgeInsets.only(right:40),
                          child:( SizedBox(
                            height: 50,
                            width:100,

                            child: TextButton(
                              style: TextButton.styleFrom(
                                  backgroundColor: Color.fromRGBO(255, 161, 73, 1),
                              ),
                            child: Text(
                            'Adicionar',
                              style: TextStyle(
                              color: Colors.white,
                            ),
                            ),
                            onPressed: () {},
                              ),
                          ))
                        ),
                         
                ],
                
                
             )
                  
      ],
          
        
      ),

      ),
      
    );
      

    
  }
}

 

  
