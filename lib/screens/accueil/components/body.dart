import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/constants.dart';
import 'package:flutter_app/screens/connection/connection_screen.dart';
import 'package:flutter_app/screens/inscription/inscription_screen.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Bienvenue sur l'application Beskar !",
            textAlign: TextAlign.center,
            style: TextStyle(fontFamily: "Proxima Nova", fontWeight: FontWeight.bold, fontSize: 46, color: kTextColorDark),
          ),
          SizedBox(height: 60),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                 onPrimary: Colors.white,
                 primary: kIconSelectedColor,
                 elevation: 3,
                 minimumSize: Size(200,50),
               ),
            onPressed: () =>
                {Navigator.pushNamed(context, ConnectionScreen.routeName)},
            child: Text("Se connecter", style: TextStyle(fontFamily: "Proxima Nova", fontWeight: FontWeight.bold, fontSize: 20))),
          SizedBox(height: 20),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                 onPrimary: Colors.white,
                 primary: kIconSelectedColor,
                 elevation: 3,
                 minimumSize: Size(200,50),
               ),
            onPressed: () =>
                {Navigator.pushNamed(context, InscriptionScreen.routeName)},
            child: Text("S'inscrire", style: TextStyle(fontFamily: "Proxima Nova", fontWeight: FontWeight.bold, fontSize: 20))),
        ],
      ),
    ));
  }
}