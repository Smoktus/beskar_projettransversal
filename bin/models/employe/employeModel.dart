//import "../db/connection.dart";
import 'package:postgres/postgres.dart';
import 'package:meta/meta.dart';

class EmployeModel {
  PostgreSQLConnection conn;
  String table;

  int id_employe;
  String nom, prenom;
  String mail, password;
  String ville, codepostal;
  String adresse, nsiret;
  double solde;
  int id_entreprise;

  EmployeModel(conn) {
    this.conn = conn;
    this.table = "employe";
  }

  //on utilise ce constructeur si on doit creer un objet de Employe dans
  //le fonctionnement de l'appli
  EmployeModel.fromEmployeModel(conn,
      {@required this.id_employe,
      this.solde,
      @required this.nom,
      @required this.prenom,
      @required this.mail,
      @required this.password,
      this.adresse,
      this.codepostal,
      this.ville,
      this.nsiret,
      @required this.id_entreprise}) {
    this.conn = conn;
    this.table = "employe";
  }

  Map<String, dynamic> toJson() {
    return {
      'id_employe': this.id_employe,
      'solde': this.solde,
      'nom': this.nom,
      'prenom': this.prenom,
      'mail': this.mail,
      'password': this.password,
      'adresse': this.adresse,
      'codepostal': this.codepostal,
      'ville': this.ville,
      'nsiret': this.nsiret
    };
  }

//insert into employe (solde, nom, prenom, mail, password, adresse, "codePostal" , ville, "nSiret") values (18, '{Truffaut}' , '{Anatole}', '{ana.tr@beskar.com}', '{truec}', '{23 truc muc}', '{69003}', '{Lyon}', '{1212121}');
  // POST/v1/employes
  //insert a new one !
  insert(params) async {
    String sql =
        "insert into ${this.table} (nom, prenom, mail, password, adresse, codepostal, ville, nsiret) values (@nom, @prenom, @mail, @password, @adresse, @codepostal, @ville, @nsiret) RETURNING id_employe";
    List<List<dynamic>> result =
        await conn.query(sql, substitutionValues: params);
    this.id_employe = result[0][0];
    this.conn.close();
    return this.id_employe;
  }

  getAll() async {
    List<List<dynamic>> results =
        await this.conn.query("SELECT * FROM ${this.table}");

    List<Map<String, dynamic>> list = [];

    for (final row in results) {
      list.add({
        "id_employe": row[0],
        "solde": row[1],
        "nom": row[2],
        "prenom": row[3],
        "mail": row[4],
        "password": row[5],
        "adresse": row[6],
        "codepostal": row[7],
        "ville": row[8],
        "nsiret": row[9]
      });
    }
    ;
    this.conn.close();
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
        'codepostal': row[7],
        'ville': row[8],
        'nsiret': row[9]
      });
    }
    this.conn.close();
    return list[0];
  }

  getSolde(int id) async {
    List<List<dynamic>> results = await this.conn.query(
        "SELECT solde FROM ${this.table} WHERE id_employe=@id_employe",
        substitutionValues: {"id_employe": id});
    this.solde = results[0][0];
    return this.solde;
  }

  //attribut ici est une maps {"nomAttribut" : attribut}
  update(int id, attribut) async {
    Map<String, dynamic> a = Map<String, dynamic>.from(attribut);
    for (var entry in attribut.entries) {
      //print(entry.key);
      //print(entry.value);
      List<List<dynamic>> results = await this.conn.query(
          "UPDATE ${this.table} SET ${entry.key} =@${entry
              .key} WHERE id_employe=@id_employe",
          substitutionValues: {
            "id_employe": id,
            "${entry.key}": entry.value
          });
    }
    this.conn.close();
    //return await this.getAll(); // à voir si on laisse ce return : juste regarder le header
  }

  updateSolde(int id, double solde) async {
    List<List<dynamic>> results = await this.conn.query(
        "UPDATE ${this.table} SET solde=@solde WHERE id_employe=@id_employe",
        substitutionValues: {"id_employe": id, "solde": solde});
    this.conn.close();
  }

  /*updateIdEntreprise(int id, {String nsiretEmployeur}){}*/

  destroy(int id) async {
    List<List<dynamic>> results = await this.conn.query(
        "DELETE FROM ${this.table} WHERE id_employe=@id_employe",
        substitutionValues: {"id_employe": id});
    this.conn.close();
    //return await this.getAll();
  }
}
