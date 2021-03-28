import 'package:flutter/material.dart';
import 'package:ui/screens/acceuil/acceuil_screen.dart';
import 'package:ui/routes.dart';
import './theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(primaryColor: Colors.orangeAccent[400]),
        initialRoute: AcceuilScreen.routeName,
        routes: routes);
  }
}
