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
      body: Column(
        children: [
          Image.network(drinkDataModel.image),
          SizedBox(
            height: 10,
          ),
          Text(drinkDataModel.name,style:  GoogleFonts.metrophobic(fontWeight: FontWeight.bold,fontSize: 20),),
          Text(drinkDataModel.desc,style:  GoogleFonts.metrophobic(fontWeight: FontWeight.bold,fontSize: 18),)
          
        ],
        
      ),
      
    );
    
  }
}

 

  
