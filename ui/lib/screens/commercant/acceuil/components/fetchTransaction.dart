import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ui/constants.dart';
import 'package:ui/modelsData/transaction.dart';
import 'package:http/http.dart' as http;

//à finir
Future<dynamic> fetchTransactionAcceuil() async {
  final prefs = await SharedPreferences.getInstance();
  final String role = prefs.getString('role');

  //if (role == "commercant") {
  final int id_commercant = prefs.getInt('id_commercant');
  String url = 'https://beskarprojettransversal.herokuapp.com/transactions/';
  final response = await http.get(Uri.parse(url));
  List<Transaction> list;
  List<dynamic> parsedJson = jsonDecode(response.body);
  if (response.statusCode == 200) {
    //print(parsedJson);
    list = parsedJson.map((i) => Transaction.fromJson(i)).toList();
    if (id_commercant != null) {
      list.removeWhere((element) => element.id_commercant != id_commercant);
    }
  }
  double sum = 0;
  for (var l in list) {
    sum += l.prix_vente;
  }
  print(list);
  print(sum);
  return {"totalRecette": sum, "nombreRecette": list.length};
  //}
}

class TransactionFields extends StatefulWidget {
  @override
  _TransactionFields createState() => _TransactionFields();
}

class _TransactionFields extends State<TransactionFields> {
  Future<dynamic> _dataTr;

  @override
  void initState() {
    super.initState();
    _dataTr = fetchTransactionAcceuil();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: (_dataTr == null)
          ? CircularProgressIndicator()
          : FutureBuilder<dynamic>(
              future: _dataTr,
              builder: (context, snapshot) {
                print(snapshot.hasData);
                if (snapshot.hasData) {
                  return Column(
                    children: [
                      Text(
                        "Recettes",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: kTextColorDark,
                          height: 5,
                        ),
                      ),
                      Text(
                        "Total",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: kTextColorDark,
                          height: -2,
                        ),
                      ),
                      Text(
                        snapshot.data["totalRecette"].toString(),
                        style: TextStyle(
                          fontFamily: "Bookman Old Style",
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: kTextColorBright,
                          height: 1.2,
                        ),
                      ),
                      Text(
                        "Nombre de recettes",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: kTextColorDark,
                          height: 2,
                        ),
                      ),
                      Text(
                        snapshot.data["nombreRecette"].toString(),
                        style: TextStyle(
                          fontFamily: "Bookman Old Style",
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: kTextColorBright,
                          height: 1,
                        ),
                      ),
                    ],
                  );
                } else {
                  return Column(
                    children: [
                      Text(
                        "Recettes",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: kTextColorDark,
                          height: 5,
                        ),
                      ),
                      Text(
                        "Total",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: kTextColorDark,
                          height: -2,
                        ),
                      ),
                      Text(
                        "Nombre de recettes",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: kTextColorDark,
                          height: 2,
                        ),
                      ),
                    ],
                  );
                }
              },
            ),
    );
  }
}
