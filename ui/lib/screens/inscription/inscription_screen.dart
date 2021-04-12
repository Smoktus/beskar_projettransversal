import 'package:flutter/material.dart';

import '../../constants.dart';
import 'components/body.dart';

class InscriptionScreen extends StatelessWidget {
  static String routeName = "//inscription";

  @override
  Widget build(BuildContext context) {
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
