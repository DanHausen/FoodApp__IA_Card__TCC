import 'package:flutter/material.dart';
import 'package:ia_card/models/portion.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ia_card/pages/portion_detail.dart';


class PortionTile extends StatelessWidget {

  final Portion portion;

  const PortionTile(this.portion);

  get index => this.portion;


  @override
  Widget build(BuildContext context) {
  

    final image = Image.network(portion.image);
    return ListTile(
    leading: image,
    title: Text(portion.name,
    style: GoogleFonts.metrophobic(
              fontStyle: FontStyle.normal,
              fontSize: 16
            ),),
    subtitle: Text(portion.desc,
    style: GoogleFonts.metrophobic(
              fontStyle: FontStyle.normal,
            ),),
    trailing: Text("R\$ "+ portion.value,
   style: GoogleFonts.metrophobic(
              fontStyle: FontStyle.normal,
              fontSize: 18
            ),),

            onTap: (){
                   Navigator.of(context).push(MaterialPageRoute(builder: (context)=>PortionDetail(portionDataModel: index,)));
                 },
   
    );
    
  }
 
}
