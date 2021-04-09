import 'package:flutter/material.dart';
import 'package:flutter_app/components/appbar.dart';
import 'package:flutter_app/components/navbar.dart';

import 'components/body.dart';

class EmployePayer extends StatelessWidget {
  static String routeName = "/employe_payer";
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