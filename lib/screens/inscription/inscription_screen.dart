import 'package:flutter/material.dart';
import 'package:flutter_app/constants.dart';

import 'components/body.dart';

class InscriptionScreen extends StatelessWidget {
  static String routeName = "//inscription";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kAppBarColor,
        toolbarHeight: kAppBarHeight,
        elevation: 4.0,
        title: Text("Formulaire d'inscription"),
      ),
      body: Body(),
    );
  }
}