import 'dart:convert';
import 'dart:convert';
import "./connection.dart";
import "../models/samplemodel.dart";
import "../models/employe/employeModel.dart";
// This file is for testing the DB class

void main() async {
  var em = {
    1,
    "Jean",
    "Dupont",
    "jean.dupont@beskar.com",
    "azerty",
    "223 rue truc",
    "69003",
    "Lyon",
    "121212",
    2
  };
  var db = DB();
  await db.conn.open();
  /*var samplemodel = EmployeModel.fromEmployeModel(db.conn,
      id_employe: em.elementAt(1),
      nom: em.elementAt(2),
      prenom: em.elementAt(3),
      mail: em.elementAt(4),
      password: em.elementAt(5),
      adresse: em.elementAt(6),
      codePostal: em.elementAt(7),
      ville: em.elementAt(8),
      nSiret: em.elementAt(9),
      id_entreprise: em.elementAt(10));*/

  var employeModel = EmployeModel(db.conn);
  var params = {
    'nom': "Dupont",
    'prenom': "Jean",
    'mail': "jean.dupont@beskar.com",
    'password': "azerty",
    'adresse': "223 rue du truc",
    'codepostal': "69003",
    'ville': "Lyon",
    'nsiret': "12052045",
  };
  //var results = await employeModel.getAll();
  //var results = await employeModel.insert(params);
  //var r = await employeModel.destroy(11);
  var r = await employeModel.getAll();
  print(jsonEncode(r));
  db.conn.close();
}
