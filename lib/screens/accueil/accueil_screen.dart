import 'package:flutter/material.dart';
import 'package:flutter_app/constants.dart';
import 'components/body.dart';

class AccueilScreen extends StatelessWidget {
  static String routeName = "/accueil";
  @override
  Widget build(BuildContext context) {
    // You have to call it on your starting screen
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: kAppBarColor,
        toolbarHeight: kAppBarHeight,
        elevation: 4.0,
        centerTitle: true,
        title: Image.asset("assets/images/logo.png", color: kIconColor, scale: 10),
      ),
      body: Body(),
    );
  }
}