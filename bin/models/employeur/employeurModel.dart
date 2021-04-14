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
        "insert into ${this.table} (nom, prenom, mail, password, ville, codepostal, adresse, nsiret) values (@nom, @prenom, @mail, @password, @ville, @codepostal, @adresse, @nsiret)";
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
        'nom': row[1],
        'prenom': row[2],
        'mail': row[3],
        'password': row[4],
        'ville': row[5],
        'codepostal': row[6],
        'adresse': row[7],
        'nsiret': row[8]
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
        'nom': row[1],
        'prenom': row[2],
        'mail': row[3],
        'password': row[4],
        'ville': row[5],
        'codepostal': row[6],
        'adresse': row[7],
        'nsiret': row[8]
      });
    }
    ;

    return list[0];
  }

  update(int id, attribut) async {
    //String nomAttribut = "nom";
    Map<String, dynamic>.from(attribut);
    for (var entry in attribut.entries) {
      //print(entry.key);
      //print(entry.value);
      List<List<dynamic>> results = await this.conn.query(
          "UPDATE ${this.table} SET ${entry.key}=@${entry.key} WHERE id_entreprise=@id_entreprise",
          substitutionValues: {
            "id_entreprise": id,
            "${entry.key}": entry.value
          });
    }
    this.conn.close();
    return await this.getAll();
  }

  destroy(int id) async {
    List<List<dynamic>> results = await this.conn.query(
        "DELETE FROM ${this.table} WHERE id_entreprise=@id_entreprise",
        substitutionValues: {"id_entreprise": id});
    return await this.getAll();
  }
}
