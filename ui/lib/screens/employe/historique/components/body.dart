import 'package:flutter/material.dart';
import 'package:ui/constants.dart';
import 'package:ui/screens/employe/historique/components/employe_historique.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return HistoriqueFieldsEmploye();
    /*Container(
      padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
              // Les différentes rows
              children: [
                Text("MARS 2021",
                    style: TextStyle(fontSize: 16, color: kTextColorDark)),
                Divider(
                  // Barre
                  height: 15,
                  thickness: 2,
                  color: kIconSelectedColor,
                ),
              ]),
          HistoriqueFieldsEmploye()
        ],
      ),
    );*/
  }
}
