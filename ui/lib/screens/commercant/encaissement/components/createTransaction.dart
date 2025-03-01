import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ui/constants.dart';
import 'package:ui/modelsData/transaction.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

class EncaissementField extends StatefulWidget {
  _EncaissementField createState() => _EncaissementField();
}

class _EncaissementField extends State<EncaissementField> {
  final myController = TextEditingController();
  bool _isPressed = false;
  Timer _timer;
  Map<String, dynamic> _QRCodeData;
  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(Object context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          child: (_isPressed && _QRCodeData != null)
              ? QrImage(
                  data: jsonEncode(_QRCodeData),
                  version: QrVersions.auto,
                  size: 320,
                  gapless: false,
                  foregroundColor: kIconColor,
                  embeddedImage: AssetImage('assets/images/logo.png'),
                  embeddedImageStyle: QrEmbeddedImageStyle(
                      size: Size(80, 80), color: kButtonColor),
                )
              : Text("Encaissement d'un commercant"),
        ),
        Container(
          width: 100,
          child: TextField(
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly
            ],
            controller: myController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Montant',
            ),
          ),
        ),
        ElevatedButton(
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(kButtonColor)),
            onPressed: () async {
              double montant = double.parse(myController.text);
              print(montant);
              final prefs = await SharedPreferences.getInstance();
              final int id_commercant = prefs.getInt('id_commercant');
              String url =
                  'https://beskarprojettransversal.herokuapp.com/transactions/';
              Map<String, dynamic> body = {
                "prix_vente": "$montant",
                "id_commercant": id_commercant
              };
              final response =
                  await http.post(Uri.parse(url), body: jsonEncode(body));
              print(response.statusCode);
              _QRCodeData = {
                "prix_vente": montant,
                "id_transaction": int.parse(response.body)
              };
              //if (response.statusCode == 404) {
              setState(() {
                _isPressed = true;
              });
              /*_timer = Timer(const Duration(seconds: 60), () {
                setState(() {
                  _isPressed = false;
                  myController.clear();
                  //delete la transaction si expiration
                });
                return showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        content: Text("Transaction expirée"),
                      );
                    });
              });*/
            },
            //},
            child: Text("Enregistrer une transaction"))
      ],
    ));
  }
}
