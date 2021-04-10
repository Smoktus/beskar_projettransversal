import 'package:flutter/material.dart';
import 'package:ui/components/appbar.dart';
import 'package:ui/components/navbar.dart';

import 'components/body.dart';

class EmployeHistorique extends StatelessWidget {
  static String routeName = "/employe_historique";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: false,
      appBar: MyAppBar(),
      body: Body(),
      bottomNavigationBar: MyBottomNavBar(),
    );
  }
}
