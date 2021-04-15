import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ui/screens/acceuil/acceuil_screen.dart';
import 'package:ui/screens/commercant/acceuil/commercant_acceuil.dart';
import 'package:ui/screens/connection/connection_screen.dart';
import 'package:ui/screens/employe/accueil/employe_accueil.dart';
import 'package:ui/screens/inscription/inscription_screen.dart';
import 'package:ui/screens/parametre/parametre_screen.dart';
import 'package:ui/screens/test_fetch/test_fetch.dart';

import '../../../constants.dart';

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
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(kButtonColor)),
              onPressed: () =>
                  {Navigator.pushNamed(context, InscriptionScreen.routeName)},
              child: Text("S'inscrire")),
          ElevatedButton(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(kButtonColor)),
              onPressed: () =>
                  {Navigator.pushNamed(context, ConnectionScreen.routeName)},
              child: Text("Se connecter")),
          ElevatedButton(
              onPressed: () =>
                  {Navigator.pushNamed(context, EmployeAccueil.routeName)},
              child:
                  Text("Test Paramètre")) //permet de tester la page paramètre
        ],
      ),
    ));
  }
}
