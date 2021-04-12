import 'package:flutter/material.dart';
import 'package:ui/components/appbar.dart';

import '../../constants.dart';
import 'components/body.dart';

class ConnectionScreen extends StatelessWidget {
  static String routeName = "/seconnecter";
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
