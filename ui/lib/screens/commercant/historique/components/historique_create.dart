import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ui/modelsData/transaction.dart';
import 'package:http/http.dart' as http;

Future<List<Transaction>> fetchTransaction() async {
  String url = 'https://beskarprojettransversal.herokuapp.com/transactions/';
  final response = await http.get(Uri.parse(url));
  final prefs = await SharedPreferences.getInstance();
  final int id_commercant = prefs.getInt('id_commercant');
  if (response.statusCode == 200) {}
}

class HistoriqueFields extends StatefulWidget {
  _HistoriqueFields createState() => _HistoriqueFields();
}

class _HistoriqueFields extends State<HistoriqueFields> {
  Future<List<Transaction>> _dataTransaction;
  @override
  void initState() {
    super.initState();
    _dataTransaction = fetchTransaction();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _dataTransaction,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return CircularProgressIndicator();
          }
          return ListView.builder(itemBuilder: (context, index) {
            Transaction transactions = snapshot.data[index];
            return Column(
              children: [
                Row(
                  children: [
                    Text("${transactions.date_transaction}"),
                    Text("${transactions.prix_vente}")
                  ],
                )
              ],
            );
          });
        });
  }
}
