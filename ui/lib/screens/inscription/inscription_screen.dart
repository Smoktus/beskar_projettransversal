import 'package:flutter/material.dart';

import 'components/body.dart';

class InscriptionScreen extends StatelessWidget {
  static String routeName = "//inscription";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Formulaire d'inscription"),
      ),
      body: Body(),
    );
  }
}
