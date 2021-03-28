import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ui/screens/acceuil/acceuil_screen.dart';
import 'package:ui/screens/connection/connection_screen.dart';
import 'package:ui/screens/inscription/inscription_screen.dart';

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
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 58),
          ),
          SizedBox(height: 60),
          ElevatedButton(
              onPressed: () =>
                  {Navigator.pushNamed(context, InscriptionScreen.routeName)},
              child: Text("S'inscrire")),
          ElevatedButton(
              onPressed: () =>
                  {Navigator.pushNamed(context, ConnectionScreen.routeName)},
              child: Text("Se connecter"))
        ],
      ),
    ));
  }
}
