import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ia_card/models/Product.dart';
import 'package:ia_card/pages/Product_selected_details.dart';

class ProductTile extends StatelessWidget {
  final Product product;
  const ProductTile(this.product);

  get index => this.product;

  @override
  Widget build(BuildContext context) {
    final image = Image.network(product.image);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ListTile(
        leading: image,
        title: Text(
          product.name,
          style: GoogleFonts.metrophobic(
            color: Colors.grey[800],
            fontStyle: FontStyle.normal,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          product.description,
          style: GoogleFonts.metrophobic(
            fontStyle: FontStyle.normal,
            fontSize: 14,
          ),
        ),
        trailing: Text(
          "R\$ " + product.price,
          style: GoogleFonts.metrophobic(
            fontStyle: FontStyle.normal,
            color: Colors.grey[800],
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => ProductSelectedDetails(
                productModel: index,
              ),
            ),
          );
        },
      ),
    );
  }
}
