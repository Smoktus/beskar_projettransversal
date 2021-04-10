import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui/models/NavItem.dart';
import 'package:ui/screens/acceuil/acceuil_screen.dart';
import 'package:ui/routes.dart';
import 'package:ui/screens/connection/components/connection_form.dart';
import 'package:ui/screens/inscription/components/inscription_form.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => DropDownListProvider()),
        ChangeNotifierProvider(create: (_) => ConnectionFormProvider()),
        ChangeNotifierProvider(create: (_) => NavItems()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Beskar',
        debugShowCheckedModeBanner: false,
        initialRoute: AcceuilScreen.routeName,
        routes: routes);
  }
}
