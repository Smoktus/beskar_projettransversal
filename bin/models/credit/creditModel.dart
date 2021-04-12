//import "../db/connection.dart";
import 'package:postgres/postgres.dart';
import 'package:meta/meta.dart';

class CreditModel {
  PostgreSQLConnection conn;
  String table;

  int id_credit;
  int id_employe;
  int id_entreprise;
  double montant;

  CreditModel(conn) {
    this.conn = conn;
    this.table = "credit";
  }

//to continue with postgresql transaction tutorial


}