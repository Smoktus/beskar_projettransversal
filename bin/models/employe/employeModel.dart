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

  EmployeModel.fromEmployeModel(
      {this.table = "employe",
      this.id_employe,
      @required this.nom,
      @required this.prenom,
      @required this.mail,
      @required this.password,
      this.adresse,
      this.codePostal,
      this.ville,
      this.nSiret,
      this.id_entreprise});

  Map<String, dynamic> toMap() {
    return {
      'id_employe': this.id_employe,
      'nom': this.nom,
      'prenom': this.prenom,
      'mail': this.mail,
      'password': this.password,
      'adresse': this.adresse,
      'codePostal': this.codePostal,
      'ville': this.ville,
      'nSiret': this.nSiret
    };
  }

  // POST/v1/employes
  insert(String sql, params) async {
    String sql =
        "insert into ${this.table} (name, prenom, mail, password, adresse, codePostal, ville, nSiret) values (@nom, @prenom, @mail, @password, @adresse, @codePostal, @ville, @nSiret)";
    List<List<dynamic>> result =
        await conn.query(sql, substitutionValues: params);
    //params has to be a map of the model
    /* {"nom" : nom,
        "prenom" : prenom",
        ect... }*/
    /*List<List<dynamic>> results = await this.conn.query(
        "INSERT INTO ${this.table} (nom) VALUES (@name)",
        substitutionValues: {"name": name});*/
    //return await this.getAll();
  }

  getAll() async {
    List<List<dynamic>> results =
        await this.conn.query("SELECT * FROM ${this.table}");

    List<Map<String, dynamic>> list = [];

    for (final row in results) {
      list.add({
        'id_employe': row[0],
        'nom': row[1],
        'prenom': row[2],
        'mail': row[3],
        'password': row[4],
        'adresse': row[5],
        'codePostal': row[6],
        'ville': row[7],
        'nSiret': row[8]
      });
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
