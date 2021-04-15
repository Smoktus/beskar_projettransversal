import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shelf/shelf.dart';
import 'package:http/http.dart' as http;
import 'package:async/async.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../constants.dart';

/*Future<String> postPerson() async {
  String url1 = 'https://beskarprojettransversal.herokuapp.com/test/';
  String url = 'http://192.168.43.27:8080/solde/8';
  final response = await http.get(Uri.parse(url1));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    print(response.body);
    return response.body;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}*/

Future<String> postPersonVoid(String role, param) async {
  String url1 = 'https://beskarprojettransversal.herokuapp.com/$role/';
  String url = 'http://192.168.43.27:8080/$role/';
  final response = await http.post(Uri.parse(url1), body: param);

  if (response.statusCode == 200) {
    print("Todo bien");
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return response.body;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to post data');
  }
}

class DropDownListProvider with ChangeNotifier {
  List<String> _items = ['Employé', 'Employeur', 'Commerçant'];

  String _selectedItem;

  List<String> get items => _items;
  String get selected => _selectedItem;

  void setSelectedItem(String s) {
    _selectedItem = s;
    notifyListeners();
  }
}

class InscriptionForm extends StatefulWidget {
  @override
  _InscriptionFormState createState() => _InscriptionFormState();
}

class _InscriptionFormState extends State<InscriptionForm> {
  Future<String> _postData;
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    var mediaQueryData = MediaQuery.of(context);
    final width = mediaQueryData.size.width;
    final Map<String, dynamic> mapForm = new Map<String, dynamic>();
    String role = '';
    return SingleChildScrollView(
      child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text("Formulaire d'inscription",
                  style: TextStyle(
                    fontSize: 24,
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("Rôle",
                      style: TextStyle(
                        fontSize: 18,
                      )),
                  Consumer<DropDownListProvider>(
                    builder: (_, provider, __) {
                      return DropdownButton<String>(
                        value: provider.selected,
                        onChanged: (String newValue) {
                          provider.setSelectedItem(newValue);
                          //mapForm["role"] = newValue;
                          role = newValue;
                        },
                        items: provider.items
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      );
                    },
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    width: width / 2,
                    child: TextFormField(
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.all(8),
                        icon: Icon(Icons.person),
                        labelText: 'Nom',
                      ),
                      onSaved: (String value) {
                        mapForm["nom"] = value;
                      },
                      validator: (String value) {
                        return (value.isEmpty)
                            ? 'You need to fill this field'
                            : null;
                      },
                    ),
                  ),
                  Container(
                    width: width / 2,
                    child: TextFormField(
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.all(8),
                        icon: Icon(Icons.person),
                        labelText: 'Prénom',
                      ),
                      onSaved: (String value) {
                        mapForm["prenom"] = value;
                      },
                      validator: (String value) {
                        return (value.isEmpty)
                            ? 'You need to fill this field'
                            : null;
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(),
              Row(
                children: [
                  Container(
                    width: width / 2,
                    child: TextFormField(
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.all(8),
                        icon: Icon(Icons.contact_mail),
                        labelText: 'Mail',
                      ),
                      onSaved: (String value) {
                        mapForm["mail"] = value;
                      },
                      validator: (String value) {
                        return (value != null && !value.contains('@'))
                            ? 'Your email must contains @ '
                            : null;
                      },
                    ),
                  ),
                  Container(
                    width: width / 2,
                    child: TextFormField(
                      obscureText: true,
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.all(8),
                        icon: Icon(Icons.lock),
                        labelText: 'Password',
                      ),
                      onSaved: (String value) {
                        mapForm["password"] = value;
                      },
                      validator: (String value) {
                        return (value.isEmpty || value.length < 8)
                            ? 'Your password is too short 8 characters minimun'
                            : null;
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(),
              Row(
                children: [
                  Container(
                    width: width / 2,
                    child: TextFormField(
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.all(8),
                        icon: Icon(Icons.room),
                        labelText: 'Adresse',
                      ),
                      onSaved: (String value) {
                        mapForm["adresse"] = value;
                      },
                      validator: (String value) {
                        return (value.isEmpty)
                            ? 'You need to fill this field'
                            : null;
                      },
                    ),
                  ),
                  Container(
                    width: width / 2,
                    child: TextFormField(
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.all(8),
                        icon: Icon(Icons.local_post_office),
                        labelText: 'Code Postale',
                      ),
                      onSaved: (String value) {
                        mapForm["codepostal"] = value;
                      },
                      validator: (String value) {
                        return (value.isEmpty)
                            ? 'You need to fill this field'
                            : null;
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(),
              Row(
                children: [
                  Container(
                    width: width / 2,
                    child: TextFormField(
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.all(8),
                        icon: Icon(Icons.home),
                        labelText: 'Ville',
                      ),
                      onSaved: (String value) {
                        mapForm["ville"] = value;
                      },
                      validator: (String value) {
                        return (value.isEmpty)
                            ? 'You need to fill this field.'
                            : null;
                      },
                    ),
                  ),
                  Container(
                    width: width / 2,
                    child: TextFormField(
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.all(8),
                        icon: Icon(Icons.business),
                        labelText: 'Numéro de Siret',
                      ),
                      onSaved: (String value) {
                        mapForm["nsiret"] = value;
                      },
                      validator: (String value) {
                        return (value.isEmpty)
                            ? 'You need to fill this field.'
                            : null;
                      },
                    ),
                  ),
                ],
              ),
              ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(kButtonColor)),
                  onPressed: () async {
                    if (_formKey.currentState.validate()) {
                      _formKey.currentState.save();
                      print(mapForm);
                      if (role == 'Employé') {
                        String roles = 'employes';
                        String url1 =
                            'https://beskarprojettransversal.herokuapp.com/$roles/';
                        final response = await http.post(Uri.parse(url1),
                            body: jsonEncode(mapForm));
                        print(response.statusCode);
                        int id_employe = int.parse(response.body);
                        final prefs = await SharedPreferences.getInstance();
                        prefs.setString('role', roles);
                        prefs.setInt('id_employe', id_employe);
                      } else if (role == 'Employeur') {
                        String roles = 'employeurs';
                        String url1 =
                            'https://beskarprojettransversal.herokuapp.com/$roles/';
                        final response = await http.post(Uri.parse(url1),
                            body: jsonEncode(mapForm));
                        print(response.statusCode);
                        print(response.body); //récupération id
                        int id_entreprise = int.parse(response.body);
                        final prefs = await SharedPreferences.getInstance();
                        prefs.setString('role', roles);
                        prefs.setInt('id_entreprise', id_entreprise); //à tester
                      } else if (role == 'Commerçant') {
                        String roles = 'commercants';
                        String url1 =
                            'https://beskarprojettransversal.herokuapp.com/$roles/';
                        final response = await http.post(Uri.parse(url1),
                            body: jsonEncode(mapForm));
                        print(response.statusCode);
                        int id_commercant = int.parse(response.body);
                        final prefs = await SharedPreferences.getInstance();
                        prefs.setString('role', roles);
                        prefs.setInt('id_commercant', id_commercant);
                      }
                    }
                  },
                  child: Text("Envoyer"))
            ],
          )),
    );
  }
}

/*class DropDownList extends StatefulWidget {
  @override
  _DropDownList createState() => _DropDownList();
}

class _DropDownList extends State<DropDownList>{
  String dropdownValue = 'Employé';
  String holder = '';
  final _dropKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      key: _dropKey,
      value: dropdownValue,
      onChanged: (String newValue) {
        setState(() {
          dropdownValue = newValue;
        });
        //dropdownValue = newValue;
        //notifyListeners();
      },

      ///selectedItemBuilder: ,
      items: <String>['Employé', 'Employeur', 'Commercant']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }

  /*void getDropDownItem() {
    setState(() {
      holder = dropdownValue;
    });
  }*/
}*/

//_DropDownList createState() => _DropDownList();
