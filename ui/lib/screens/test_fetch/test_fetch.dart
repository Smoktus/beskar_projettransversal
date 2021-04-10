import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<String> fetchAlbum() async {
  String url1 = 'https://beskarprojettransversal.herokuapp.com/employes/8';
  String url = 'http://192.168.43.27:8080/solde/8';
  String urlINSA = 'http://10.43.2.160:8080/solde/8';
  String url2 = 'http://10.43.2.160:8080/employes/8';
  final response = await http.get(Uri.parse(url2));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return response.body;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

//void main() => runApp(MyApp());

class FetchData extends StatefulWidget {
  //MyApp({Key key}) : super(key: key);
  static String routeName = "/fecth";
  @override
  _FetchData createState() => _FetchData();
}

class _FetchData extends State<FetchData> {
  //late Future<Album> futureAlbum;

  Future<String> futureRes;

  @override
  void initState() {
    super.initState();
    futureRes = fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Fetch Data Example'),
        ),
        body: Center(
          child: FutureBuilder<String>(
            future: futureRes,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(snapshot.data);
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }

              // By default, show a loading spinner.
              return CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
