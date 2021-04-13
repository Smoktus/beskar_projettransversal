import 'dart:convert';
import 'dart:core';

class Transaction {
  final int id_transaction;
  final DateTime date_transaction;
  final double prix_vente;
  int id_employe;
  int id_commercant;

  Transaction({this.id_transaction, this.date_transaction, this.prix_vente});

  Transaction.fromTransaction(
      {this.id_transaction,
      this.date_transaction,
      this.prix_vente,
      this.id_employe,
      this.id_commercant});

  Map<String, dynamic> toJson(String data) {
    return jsonDecode(data);
  }

  factory Transaction.fromJsonWithId(Map<String, dynamic> json) {
    return Transaction.fromTransaction(
        id_transaction: json["id_employe"],
        date_transaction: json["date_transaction"],
        prix_vente: json["prix_vente"],
        id_employe: json["id_employe"],
        id_commercant: json["id_commercant"]);
  }

  factory Transaction.fromJson(Map<String, dynamic> json) {
    return Transaction(
        id_transaction: json["id_employe"],
        date_transaction: json["date_transaction"],
        prix_vente: json["prix_vente"]);
  }
}
