import 'package:flutter/material.dart';
import 'package:ui/components/appbar.dart';
import 'package:ui/components/navbarCommercant.dart';
import 'package:ui/screens/commercant/acceuil/components/body.dart';

class CommercantAcceuil extends StatelessWidget {
  static String routeName = "/commercant_acceuil";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: MyAppBar(),
      body: Body(),
      bottomNavigationBar: MyBottomNavBarCommercant(),
    );
  }
}
