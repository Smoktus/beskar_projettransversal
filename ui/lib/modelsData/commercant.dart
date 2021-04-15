import 'dart:convert';

class Commercant {
  final int id_commercant;
  final String nom;
  final String prenom;
  final String mail;
  final String password;
  final String adresse;
  final String codepostal;
  final String ville;
  final String nsiret;

  Commercant(
      {this.id_commercant,
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

  factory Commercant.fromJson(Map<String, dynamic> json) {
    return Commercant(
        id_commercant: json["id_employe"],
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
