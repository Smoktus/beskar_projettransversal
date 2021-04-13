/*import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui/screens/commercant/acceuil/commercant_acceuil.dart';
import 'package:ui/screens/commercant/encaissement/encaissement_screen.dart';
import 'package:ui/screens/commercant/historique/historique_screen.dart';

class CommercantNavBar extends StatefulWidget {
  @override
  _CommercantNavBar createState() => _CommercantNavBar();
}

class BottomNavBarProvider with ChangeNotifier {
  int _newIndex;

  get newIndex => _newIndex;

  void setValueChecked(int index) {
    _newIndex = index;
    notifyListeners();
  }
}

class _CommercantNavBar extends State<CommercantNavBar> {
  int _selectedIndex = 0;

  static List<String> _routeOptions = <String>[
    CommercantAcceuil.routeName,
    CommercantEncaissement.routeName,
    CommercantHistorique.routeName,
  ];

  /*void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
     //_widgetOptions.elementAt(_selectedIndex);
    Naviga
    });
  }*/
  void _onTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
    Navigator.pushNamed(context, _routeOptions[_selectedIndex]);
  }

//_widgetOptions.elementAt(_selectedIndex)
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Acceuil',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.history),
          label: 'Historique',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.credit_card),
          label: 'Encaissement',
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.amber[800],
      onTap: _onTap,
    );
  }
}
*/
