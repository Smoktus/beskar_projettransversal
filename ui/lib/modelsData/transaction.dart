import 'dart:convert';
import 'dart:core';

class Transaction {
  final int id_transaction;
  final String date_transaction;
  final double prix_vente;
  int id_employe;
  int id_commercant;
  int id_facture;

  //Transaction({this.id_transaction, this.date_transaction, this.prix_vente});

  Transaction(
      {this.id_transaction,
      this.date_transaction,
      this.prix_vente,
      this.id_employe,
      this.id_commercant,
      this.id_facture});

  Map<String, dynamic> toJson(String data) {
    return jsonDecode(data);
  }

  factory Transaction.fromJson(Map<String, dynamic> json) {
    return Transaction(
      id_transaction: json["id_employe"],
      date_transaction: json["date_transaction"],
      prix_vente: json["prix_vente"],
      id_employe: json["id_employe"],
      id_commercant: json["id_commercant"],
      id_facture: json["id_facture"],
    );
  }

  /*factory Transaction.fromJson(Map<String, dynamic> json) {
    return Transaction(
        id_transaction: json["id_employe"],
        date_transaction: json["date_transaction"],
        prix_vente: json["prix_vente"]);
  }*/
  /*Map<String, dynamic> toJsonfromTransaction(Transaction t) {
    Map<String, dynamic> a = {
      "id_transaction": t.id_transaction,
      "date_transaction": t.date_transaction,
      "prix_vente": t.prix_vente
    };
    return a;
  }*/
}
