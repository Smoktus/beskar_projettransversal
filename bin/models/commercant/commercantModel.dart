import 'package:postgres/postgres.dart';
import 'package:meta/meta.dart';

class CommercantModel {
  PostgreSQLConnection conn;
  String table;
  final int id_commercant;
  final String nom, prenom;
  final String mail, password;
  final String ville, codePostal;
  final String adresse, nSiret;
  final int id_entreprise;

  CommercantModel(conn,
      {this.table = "commercant",
      @required this.id_commercant,
      @required this.nom,
      @required this.prenom,
      @required this.mail,
      @required this.password,
      this.adresse,
      this.codePostal,
      this.ville,
      this.nSiret,
      @required this.id_entreprise});
}
