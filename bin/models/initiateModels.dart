import 'dart:async';

import "./samplemodel.dart";
import "../db/connection.dart";
import 'employe/employeModel.dart';
import 'employeur/employeurModel.dart';
import 'commercant/commercantModel.dart';
import 'credit/creditModel.dart';

Future<SampleModel> model() async {
  var db = DB();
  await db.conn.open();
  return SampleModel(db.conn);
}

Future<EmployeModel> modelEmploye() async {
  var db = DB();
  await db.conn.open();
  return EmployeModel(db.conn);
}

Future<EmployeurModel> modelEmployeur() async {
  var db = DB();
  await db.conn.open();
  return EmployeurModel(db.conn);
}

Future<CommercantModel> modelCommercant() async {
  var db = DB();
  await db.conn.open();
  return CommercantModel(db.conn);
}

Future<CreditModel> modelCredit() async {
  var db = DB();
  await db.conn.open();
  return CreditModel(db.conn);
}