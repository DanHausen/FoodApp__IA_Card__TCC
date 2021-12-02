import 'package:flutter/material.dart';
import 'package:ia_card/models/drink.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ia_card/pages/drink_detail.dart';


class DrinkTile extends StatelessWidget {

  final Product drink;

  const DrinkTile(this.drink);

  get index => this.drink;


  @override
  Widget build(BuildContext context) {
  

    final image = Image.network(drink.image);
    return ListTile(
    leading: image,
    title: Text(drink.name,
    style: GoogleFonts.metrophobic(
              fontStyle: FontStyle.normal,
              fontSize: 16
            ),),
    subtitle: Text(drink.desc,
    style: GoogleFonts.metrophobic(
              fontStyle: FontStyle.normal,
            ),),
    trailing: Text("R\$ "+ drink.value,
   style: GoogleFonts.metrophobic(
              fontStyle: FontStyle.normal,
              fontSize: 18
            ),),

            onTap: (){
                   Navigator.of(context).push(MaterialPageRoute(builder: (context)=>DrinkDetail(drinkDataModel: index,)));
                 },
   
    );
    
  }
 
}
