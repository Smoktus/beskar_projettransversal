import 'dart:convert';

class Employe {
  final int id_employe;
  final double solde;
  final String nom;
  final String prenom;
  final String mail;
  final String password;
  final String adresse;
  final String codepostal;
  final String ville;
  final String nsiret;
  Employe(
      {this.id_employe,
      this.solde,
      this.nom,
      this.prenom,
      this.mail,
      this.password,
      this.adresse,
      this.codepostal,
      this.ville,
      this.nsiret});

  Map<String, dynamic> toJson(String data) {
    return jsonDecode(data);
  }

  factory Employe.fromJson(Map<String, dynamic> json) {
    return Employe(
        id_employe: json["id_employe"],
        solde: json["solde"],
        nom: json["nom"],
        prenom: json["prenom"],
        mail: json["mail"],
        password: json["password"],
        adresse: json["adresse"],
        codepostal: json["codepostal"],
        ville: json["ville"],
        nsiret: json["nsiret"]);
  }
}
