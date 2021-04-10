import 'package:flutter/material.dart';
import 'package:ui/components/appbar.dart';
import 'package:ui/screens/acceuil/components/body.dart';

class AcceuilScreen extends StatelessWidget {
  static String routeName = "/acceuil";
  @override
  Widget build(BuildContext context) {
    // You have to call it on your starting screen
    return Scaffold(
      appBar: MyAppBar(),
      /*AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
                image: AssetImage('assets/images/logo2.png'),
                fit: BoxFit.contain,
                height: 48)
          ],
        ),
      ),*/
      body: Body(),
    );
  }
}
