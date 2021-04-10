//import "../db/connection.dart";
import 'package:postgres/postgres.dart';
import 'package:meta/meta.dart';

class EmployeurModel {
  PostgreSQLConnection conn;
  String table;

  int id_entreprise;
  String nom, prenom;
  String mail, password;
  String ville, codePostal;
  String adresse, nSiret;

  EmployeurModel(conn) {
    this.conn = conn;
    this.table = "employeur";
  }

  EmployeurModel.fromEmployeurModel(conn,
      {@required this.id_entreprise,
      @required this.nom,
      @required this.prenom,
      @required this.mail,
      @required this.password,
      this.adresse,
      this.codePostal,
      this.ville,
      this.nSiret}) {
    this.conn = conn;
    this.table = "employeur";
  }

  Map<String, dynamic> toMap() {
    return {
      'id_entreprise': this.id_entreprise,
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

  insert(params) async {
    String sql =
        "insert into ${this.table} (nom, prenom, mail, password, adresse, codepostal, ville, nsiret) values (@nom, @prenom, @mail, @password, @adresse, @codepostal, @ville, @nsiret)";
    List<List<dynamic>> result =
        await conn.query(sql, substitutionValues: params);
  }

  getAll() async {
    List<List<dynamic>> results =
        await this.conn.query("SELECT * FROM ${this.table}");

    List<Map<String, dynamic>> list = [];

    for (final row in results) {
      list.add({
        'id_entreprise': row[0],
        'nom': row[2],
        'prenom': row[3],
        'mail': row[4],
        'password': row[5],
        'adresse': row[6],
        'codepostal': row[7],
        'ville': row[8],
        'nsiret': row[9]
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
      list.add({
        'id_entreprise': row[0],
        'nom': row[2],
        'prenom': row[3],
        'mail': row[4],
        'password': row[5],
        'adresse': row[6],
        'codepostal': row[7],
        'ville': row[8],
        'nsiret': row[9]
      });
    }
    ;

    return list[0];
  }

  update(int id, attribut) async {
    //String nomAttribut = "nom";
    Map<String, dynamic>.from(attribut);
    List<List<dynamic>> results = await this.conn.query(
        "UPDATE ${this.table} SET ${attribut.keys.first}=@${attribut.keys.first} WHERE id_entreprise=@id_entreprise",
        substitutionValues: {
          "id_entreprise": id,
          "${attribut.keys.first}": attribut.values.first
        });
    return await this.getAll();
  }

  destroy(int id) async {
    List<List<dynamic>> results = await this.conn.query(
        "DELETE FROM ${this.table} WHERE id_entreprise=@id_entreprise",
        substitutionValues: {"id_entreprise": id});
    return await this.getAll();
  }
}
