import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ui/constants.dart';
import 'package:ui/modelsData/transaction.dart';
import 'package:http/http.dart' as http;

//à finir
Future<dynamic> fetchTransaction() async {
  final prefs = await SharedPreferences.getInstance();
  final String role = prefs.getString('role');
  if (role == "commercant") {
    final int id_commercant = prefs.getInt('id_commercant');
    String url = 'https://beskarprojettransversal.herokuapp.com/transactions/';
    final response = await http.get(Uri.parse(url));
    Transaction lesTransactons =
        Transaction.fromJson(jsonDecode(response.body));
  }
  return {"totalRecette": 150, "nombreRecette": 18};
}

class TransactionFields extends StatefulWidget {
  @override
  _TransactionFields createState() => _TransactionFields();
}

class _TransactionFields extends State<TransactionFields> {
  Future<dynamic> _dataTransaction;

  void initState() {
    super.initState();
    _dataTransaction = fetchTransaction();
    print(_dataTransaction);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: (_dataTransaction == null)
          ? CircularProgressIndicator()
          : FutureBuilder<dynamic>(
              builder: (context, snapshot) {
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
                }
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
              },
            ),
    );
  }
}
