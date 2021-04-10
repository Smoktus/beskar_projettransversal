import 'package:flutter/material.dart';
import 'package:ui/screens/parametre/components/body.dart';

class ParametreScreen extends StatelessWidget {
  static String routeName = "/parametre";
  @override
  Widget build(BuildContext context) {
    // You have to call it on your starting screen
    return Scaffold(
      //Peut-etre changer cette AppBar
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
                image: AssetImage('assets/images/logo2.png'),
                fit: BoxFit.contain,
                height: 48)
          ],
        ),
      ),
      body: Body(),
    );
  }
}
