import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ui/modelsData/transaction.dart';
import 'package:http/http.dart' as http;

import '../../../../constants.dart';

Future<List<Transaction>> fetchTransactionEm() async {
  String url = 'https://beskarprojettransversal.herokuapp.com/transactions/';
  final response = await http.get(Uri.parse(url));
  final prefs = await SharedPreferences.getInstance();
  final int id_employe = prefs.getInt('id_employe');
  List<Transaction> list;
  List<dynamic> parsedJson = jsonDecode(response.body);
  if (response.statusCode == 200) {
    //print(parsedJson[0]["id_transaction"]);
    print(parsedJson);
    print(parsedJson[0]);
    list = parsedJson.map((i) => Transaction.fromJson(i)).toList();
    print(list.length);
    list.removeWhere((element) => element.id_employe != id_employe);
  }

  print(list);
  return list;
}

class HistoriqueFieldsEmploye extends StatefulWidget {
  _HistoriqueFieldsEmploye createState() => _HistoriqueFieldsEmploye();
}

class _HistoriqueFieldsEmploye extends State<HistoriqueFieldsEmploye> {
  Future<List<Transaction>> _dataTransactionEm;
  @override
  void initState() {
    super.initState();
    _dataTransactionEm = fetchTransactionEm();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _dataTransactionEm,
      builder: (context, snapshot) {
        print(snapshot.hasData);
        if (!snapshot.hasData) {
          return CircularProgressIndicator();
        } else {
          return Container(
            child: ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  Transaction transaction = snapshot.data[index];
                  return Column(children: [
                    // Image.asset("assets/images/check.png", scale: 2.2),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text("TRANSACTION ${index + 1}",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: kTextColorDark)),
                        // SizedBox(width: 10),
                        Text("${transaction.prix_vente} €",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: kTextColorDark)),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      // Date & Type de transaction
                      children: [
                        SizedBox(
                          width: 1,
                        ),
                        Text("${transaction.date_transaction}",
                            style:
                                TextStyle(fontSize: 12, color: kTextColorDark)),
                        //SizedBox(width: 10),
                      ],
                    ),
                    SizedBox(
                      height: 50,
                    )
                  ]);
                }),
          );
        }
      },
    );
  }
}
