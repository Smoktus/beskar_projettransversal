import 'package:flutter/material.dart';
import 'package:flutter_app/routes.dart';
//import 'package:flutter_app/theme.dart';
import 'package:flutter_app/screens/employe/accueil/employe_accueil.dart';
import 'package:provider/provider.dart';

import 'models/NavItem.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => NavItems(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Beskar',
        //theme: theme(),
        // home: SplashScreen(),
        initialRoute: EmployeAccueil.routeName,
        routes: routes,
      ),
    );
  }
}
