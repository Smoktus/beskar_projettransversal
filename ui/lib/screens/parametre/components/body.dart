import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ui/screens/parametre/parametre_screen.dart';
import 'package:ui/screens/parametre/components/parametre_screen.dart';

//créer une classe parametreFetch dans compoments
//Un Futur<Employe> fecthData() => accès au data
class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ParametreScreenFields();
  }
}
