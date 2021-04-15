import 'package:postgres/postgres.dart';
import 'package:meta/meta.dart';

class FactureModel {
  PostgreSQLConnection conn;
  String table;

  int id_facture;
  int id_transaction;
  var date_transaction;
  int prix_vente;
  int id_banque;
  int id_commercant;
  //int id_entreprise;

  FactureModel(conn) {
    this.conn = conn;
    this.table = "facture";
  }

  getOne(int id_facture) async {
    String sql =
    """SELECT * FROM ${this.table} WHERE id_facture=@id_facture""";
    List<List<dynamic>> results = await conn
        .query(sql, substitutionValues: {"id_facture": id_facture});

    List<Map<String, dynamic>> list = [];

    for (final row in results) {
      list.add({
        "id_facture": row[0],
        "id_transaction": row[1],
        "date_transaction": row[2],
        "prix_vente": row[3],
        "id_commercant": row[4],
        "id_banque": row[5],
        //"id_entreprise": row[6],
      });
    }
    ;
    this.conn.close();
    return list;
  }

  getAll() async {
    String sql = """SELECT * FROM ${this.table}""";
    List<List<dynamic>> results = await conn.query(sql);

    List<Map<String, dynamic>> list = [];

    for (final row in results) {
      list.add({
        "id_facture": row[0],
        "id_transaction": row[1],
        "date_transaction": row[2],
        "prix_vente": row[3],
        "id_commercant": row[4],
        "id_banque": row[5],
        //"id_entreprise": row[6],
      });
    }
    ;
    this.conn.close();
    return list;
  }

}