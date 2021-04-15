import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ui/modelsData/commercant.dart';
import 'package:ui/modelsData/employe.dart';
import 'package:ui/modelsData/employeur.dart';
import 'package:ui/screens/commercant/acceuil/commercant_acceuil.dart';
import 'package:ui/screens/connection/components/connection_form.dart';
import 'package:http/http.dart' as http;
import 'package:ui/screens/employe/accueil/employe_accueil.dart';
import 'package:ui/screens/employeur/accueil/employeur_liste_employes.dart';

import '../../../constants.dart';

class Body extends StatelessWidget {
  bool isRemembered = true;
  String mail;
  String password;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                cursorColor: kButtonColor,
                decoration: const InputDecoration(
                    icon: Icon(Icons.mail),
                    labelText: 'Username',
                    fillColor: kButtonColor,
                    hoverColor: kButtonColor,
                    focusColor: kButtonColor),
                onSaved: (String value) {
                  mail = value;
                },
                validator: (String value) {
                  return (value.isEmpty || !value.contains('@'))
                      ? 'Your email must contains @ '
                      : null;
                },
              ),
              TextFormField(
                cursorColor: kButtonColor,
                obscureText: true,
                decoration: const InputDecoration(
                  icon: Icon(Icons.lock),
                  labelText: 'Password',
                ),
                onSaved: (String value) {
                  password = value;
                },
                validator: (String value) {
                  return (value.isEmpty || value.length < 8)
                      ? 'Your password must be 8 character long'
                      : null;
                },
              ),
              Consumer<ConnectionFormProvider>(builder: (_, provider, __) {
                isRemembered = provider.newValue;
                print(isRemembered);

                return ConnectionForm();
              }),
              ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(kButtonColor)),
                  onPressed: () async {
                    if (_formKey.currentState.validate()) {
                      _formKey.currentState.save();
                      final prefs = await SharedPreferences.getInstance();
                      final String role = prefs.getString('role');
                      if (role == 'employes') {
                        final int id_employe = prefs.getInt('id_employe');
                        String url =
                            'https://beskarprojettransversal.herokuapp.com/$role/$id_employe';
                        final response = await http.get(Uri.parse(url));
                        Employe e = Employe.fromJson(jsonDecode(response.body));
                        if (e.mail == mail && e.password == password) {
                          print("peut proceder à la suite");
                          Navigator.popAndPushNamed(
                              context, EmployeAccueil.routeName);
                        }
                      } else if (role == 'employeurs') {
                        final int id_employeur = prefs.getInt('id_employeur');
                        String url =
                            'https://beskarprojettransversal.herokuapp.com/$role/$id_employeur';
                        final response = await http.get(Uri.parse(url));
                        Employeur r =
                            Employeur.fromJson(jsonDecode(response.body));
                        if (r.mail == mail && r.password == password) {
                          print("peut proceder à la suite");
                          Navigator.popAndPushNamed(
                              context, EmployeurAccueil.routeName);
                        }
                      } else if (role == 'commercants') {
                        final int id_commercant = prefs.getInt('id_commercant');
                        String url =
                            'https://beskarprojettransversal.herokuapp.com/$role/$id_commercant';
                        final response = await http.get(Uri.parse(url));
                        Commercant c =
                            Commercant.fromJson(jsonDecode(response.body));
                        if (c.mail == mail && c.password == password) {
                          print("peut proceder à la suite");
                          Navigator.popAndPushNamed(
                              context, CommercantAcceuil.routeName);
                        }
                      }
                      print('pressed $isRemembered');
                      //if (isRemembered) {}
                    }
                  },
                  child: Text('Submit')),
            ],
          ),
        ),
      ),
    );
  }
}
