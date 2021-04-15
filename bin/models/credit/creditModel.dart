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
  String horodate_credit;


  CreditModel(conn) {
    this.conn = conn;
    this.table = "credit";
  }



  //Constructeur - not sure we need this ?
  CreditModel.fromCreditModel(conn,
      {@required this.id_credit,
        @required this.id_employe,
        @required this.id_entreprise,
        @required this.montant,
        @required this.horodate_credit}) {
    this.conn = conn;
    this.table = "credit";
  }

  Map<String, dynamic> toJson() {
    return {
      'id_credit': this.id_credit,
      'id_employe': this.id_employe,
      'id_entreprise': this.id_entreprise,
      'montant': this.montant,
      'horodate_credit': this.horodate_credit,
    };
  }

  //a credit is a POST made by an employer, that updates the solde of one or all of his employes
  // POST/v1/credits
  /*insert(params) async {
    String sql =
        """INSERT INTO ${this.table} (id_employe, id_entreprise, montant, horodate_credit) values (@id_employe, @id_entreprise, @montant, to_char(current_timestamp, 'DD-Mon-YYYY:HH12:MI:SS')) RETURNING id_credit;
        UPDATE employe SET solde=solde + @montant WHERE id_employe=@id_employe;""";
    List<List<dynamic>> result =
    await conn.query(sql, substitutionValues: params);
    this.id_credit = result[0][0];
    this.conn.close();
    return this.id_employe;
  } */

  insert(params) async {
    String sql1 =
    """INSERT INTO ${this.table} (id_employe, id_entreprise, montant, horodate_credit)
       values (@id_employe, @id_entreprise, @montant, to_char(current_timestamp, 'YYYY-MM-DD HH12:MI:SS'))
       RETURNING id_credit;""";
    String sql2 = "UPDATE employe SET solde=solde + @montant WHERE id_employe=@id_employe;";
    List<List<dynamic>> result =
    await conn.query(sql1, substitutionValues: params);
    List<List<dynamic>> result2 =
    await conn.query(sql2, substitutionValues: params);
    this.id_credit = result[0][0];
    this.conn.close();
    return this.id_credit;
  }



  //GET/v1/credits
  getCredHistory() async {
    String sql =
        """SELECT id_credit,credit.id_employe,employe.nom,employe.prenom,montant,horodate_credit
        FROM ${this.table}
        INNER JOIN employe
        ON employe.id_employe = credit.id_employe"""
        /*"WHERE id_entreprise=@id_entreprise"   //doit on filtrer à ce niveau pour l'accès à l'historique de credits de l'employeur ? */
        ;

    List<List<dynamic>> results =
    await this.conn.query(sql);
    List<Map<String, dynamic>> list = [];

    for (final row in results) {
      list.add({
        "id_credit": row[0],
        "id_employe": row[1],
        "nom": row[2],
        "prenom": row[3],
        "montant": row[4],
        "horodate_credit": row[5],
      });
    }
    ;
    this.conn.close();
    return list;
  }


  //GET/v1/credit/:id
  getCredit(int id) async {
    List<List<dynamic>> results = await this.conn.query(
        "SELECT * FROM ${this.table} WHERE id_credit=@id_credit",
        substitutionValues: {"id_credit": id});

    List<Map<String, dynamic>> list = [];

    for (final row in results) {
      list.add({
        'id_credit': row[0],
        'id_employe': row[1],
        'id_entreprise': row[2],
        'montant': row[3],
        'horodate_credit': row[4],
      });
    }
    this.conn.close();
    return list[0];
  }







}