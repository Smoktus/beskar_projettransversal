import 'package:flutter/material.dart';
import 'package:flutter_app/constants.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.fromLTRB(10,20,10,20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              // Les différentes rows
              children: [
                Text("MARS 2021", style: TextStyle(fontSize: 16, color: kTextColorDark)),
                Divider(
                  // Barre
                  height: 15,
                  thickness: 2,
                  color: kIconSelectedColor,
                ),
                SizedBox(height: 10),
                Column(
                  // Historique
                  children: [
                    Row(
                      // Transaction 1
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Image.asset("assets/images/check.png", scale: 2.2),
                        Column(
                          // Détails
                          children: [
                            Row(
                              // Nom & Montant
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text("LOREM IPSUM", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: kTextColorDark)),
                                SizedBox(width: 140),
                                Text("-10,00 €", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: kTextColorDark)),
                              ],
                            ),
                            Row(
                              // Date & Type de transaction
                              children: [
                                Text("05/03/2021", style: TextStyle(fontSize: 12, color: kTextColorDark)),
                                SizedBox(width: 150),
                                Text("Paiement effectué", style: TextStyle(fontSize: 12, color: kTextColorDark)),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    Divider(
                      // Barre
                      height: 30,
                      thickness: 0.5,
                      color: kDividerColor,
                      indent: 40,
                    ),
                    Row(
                      // Transaction 2
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Image.asset("assets/images/check.png", scale: 2.2),
                        Column(
                          // Détails
                          children: [
                            Row(
                              // Nom & Montant
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text("LOREM IPSUM", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: kTextColorDark)),
                                SizedBox(width: 140),
                                Text("-14,00 €", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: kTextColorDark)),
                              ],
                            ),
                            Row(
                              // Date & Type de transaction
                              children: [
                                Text("03/03/2021", style: TextStyle(fontSize: 12, color: kTextColorDark)),
                                SizedBox(width: 150),
                                Text("Paiement effectué", style: TextStyle(fontSize: 12, color: kTextColorDark)),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}