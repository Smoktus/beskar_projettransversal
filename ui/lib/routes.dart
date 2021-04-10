import 'package:flutter/widgets.dart';
import 'package:ui/screens/acceuil/acceuil_screen.dart';
import 'package:ui/screens/connection/connection_screen.dart';
import 'package:ui/screens/employe/accueil/employe_accueil.dart';
import 'package:ui/screens/employe/commerces/employe_commerces.dart';
import 'package:ui/screens/employe/historique/employe_historique.dart';
import 'package:ui/screens/employe/map/employe_map.dart';
import 'package:ui/screens/employe/payer/employe_payer.dart';
import 'package:ui/screens/employeur/accueil/employeur_liste_employes.dart';
import 'package:ui/screens/inscription/inscription_screen.dart';
import 'package:ui/screens/parametre/parametre_screen.dart';
import 'package:ui/screens/test_fetch/test_fetch.dart';

//import different screens

final Map<String, WidgetBuilder> routes = {
  AcceuilScreen.routeName: (context) => AcceuilScreen(),
  ConnectionScreen.routeName: (context) => ConnectionScreen(),
  InscriptionScreen.routeName: (context) => InscriptionScreen(),
  ParametreScreen.routeName: (context) => ParametreScreen(),
  FetchData.routeName: (context) => FetchData(),
  EmployeAccueil.routeName: (context) => EmployeAccueil(),
  EmployeHistorique.routeName: (context) => EmployeHistorique(),
  EmployePayer.routeName: (context) => EmployePayer(),
  EmployeCommerces.routeName: (context) => EmployeCommerces(),
  EmployeMap.routeName: (context) => EmployeMap(),
  EmployeurAccueil.routeName: (context) => EmployeurAccueil(),
};
