import 'package:flutter/widgets.dart';
import 'package:ui/screens/acceuil/acceuil_screen.dart';
import 'package:ui/screens/connection/connection_screen.dart';
import 'package:ui/screens/inscription/inscription_screen.dart';

//import different screens

final Map<String, WidgetBuilder> routes = {
  AcceuilScreen.routeName: (context) => AcceuilScreen(),
  ConnectionScreen.routeName: (context) => ConnectionScreen(),
  InscriptionScreen.routeName: (context) => InscriptionScreen()
};
