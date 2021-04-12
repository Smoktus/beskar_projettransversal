import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ui/modelsData/employe.dart';

Future<Employe> fetchData() async {
  final prefs = await SharedPreferences.getInstance();
  final String role = prefs.getString('role');
  if (role == 'employes') {
    final int id_employe = prefs.getInt('id_employe');
    String url1 =
        'https://beskarprojettransversal.herokuapp.com/$role/$id_employe';
    final response = await http.get(Uri.parse(url1));
    if (response.statusCode == 200) {
      print("Todo bien");
      return Employe.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to post data');
    }
  } else if (role == 'commercant') {
    final int id_commercant = prefs.getInt('id_commercant');
    String url1 =
        'https://beskarprojettransversal.herokuapp.com/$role/$id_commercant';
    final response = await http.get(Uri.parse(url1));
    if (response.statusCode == 200) {
      print("Todo bien");
      return Employe.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to post data');
    }
  } else if (role == 'employeur') {
    final int id_entreprise = prefs.getInt('id_commercant');
    String url1 =
        'https://beskarprojettransversal.herokuapp.com/$role/$id_entreprise';
    final response = await http.get(Uri.parse(url1));
    if (response.statusCode == 200) {
      print("Todo bien");
      return Employe.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to post data');
    }
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
        child: (_dataPerson == null)
            ? CircularProgressIndicator()
            : FutureBuilder<Employe>(
                future: _dataPerson,
                builder: (context, snapshot) {
                  print(snapshot.error);
                  if (snapshot.hasData) {
                    if (snapshot.data != null) {
                      return SingleChildScrollView(
                        child: Column(
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
                                if (value.isEmpty) {
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
                                if (value.isEmpty) {
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
                                if (value.isEmpty) {
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
                                if (value.isEmpty) {
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
                                if (value.isEmpty) {
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
                                if (value.isEmpty) {
                                  mapForm["codepostal"] =
                                      snapshot.data.codepostal;
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
                                if (value.isEmpty) {
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
                                if (value.isEmpty) {
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
                        ),
                      );
                    }
                  } else if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  } else if (snapshot.data == null) {
                    return CircularProgressIndicator();
                  }
                  return CircularProgressIndicator();
                }),
      ),
    );
  }
}
