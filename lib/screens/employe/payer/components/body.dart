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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Text(
                      "Solde d'aujourd'hui",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: kTextColorDark,
                      ),
                    ),
                    Text(
                      "13,37 €",
                      style: TextStyle(
                        fontFamily: "Bookman Old Style",
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: kTextColorBright,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "Solde total",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: kTextColorDark,
                      ),
                    ),
                    Text(
                      "420,00 €",
                      style: TextStyle(
                        fontFamily: "Bookman Old Style",
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: kTextColorBright,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20,),
            Image.asset(
              "assets/images/carte.png",
            ),
            SizedBox(height: 40,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/images/nfc.png", scale: 2.5),
              ],
              /*children: <Widget>[
                IconButton(
                  icon: Image.asset("assets/images/nfc.png", scale: 2.5),
                  onPressed: () {},
                ),
              ],*/
            ),
            SizedBox(height: 30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "En attente de transaction...",
                  style: TextStyle(
                    fontSize: 20,
                    color: kTextColorDark,
                  ),
                ),
              ],
            ),
          ],
        )
      ),
    );
  }
}