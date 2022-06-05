import 'package:flutter/material.dart';
import 'package:ia_card/widgets/appBar.dart';

class OrdersAwaiting extends StatefulWidget {
  OrdersAwaiting({Key? key}) : super(key: key);

  @override
  State<OrdersAwaiting> createState() => _OrdersAwaitingState();
}

class _OrdersAwaitingState extends State<OrdersAwaiting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        textTitle: "Pedidos aguardando",
      ),
    );
  }
}
