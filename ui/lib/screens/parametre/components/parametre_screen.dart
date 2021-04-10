import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ui/modelsData/employe.dart';

Future<Employe> fetchData() async {
  String role = 'employes';
  String url1 = 'https://beskarprojettransversal.herokuapp.com/$role/8';
  String url = 'http://192.168.43.27:8080/$role/';
  final response = await http.get(Uri.parse(url1));

  if (response.statusCode == 200) {
    print("Todo bien");
    //Employe a;
    // If the server did return a 200 OK response,
    // then parse the JSON.
    //print(response.body);
    return Employe.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to post data');
  }
}

class ParametreScreenFields extends StatefulWidget {
  @override
  _ParametreScreenFields createState() => _ParametreScreenFields();
}

class _ParametreScreenFields extends State<ParametreScreenFields> {
  bool _isReadOnly = true;
  Map<String, dynamic> mapForm;
  Future<Employe> _dataPerson;
  final _formKey = GlobalKey<FormState>();

  void initState() {
    super.initState();
    _dataPerson = fetchData();
    print(_dataPerson);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Form(
        child: FutureBuilder<Employe>(
            future: _dataPerson,
            builder: (context, snapshot) {
              return Column(
                children: [
                  TextFormField(
                    initialValue: snapshot.data.nom,
                    readOnly: _isReadOnly,
                    decoration: InputDecoration(
                        labelText: "Nom",
                        border: InputBorder.none,
                        icon: IconButton(
                          onPressed: () {
                            setState(() {
                              if (_isReadOnly) {
                                _isReadOnly = false;
                              } else if (!_isReadOnly) {
                                _isReadOnly = true;
                              }
                            });
                          },
                          icon: Icon(Icons.person),
                        )),
                    onSaved: (String value) {
                      print("bonjour");
                      if (value == null) {
                        mapForm["nom"] = snapshot.data.nom;
                      }
                      mapForm["nom"] = value;
                    },
                  ),
                  TextFormField(
                    initialValue: snapshot.data.prenom,
                    readOnly: _isReadOnly,
                    decoration: InputDecoration(
                        labelText: "Prénom",
                        border: InputBorder.none,
                        icon: IconButton(
                          onPressed: () {
                            setState(() {
                              if (_isReadOnly) {
                                _isReadOnly = false;
                              } else if (!_isReadOnly) {
                                _isReadOnly = true;
                              }
                            });
                          },
                          icon: Icon(Icons.person),
                        )),
                    onSaved: (String value) {
                      if (value == null) {
                        mapForm["prenom"] = snapshot.data.prenom;
                      }
                      mapForm["prenom"] = value;
                    },
                  ),
                  TextFormField(
                    initialValue: snapshot.data.mail,
                    readOnly: _isReadOnly,
                    decoration: InputDecoration(
                        labelText: "Mail",
                        border: InputBorder.none,
                        icon: IconButton(
                          onPressed: () {
                            setState(() {
                              if (_isReadOnly) {
                                _isReadOnly = false;
                              } else if (!_isReadOnly) {
                                _isReadOnly = true;
                              }
                            });
                          },
                          icon: Icon(Icons.person),
                        )),
                    onSaved: (String value) {
                      if (value == null) {
                        mapForm["mail"] = snapshot.data.mail;
                      }
                      mapForm["mail"] = value;
                    },
                  ),
                  TextFormField(
                    initialValue: snapshot.data.password,
                    readOnly: _isReadOnly,
                    decoration: InputDecoration(
                        labelText: "Password",
                        border: InputBorder.none,
                        icon: IconButton(
                          onPressed: () {
                            setState(() {
                              if (_isReadOnly) {
                                _isReadOnly = false;
                              } else if (!_isReadOnly) {
                                _isReadOnly = true;
                              }
                            });
                          },
                          icon: Icon(Icons.person),
                        )),
                    onSaved: (String value) {
                      if (value == null) {
                        mapForm["password"] = snapshot.data.password;
                      }
                      mapForm["password"] = value;
                    },
                  ),
                  TextFormField(
                    initialValue: snapshot.data.adresse,
                    readOnly: _isReadOnly,
                    decoration: InputDecoration(
                        labelText: "Adresse",
                        border: InputBorder.none,
                        icon: IconButton(
                          onPressed: () {
                            setState(() {
                              if (_isReadOnly) {
                                _isReadOnly = false;
                              } else if (!_isReadOnly) {
                                _isReadOnly = true;
                              }
                            });
                          },
                          icon: Icon(Icons.person),
                        )),
                    onSaved: (String value) {
                      if (value == null) {
                        mapForm["adresse"] = snapshot.data.adresse;
                      }
                      mapForm["adresse"] = value;
                    },
                  ),
                  TextFormField(
                    initialValue: snapshot.data.codepostal,
                    readOnly: _isReadOnly,
                    decoration: InputDecoration(
                        labelText: "Code Postal",
                        border: InputBorder.none,
                        icon: IconButton(
                          onPressed: () {
                            setState(() {
                              if (_isReadOnly) {
                                _isReadOnly = false;
                              } else if (!_isReadOnly) {
                                _isReadOnly = true;
                              }
                            });
                          },
                          icon: Icon(Icons.person),
                        )),
                    onSaved: (String value) {
                      if (value == null) {
                        mapForm["codepostal"] = snapshot.data.codepostal;
                      }
                      mapForm["codepostal"] = value;
                    },
                  ),
                  TextFormField(
                    initialValue: snapshot.data.ville,
                    readOnly: _isReadOnly,
                    decoration: InputDecoration(
                        labelText: "Ville",
                        border: InputBorder.none,
                        icon: IconButton(
                          onPressed: () {
                            setState(() {
                              if (_isReadOnly) {
                                _isReadOnly = false;
                              } else if (!_isReadOnly) {
                                _isReadOnly = true;
                              }
                            });
                          },
                          icon: Icon(Icons.person),
                        )),
                    onSaved: (String value) {
                      if (value == null) {
                        mapForm["ville"] = snapshot.data.ville;
                      }
                      mapForm["ville"] = value;
                    },
                  ),
                  TextFormField(
                    initialValue: snapshot.data.nsiret,
                    readOnly: _isReadOnly,
                    decoration: InputDecoration(
                        labelText: "N° Siret",
                        border: InputBorder.none,
                        icon: IconButton(
                          onPressed: () {
                            setState(() {
                              if (_isReadOnly) {
                                _isReadOnly = false;
                              } else if (!_isReadOnly) {
                                _isReadOnly = true;
                              }
                            });
                          },
                          icon: Icon(Icons.person),
                        )),
                    onSaved: (String value) {
                      if (value == null) {
                        mapForm["nsiret"] = snapshot.data.nsiret;
                      }
                      mapForm["nsiret"] = value;
                    },
                  ),
                  ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState.validate()) {
                          _formKey.currentState.save();
                          print(mapForm);
                        }
                      },
                      child: Text("Envoyer les changements"))
                ],
              );
            }),
      ),
    );
  }
}
