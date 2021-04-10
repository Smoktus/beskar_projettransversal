import 'package:flutter/material.dart';
import 'package:flutter_app/constants.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children :[
        Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(
              "assets/images/plate.png",
              fit: BoxFit.cover,
            ),
            Column(
              children: [
                Text(
                  "Mon solde",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: kTextColorDark,
                    height: 5,
                  ),
                ),
                Text(
                  "Utilisable aujourd'hui",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: kTextColorDark,
                    height: -2,
                  ),
                ),
                Text(
                  "13,37 €",
                  style: TextStyle(
                    fontFamily: "Bookman Old Style",
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: kTextColorBright,
                    height: 1.2,
                  ),
                ),
                Text(
                  "Solde total",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: kTextColorDark,
                    height: 2,
                  ),
                ),
                Text(
                  "420,00 €",
                  style: TextStyle(
                    fontFamily: "Bookman Old Style",
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: kTextColorBright,
                    height: 1,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );

    /*return Column(
      children: [
        Image.asset(
          "assets/images/plate.png",
          fit: BoxFit.cover,
        ),
        Column(
          children: [
            Text(
              "Mon solde",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: kTextColorDark,
                height: 0,
              ),
            ),
            Text(
              "Utilisable aujourd'hui",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: kTextColorDark,
                height: 2.5,
              ),
            ),
            Text(
              "13,37 €",
              style: TextStyle(
                fontFamily: "Bookman Old Style",
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: kTextColorDark,
                height: 1,
              ),
            ),
          ],
        )
      ]
      
    );*/
  }
}