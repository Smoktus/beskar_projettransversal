import 'package:flutter/material.dart';

import 'components/body.dart';

class ConnectionScreen extends StatelessWidget {
  static String routeName = "/seconnecter";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign In"),
      ),
      body: Body(),
    );
  }
}
