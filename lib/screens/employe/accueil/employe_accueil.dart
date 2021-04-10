import 'package:flutter/material.dart';
import 'package:flutter_app/components/appbar.dart';
import 'package:flutter_app/components/navbar.dart';

import 'components/body.dart';

class EmployeAccueil extends StatelessWidget {
  static String routeName = "/employe_accueil";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: MyAppBar(),
      body: Body(),
      bottomNavigationBar: MyBottomNavBar(),
    );
  }
}