import 'package:flutter/widgets.dart';

import 'screens/accueil/accueil_screen.dart';
import 'screens/connection/connection_screen.dart';
import 'screens/employe/accueil/employe_accueil.dart';
import 'screens/employe/commerces/employe_commerces.dart';
import 'screens/employe/historique/employe_historique.dart';
import 'screens/employe/map/employe_map.dart';
import 'screens/employe/payer/employe_payer.dart';
import 'screens/employeur/accueil/employeur_liste_employes.dart';
import 'screens/inscription/inscription_screen.dart';


final Map<String, WidgetBuilder> routes = {
  AccueilScreen.routeName: (context) => AccueilScreen(),
  ConnectionScreen.routeName: (context) => ConnectionScreen(),
  InscriptionScreen.routeName: (context) => InscriptionScreen(),

  EmployeAccueil.routeName: (context) => EmployeAccueil(),
  EmployeHistorique.routeName: (context) => EmployeHistorique(),
  EmployePayer.routeName: (context) => EmployePayer(),
  EmployeCommerces.routeName: (context) => EmployeCommerces(),
  EmployeMap.routeName: (context) => EmployeMap(),

  EmployeurAccueil.routeName: (context) => EmployeurAccueil(),
};