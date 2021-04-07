import 'package:flutter/widgets.dart';

import 'screens/employe/accueil/employe_accueil.dart';
import 'screens/employe/commerces/employe_commerces.dart';
import 'screens/employe/historique/employe_historique.dart';
import 'screens/employe/map/employe_map.dart';
import 'screens/employe/payer/employe_payer.dart';


final Map<String, WidgetBuilder> routes = {
  EmployeAccueil.routeName: (context) => EmployeAccueil(),
  EmployeHistorique.routeName: (context) => EmployeHistorique(),
  EmployePayer.routeName: (context) => EmployePayer(),
  EmployeCommerces.routeName: (context) => EmployeCommerces(),
  EmployeMap.routeName: (context) => EmployeMap(),
};