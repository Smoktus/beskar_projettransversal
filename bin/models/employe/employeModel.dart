//import "../db/connection.dart";
import 'package:postgres/postgres.dart';
import 'package:meta/meta.dart';

class EmployeModel {
  PostgreSQLConnection conn;
  String table;

  int id_employe;
  String nom, prenom;
  String mail, password;
  String ville, codePostal;
  String adresse, nSiret;
  double solde;
  int id_entreprise;

  EmployeModel(conn) {
    this.conn = conn;
    this.table = "employe";
  }

  EmployeModel.fromEmployeModel(conn,
      {this.table = "employe",
      @required this.id_employe,
      this.solde,
      @required this.nom,
      @required this.prenom,
      @required this.mail,
      @required this.password,
      this.adresse,
      this.codePostal,
      this.ville,
      this.nSiret,
      @required this.id_entreprise});

  /*EmployeModel.fromEmployeModel(
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
      this.id_entreprise});*/

  Map<String, dynamic> toMap() {
    return {
      'id_employe': this.id_employe,
      'solde': this.solde,
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

//insert into employe (solde, nom, prenom, mail, password, adresse, "codePostal" , ville, "nSiret") values (18, '{Truffaut}' , '{Anatole}', '{ana.tr@beskar.com}', '{truec}', '{23 truc muc}', '{69003}', '{Lyon}', '{1212121}');
  // POST/v1/employes
  //param is a map of the information
  insert(params) async {
    String sql =
        "insert into ${this.table} (nom, prenom, mail, password, adresse, codePostal, ville, nSiret) values (@nom, @prenom, @mail, @password, @adresse, @codePostal, @ville, @nSiret)";
    List<List<dynamic>> result =
        await conn.query(sql, substitutionValues: params);
    //return await this.getAll();
  }

  getAll() async {
    List<List<dynamic>> results =
        await this.conn.query("SELECT * FROM ${this.table}");

    List<Map<String, dynamic>> list = [];

    for (final row in results) {
      list.add({
        'id_employe': row[0],
        'solde': row[1],
        'nom': row[2],
        'prenom': row[3],
        'mail': row[4],
        'password': row[5],
        'adresse': row[6],
        'codePostal': row[7],
        'ville': row[8],
        'nSiret': row[9]
      });
    }
    ;

    return list;
  }

  getOne(int id) async {
    List<List<dynamic>> results = await this.conn.query(
        "SELECT * FROM ${this.table} WHERE id_employe=@id_employe",
        substitutionValues: {"id_employe": id});

    List<Map<String, dynamic>> list = [];

    for (final row in results) {
      list.add({
        'id_employe': row[0],
        'solde': row[1],
        'nom': row[2],
        'prenom': row[3],
        'mail': row[4],
        'password': row[5],
        'adresse': row[6],
        'codePostal': row[7],
        'ville': row[8],
        'nSiret': row[9]
      });
    }

    return list[0];
  }

  getSolde(int id) async {
    List<List<dynamic>> results = await this.conn.query(
        "SELECT ${this.solde} FROM ${this.table} WHERE id_employe=@id_employe",
        substitutionValues: {"id_employe": id});
    return this.solde;
  }

  update(int id, {String name}) async {
    List<List<dynamic>> results = await this.conn.query(
        "UPDATE ${this.table} SET nom=@nom WHERE id_employe=@id_employe",
        substitutionValues: {"id_employe": id, "nom": name});
    return await this.getAll();
  }

  destroy(int id) async {
    List<List<dynamic>> results = await this.conn.query(
        "DELETE FROM ${this.table} WHERE id_employe=@id_employe",
        substitutionValues: {"id_employe": id});
    return await this.getAll();
  }
}
