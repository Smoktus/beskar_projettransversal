import 'package:flutter/material.dart';
import 'package:ui/screens/parametre/components/body.dart';

import '../../constants.dart';

class ParametreScreen extends StatelessWidget {
  static String routeName = "/parametre";
  @override
  Widget build(BuildContext context) {
    // You have to call it on your starting screen
    return Scaffold(
      //Peut-etre changer cette AppBar
      appBar: AppBar(
          backgroundColor: kAppBarColor,
          toolbarHeight: kAppBarHeight,
          centerTitle: true,
          title: Image.asset("assets/images/logo.png",
              scale: 10, color: kIconColor)),
      body: Body(),
    );
  }
}
