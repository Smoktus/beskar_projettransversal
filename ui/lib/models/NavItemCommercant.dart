import 'package:flutter/material.dart';
import 'package:ui/screens/commercant/acceuil/commercant_acceuil.dart';
import 'package:ui/screens/commercant/encaissement/encaissement_screen.dart';
import 'package:ui/screens/commercant/historique/historique_screen.dart';

class NavItemCommercant {
  final int id;
  final String icon;
  final String label;
  final Widget destination;

  NavItemCommercant({this.id, this.icon, this.label, this.destination});

  bool destinationCheckerCommercant() {
    if (destination != null) {
      return true;
    }
    return false;
  }
}

class NavItemsCommercant extends ChangeNotifier {
  int selectedIndex = 0;

  void changeNavIndex({int index}) {
    selectedIndex = index;
    notifyListeners();
  }

  List<NavItemCommercant> items = [
    NavItemCommercant(
      id: 1,
      icon: "assets/icons/accueil.svg",
      label: "Accueil",
      destination: CommercantAcceuil(),
    ),
    NavItemCommercant(
      id: 2,
      icon: "assets/icons/historique.svg",
      label: "Historique",
      destination: CommercantHistorique(),
    ),
    NavItemCommercant(
      id: 3,
      icon: "assets/icons/payer.svg",
      label: "Payer",
      destination: CommercantEncaissement(),
    ),
    /*NavItemCommercant(
      id: 4,
      icon: "assets/icons/commerces.svg",
      label: "Commerces",
      destination: EmployeCommerces(),
    ),
    NavItemCommercant(
      id: 5,
      icon: "assets/icons/map.svg",
      label: "Map",
      destination: EmployeMap(),
    ),*/
  ];
}
