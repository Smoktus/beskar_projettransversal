import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../../../../constants.dart';
import '../../../../modelsData/employe.dart';

Future<Employe> fetchEmploye() async {
  final prefs = await SharedPreferences.getInstance();
  final String role = prefs.getString('role');
  final int id_employe = prefs.getInt('id_employe');
  String url =
      'https://beskarprojettransversal.herokuapp.com/$role/$id_employe';
  final response = await http.get(Uri.parse(url));
  Employe e = Employe.fromJson(jsonDecode(response.body));
  return e;
}

class EmployeSolde extends StatefulWidget {
  _EmployeSolde createState() => _EmployeSolde();
}

class _EmployeSolde extends State<EmployeSolde> {
  Future<Employe> _employe;

  @override
  void initState() {
    super.initState();
    _employe = fetchEmploye();
    /*fetchEmploye().then((employe) {
      setState(() {
       
      });
    });*/
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
                Center(
                  child: (_employe == null)
                      ? CircularProgressIndicator()
                      : FutureBuilder<Employe>(
                          future: _employe,
                          builder: (context, snapshot) {
                            if (!snapshot.hasData) {
                              return Text("processing");
                            }
                            return Text(
                              snapshot.data.solde.toStringAsFixed(2) + " €",
                              style: TextStyle(
                                fontFamily: "Bookman Old Style",
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                                color: kTextColorBright,
                                height: 1.2,
                              ),
                            );
                          }),
                ),
              ],
            ),
          ],
        ),
        SizedBox(
          height: 180,
        ),
        Center(
          child: (_employe == null)
              ? CircularProgressIndicator()
              : FutureBuilder<Employe>(
                  future: _employe,
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return Text("processing");
                    }
                    return Text(
                      "Bonjour ${snapshot.data.prenom} !",
                      style: TextStyle(
                        fontFamily: "Bookman Old Style",
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: kTextColorBright,
                        height: 1.2,
                      ),
                    );
                  }),
        ),
      ],
    );
  }
}
