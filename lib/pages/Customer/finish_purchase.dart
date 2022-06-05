import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ia_card/constants.dart';
import 'package:ia_card/pages/Customer/customer_purchase_history.dart';
import 'package:ia_card/widgets/appBar.dart';
import 'package:ia_card/widgets/cart.dart';
import 'package:ia_card/widgets/post_get_firebase.dart';

class FinishPurchasePage extends StatefulWidget {
  const FinishPurchasePage({Key? key, required var this.cartTotalPrice})
      : super(key: key);
  final num cartTotalPrice;

  @override
  State<FinishPurchasePage> createState() => _FinishPurchasePageState();
}

enum FormType { cash, card } //Podemos fazer como dropdown ao invés de radio

class _FinishPurchasePageState extends State<FinishPurchasePage> {
  TextEditingController customerName = TextEditingController();
  TextEditingController customerTableNumber = TextEditingController();
  num? customerExchange;
  FormType? customerPaymentChoice = FormType.card;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBarWidget(
        textTitle: "Meu pedido",
      ),
      body: Container(
        height: MediaQuery.of(context).size.height -
            70 -
            MediaQuery.of(context).padding.top,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  makeInput(
                    label: "Nome do cliente",
                    ctrl: customerName,
                    keyboardType: TextInputType.text,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  makeInput(
                    label: "Número da mesa",
                    ctrl: customerTableNumber,
                    containerSize: 130.0,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.all(0),
                    horizontalTitleGap: 5,
                    minVerticalPadding: 0,
                    title: Text(
                      "Cartão",
                      style: TextStyle(color: K_TEXT_COLOR_HARD),
                    ),
                    leading: Radio<FormType>(
                      fillColor: MaterialStateColor.resolveWith(
                          (states) => K_PRIMARY_COLOR_LIGHT),
                      value: FormType.card,
                      groupValue: customerPaymentChoice,
                      onChanged: (FormType? value) {
                        setState(() {
                          customerPaymentChoice = value;
                        });
                      },
                    ),
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.all(0),
                    horizontalTitleGap: 5,
                    minVerticalPadding: 0,
                    title: Text(
                      "Dinheiro",
                      style: TextStyle(color: K_TEXT_COLOR_HARD),
                    ),
                    leading: Radio<FormType>(
                      fillColor: MaterialStateColor.resolveWith(
                          (states) => K_PRIMARY_COLOR_LIGHT),
                      value: FormType.cash,
                      groupValue: customerPaymentChoice,
                      onChanged: (FormType? value) {
                        setState(() {
                          customerPaymentChoice = value;
                        });
                      },
                    ),
                  ),
                  customerPaymentChoice == FormType.cash
                      ? SizedBox(
                          height: 20,
                        )
                      : Container(),
                  customerPaymentChoice == FormType.cash
                      ? makeInput(
                          label: "Troco pra quanto?",
                          ctrl: customerExchange,
                          containerSize: 130.0,
                        )
                      : Container(),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: K_PRIMARY_COLOR_LIGHT,
                  elevation: 0.0,
                ),
                onPressed: () {
                  ToFirebaseWidget(
                          userPersonalName: customerName.text,
                          customerTableNumber: customerTableNumber.text)
                      .userHistoryToFirebase();
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (context) => HistoryListingPageClass(
                            costumerName: customerName.text)),
                    (Route<dynamic> route) => route.isFirst,
                  );
                  Cart.clearCart();
                },
                child: Text(
                  "Enviar pedido",
                  style: GoogleFonts.passionOne(
                    color: Colors.white,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w400,
                    fontSize: 24.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget makeInput(
      {label,
      obsureText = false,
      ctrl,
      keyboardType = TextInputType.number,
      containerSize = double.infinity}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w900,
              color: K_PRIMARY_COLOR_LIGHT),
        ),
        SizedBox(
          height: 5,
        ),
        Container(
          width: containerSize,
          child: TextField(
            keyboardType: keyboardType,
            controller: ctrl,
            obscureText: obsureText,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: K_TEXT_COLOR_MEDIUM,
                ),
              ),
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: K_TEXT_COLOR_MEDIUM)),
            ),
          ),
        ),
      ],
    );
  }
}
