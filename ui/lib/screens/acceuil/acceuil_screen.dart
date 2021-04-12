import 'package:flutter/material.dart';
import 'package:ui/components/appbar.dart';
import 'package:ui/screens/acceuil/components/body.dart';

import '../../constants.dart';

class AcceuilScreen extends StatelessWidget {
  static String routeName = "/acceuil";
  @override
  Widget build(BuildContext context) {
    // You have to call it on your starting screen
    return Scaffold(
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
