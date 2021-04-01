import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//créer une classe parametreFetch dans compoments
//Un Futur<Employe> fecthData() => accès au data
class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextButton.icon(
            onPressed: () => {},
            icon: Icon(Icons.person),
            label: Text("Nom"), //accées aux données du mec
          ),
          TextButton.icon(
            onPressed: () => {},
            icon: Icon(Icons.person),
            label: Text("Prénom"),
          ),
          TextButton.icon(
            onPressed: () => {},
            icon: Icon(Icons.person),
            label: Text("Mail"),
          ),
          TextButton.icon(
            onPressed: () => {},
            icon: Icon(Icons.person),
            label: Text("Password"),
          ),
          TextButton.icon(
            onPressed: () => {},
            icon: Icon(Icons.person),
            label: Text("Ville"),
          ),
          TextButton.icon(
            onPressed: () => {},
            icon: Icon(Icons.person),
            label: Text("Code Postale"),
          ),
          TextButton.icon(
            onPressed: () => {},
            icon: Icon(Icons.person),
            label: Text("Adresse"),
          ),
          TextButton.icon(
            onPressed: () => {},
            icon: Icon(Icons.person),
            label: Text("Numéro de Siret"),
          ),
        ],
      ),
    );
  }
}
