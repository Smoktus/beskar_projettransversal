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

  insert(params) async {
    String sql =
        "insert into ${this.table} (nom, prenom, mail, password, adresse, codepostal, ville, nsiret) values (@nom, @prenom, @mail, @password, @adresse, @codepostal, @ville, @nsiret)";
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
    return list;
  }

  getOne(int id) async {
    List<List<dynamic>> results = await this.conn.query(
        "SELECT * FROM ${this.table} WHERE id=@id",
        substitutionValues: {"id": id});

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

    return list[0];
  }

  update(int id, {String attribut}) async {
    String nomAttribut = "nom";
    List<List<dynamic>> results = await this.conn.query(
        "UPDATE ${this.table} SET $nomAttribut=@$nomAttribut WHERE id_entreprise=@id_entreprise",
        substitutionValues: {"id_commercant": id, "$nomAttribut": attribut});
    return await this.getAll();
  }

  destroy(int id) async {
    List<List<dynamic>> results = await this.conn.query(
        "DELETE FROM ${this.table} WHERE id_commercant=@id_commercant",
        substitutionValues: {"id_commercant": id});
    return await this.getAll();
  }
}
