import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../../../../constants.dart';
import '../../../../modelsData/employe.dart';

class EmployeSolde extends StatefulWidget {
  _EmployeSolde createState() => _EmployeSolde();
}

class _EmployeSolde extends State<EmployeSolde> {
  Employe _employe;

  Future<Employe> fetchEmploye() async {
    final prefs = await SharedPreferences.getInstance();
    final String role = prefs.getString('role');
    final int id_employe = prefs.getInt('id_employe');
    String url = 'https://beskarprojettransversal.herokuapp.com/$role/$id_employe';
    final response = await http.get(Uri.parse(url));
    Employe e = Employe.fromJson(jsonDecode(response.body));
    return e;
  }

  @override
  void initState() {
    super.initState();
    fetchEmploye().then((employe) {
      setState(() {
        _employe = employe;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(
              "assets/images/plate.png",
              fit: BoxFit.cover,
            ),
            Column(
              children: [
                Text(
                  "Mon solde",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: kTextColorDark,
                    height: 5,
                  ),
                ),
                Text(
                  _employe.solde.toStringAsFixed(2) + " €",
                  style: TextStyle(
                    fontFamily: "Bookman Old Style",
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: kTextColorBright,
                    height: 1.2,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

