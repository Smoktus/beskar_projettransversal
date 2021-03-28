//import "../db/connection.dart";
import 'package:postgres/postgres.dart';
import 'package:meta/meta.dart';

class EmployeModel {
  PostgreSQLConnection conn;
  String table;
  final int id_employe;
  final String nom, prenom;
  final String mail, password;
  final String ville, codePostal;
  final String adresse, nSiret;
  final int id_entreprise;

  EmployeModel(conn,
      {this.table = "employe",
      @required this.id_employe,
      @required this.nom,
      @required this.prenom,
      @required this.mail,
      @required this.password,
      this.adresse,
      this.codePostal,
      this.ville,
      this.nSiret,
      @required this.id_entreprise});

  insert(String param, {String name}) async {
    List<List<dynamic>> results = await this.conn.query(
        "INSERT INTO ${this.table} (name) VALUES (@name)",
        substitutionValues: {"name": name});
    return await this.getAll();
  }

  getAll() async {
    List<List<dynamic>> results =
        await this.conn.query("SELECT * FROM ${this.table}");

    List<Map<String, dynamic>> list = [];

    for (final row in results) {
      list.add({"id": row[0], "name": row[1]});
    }
    ;
    return list;
  }

  getOne(int id) async {
    List<List<dynamic>> results = await this.conn.query(
        "SELECT * FROM ${this.table} WHERE id=@id",
        substitutionValues: {"id": id});

    List<Map<String, dynamic>> list = [];

    for (final row in results) {
      list.add({"id": row[0], "name": row[1]});
    }

    return list[0];
  }

  update(int id, {String name}) async {
    List<List<dynamic>> results = await this.conn.query(
        "UPDATE ${this.table} SET name=@name WHERE id=@id",
        substitutionValues: {"id": id, "name": name});
    return await this.getAll();
  }

  destroy(int id) async {
    List<List<dynamic>> results = await this.conn.query(
        "DELETE FROM ${this.table} WHERE id=@id",
        substitutionValues: {"id": id});
    return await this.getAll();
  }
}
