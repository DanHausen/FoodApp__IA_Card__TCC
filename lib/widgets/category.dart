import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChipCategory extends StatelessWidget {
  final String category;

  const ChipCategory (this.category);

  @override
  Widget build(BuildContext context) {
    return  Chip(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        backgroundColor: Color.fromRGBO(255, 161, 73, 1).withOpacity(0.5),
        label: Container(
          width: 120,
          height: 40,
        child: Align(
            alignment: Alignment.center,
            child: Text(category, 
            
              textAlign: TextAlign.center,
              style: GoogleFonts.metrophobic(
              fontStyle: FontStyle.normal,
              fontSize: 18
            ),)
        ),
        
      ),
      );

      

  }
}