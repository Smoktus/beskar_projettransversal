import 'package:flutter/material.dart';
import 'package:flutter_app/screens/employe/accueil/employe_accueil.dart';
import 'package:flutter_app/screens/employe/historique/employe_historique.dart';
import 'package:flutter_app/screens/employe/payer/employe_payer.dart';

class NavItem {
  final int id;
  final String icon;
  final Widget destination;

  NavItem({this.id, this.icon, this.destination});

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
      destination: EmployeAccueil(),
    ),
    NavItem(
      id: 2,
      icon: "assets/icons/accueil.svg",
      destination: EmployeHistorique(),
    ),
    NavItem(
      id: 3,
      icon: "assets/icons/accueil.svg",
      destination: EmployePayer(),
    ),
    NavItem(
      id: 4,
      icon: "assets/icons/accueil.svg",
      //destination: EmployeCommerces(),
    ),
    NavItem(
      id: 5,
      icon: "assets/icons/accueil.svg",
      //destination: EmployeMap(),
    ),
  ];
}