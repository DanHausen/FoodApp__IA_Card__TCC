import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ia_card/models/Product.dart';
import 'package:ia_card/pages/Product_details.dart';

class ProductTile extends StatelessWidget {
  final Product product;
  const ProductTile(this.product);

  get index => this.product;

  @override
  Widget build(BuildContext context) {
    final image = Image.network(product.image);
    return ListTile(
      leading: image,
      title: Text(
        product.name,
        style:
            GoogleFonts.metrophobic(fontStyle: FontStyle.normal, fontSize: 16),
      ),
      subtitle: Text(
        product.description,
        style: GoogleFonts.metrophobic(
          fontStyle: FontStyle.normal,
        ),
      ),
      trailing: Text(
        "R\$ " + product.price,
        style:
            GoogleFonts.metrophobic(fontStyle: FontStyle.normal, fontSize: 18),
      ),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ProductDetails(
              productModel: index,
            ),
          ),
        );
      },
    );
  }
}
