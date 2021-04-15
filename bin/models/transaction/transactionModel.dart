import 'package:postgres/postgres.dart';

class TransactionModel {
  PostgreSQLConnection conn;
  String table;

  int id_transaction;
  int id_employe;
  int id_commercant;
  int id_facture;
  double prix_vente;
  var date_transaction;

  TransactionModel(conn) {
    this.conn = conn;
    this.table = "transaction";
  }

  //Constructeur - not sure we need this ?
  /*TransactionsModel.fromCreditModel(conn,
      {@required this.id_credit,
      @required this.id_employe,
      @required this.id_entreprise,
      @required this.montant,
      @required this.horodate_credit}) {
    this.conn = conn;
    this.table = "credit";
  }*/

  //POST v1/transactions/
  //{
  //  prix_vente : prix,
  //  id_commercan: id
  //}
  insert(params) async {
    String sql =
        """INSERT INTO ${this.table} (date_transaction, prix_vente, id_commercant) 
        values (to_char(current_timestamp, 'YYYY-MM-DD HH12:MI:SS'), @prix_vente, @id_commercant) RETURNING id_transaction;""";
    List<List<dynamic>> result =
        await conn.query(sql, substitutionValues: params);
    this.id_transaction = result[0][0];
    this.conn.close();
    return this.id_transaction;
  }

  getAll() async {
    String sql = """SELECT * FROM ${this.table}""";
    List<List<dynamic>> results = await conn.query(sql);

    List<Map<String, dynamic>> list = [];

    for (final row in results) {
      list.add({
        "id_transaction": row[0],
        "date_transaction": row[1],
        "prix_vente": row[2],
        "id_employe": row[3],
        "id_commercant": row[4],
        "id_facture": row[5],
      });
    }
    ;
    this.conn.close();
    return list;
  }

  getOne(int id_transaction) async {
    String sql =
        """SELECT * FROM ${this.table} WHERE id_transaction=@id_transaction""";
    List<List<dynamic>> results = await conn
        .query(sql, substitutionValues: {"id_transaction": id_transaction});

    List<Map<String, dynamic>> list = [];

  for (final row in results) {
      list.add({
        "id_transaction": row[0],
        "date_transaction": row[1],
        "prix_vente": row[2],
        "id_employe": row[3],
        "id_commercant": row[4],
        "id_facture": row[5],
      });
    }
    ;
    this.conn.close();
    return list;
  }

  getCommercantHistory(/*int id_commercant*/) async {
    String sql =
        """SELECT id_credit,credit.id_commercant,commercant.nom,commercant.prenom,prix_vente,date_transaction
        FROM ${this.table}
        INNER JOIN commercant
        ON commercant.id_commercant = credit.id_commercant""";
    List<List<dynamic>> results = await conn
        .query(sql, substitutionValues: {"id_transaction": id_transaction});

    List<Map<String, dynamic>> list = [];
  }

}
