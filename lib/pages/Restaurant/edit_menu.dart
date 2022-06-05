import 'package:flutter/material.dart';
import 'package:ia_card/widgets/appBar.dart';

class EditRestaurantMenu extends StatefulWidget {
  EditRestaurantMenu({Key? key}) : super(key: key);

  @override
  State<EditRestaurantMenu> createState() => _EditRestaurantMenuState();
}

class _EditRestaurantMenuState extends State<EditRestaurantMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        textTitle: "Editar Cardápio",
      ),
    );
  }
}
