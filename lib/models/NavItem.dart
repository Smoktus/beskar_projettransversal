import 'package:flutter/material.dart';
import 'package:flutter_app/screens/employe/accueil/employe_accueil.dart';
import 'package:flutter_app/screens/employe/commerces/employe_commerces.dart';
import 'package:flutter_app/screens/employe/historique/employe_historique.dart';
import 'package:flutter_app/screens/employe/map/employe_map.dart';
import 'package:flutter_app/screens/employe/payer/employe_payer.dart';

class NavItem {
  final int id;
  final String icon;
  final String label;
  final Widget destination;

  NavItem({this.id, this.icon, this.label, this.destination});

  bool destinationChecker() {
    if (destination != null) {
      return true;
    }
    return false;
  }
}

class NavItems extends ChangeNotifier {
  int selectedIndex = 0;

  void changeNavIndex({int index}) {
    selectedIndex = index;
    notifyListeners();
  }

  List<NavItem> items = [
    NavItem(
      id: 1,
      icon: "assets/icons/accueil.svg",
      label: "Accueil",
      destination: EmployeAccueil(),
    ),
    NavItem(
      id: 2,
      icon: "assets/icons/historique.svg",
      label: "Historique",
      destination: EmployeHistorique(),
    ),
    NavItem(
      id: 3,
      icon: "assets/icons/payer.svg",
      label: "Payer",
      destination: EmployePayer(),
    ),
    NavItem(
      id: 4,
      icon: "assets/icons/commerces.svg",
      label: "Commerces",
      destination: EmployeCommerces(),
    ),
    NavItem(
      id: 5,
      icon: "assets/icons/map.svg",
      label: "Map",
      destination: EmployeMap(),
    ),
  ];
}