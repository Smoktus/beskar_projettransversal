import 'package:flutter/material.dart';
import 'package:ui/components/appbar.dart';

import 'components/body.dart';

class ConnectionScreen extends StatelessWidget {
  static String routeName = "/seconnecter";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: Body(),
    );
  }
}
