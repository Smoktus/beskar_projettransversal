import 'package:flutter/material.dart';
import 'package:ui/constants.dart';
import 'package:ui/screens/commercant/acceuil/components/fetchTransaction.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(alignment: Alignment.center, children: [
          Image.asset(
            "assets/images/plate.png",
            fit: BoxFit.cover,
          ),
          TransactionFields()
        ]),
        SizedBox(
          height: 100,
        ),
        ElevatedButton(
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(kButtonColor)),
            onPressed: () {},
            child: Text("Génerer une facture"))
      ],
    );
  }
}
