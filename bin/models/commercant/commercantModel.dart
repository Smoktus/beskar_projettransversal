import 'package:postgres/postgres.dart';
import 'package:meta/meta.dart';

class CommercantModel {
  PostgreSQLConnection conn;
  String table;
  int id_commercant;
  String nom, prenom;
  String mail, password;
  String ville, codepostal;
  String adresse, nsiret;

  CommercantModel(conn) {
    this.conn = conn;
    this.table = "commercant";
  }

  CommercantModel.fromCommercantModel(conn,
      {@required this.id_commercant,
      @required this.nom,
      @required this.prenom,
      @required this.mail,
      @required this.password,
      this.adresse,
      this.codepostal,
      this.ville,
      this.nsiret}) {
    this.conn = conn;
    this.table = "commercant";
  }

  Map<String, dynamic> toMap() {
    return {
      'id_commercant': this.id_commercant,
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

  //pareil que employe
  insert(params) async {
    String sql =
        """insert into ${this.table} (nom, prenom, mail, password, ville, codepostal, adresse, nsiret) values 
        (@nom, @prenom, @mail, @password, @ville, @codepostal, @adresse, @nsiret) RETURNING id_commercant""";
    List<List<dynamic>> result =
        await conn.query(sql, substitutionValues: params);
    this.id_commercant = result[0][0];
    this.conn.close();
    return this.id_commercant;
    //return await this.getAll();
  }

  getAll() async {
    List<List<dynamic>> results =
        await this.conn.query("SELECT * FROM ${this.table}");

    List<Map<String, dynamic>> list = [];

    for (final row in results) {
      list.add({
        'id_commercant': row[0],
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
    this.conn.close();
    return list;
  }

  getOne(int id) async {
    List<List<dynamic>> results = await this.conn.query(
        "SELECT * FROM ${this.table} WHERE id_commercant=@id_commercant",
        substitutionValues: {"id_commercant": id});

    List<Map<String, dynamic>> list = [];

    for (final row in results) {
      list.add({
        'id_commercant': row[0],
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
    this.conn.close();
    return list[0];
  }

  /* update(int id, {String attribut}) async {
    String nomAttribut = "nom";
    List<List<dynamic>> results = await this.conn.query(
        "UPDATE ${this.table} SET $nomAttribut=@$nomAttribut WHERE id_entreprise=@id_entreprise",
        substitutionValues: {"id_commercant": id, "$nomAttribut": attribut});
    return await this.getAll();
  } */

  //copie de employe

  //attribut ici est une maps {"nomAttribut" : attribut}
  update(int id, attribut) async {
    Map<String, dynamic> a = Map<String, dynamic>.from(attribut);
    for (var entry in attribut.entries) {
      //print(entry.key);
      //print(entry.value);
      List<List<dynamic>> results = await this.conn.query(
          "UPDATE ${this.table} SET ${entry.key} =@${entry.key} WHERE id_commercant=@id_commercant",
          substitutionValues: {
            "id_commercant": id,
            "${entry.key}": entry.value
          });
    }
    this.conn.close();
    //return await this.getAll(); // à voir si on laisse ce return : juste regarder le header
  }

  destroy(int id) async {
    List<List<dynamic>> results = await this.conn.query(
        "DELETE FROM ${this.table} WHERE id_commercant=@id_commercant",
        substitutionValues: {"id_commercant": id});
    this.conn.close();
    //return await this.getAll();
  }
}
