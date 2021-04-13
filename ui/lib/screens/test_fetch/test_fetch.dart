import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_nfc_kit/flutter_nfc_kit.dart';
import 'package:ndef/ndef.dart' as ndef;
import 'package:camera/camera.dart';

List<CameraDescription> cameras;

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

Future<void> testNFC() async {
  var availability = await FlutterNfcKit.nfcAvailability;
  if (availability != NFCAvailability.available) {
    print("dur");
  }
  print("cool");
}

//void main() => runApp(MyApp());
Future<void> getCameras() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
}

class FetchData extends StatefulWidget {
  //MyApp({Key key}) : super(key: key);
  static String routeName = "/fecth";
  @override
  _FetchData createState() => _FetchData();
}

class _FetchData extends State<FetchData> {
  //late Future<Album> futureAlbum;
  String tagStr;
  bool _isSupported = false;
  Future<String> futureRes;
  Future<void> _cameras;
  CameraController controller;
  @override
  void initState() {
    super.initState();
    //futureRes = fetchAlbum();
    //_nfcTest = testNFC();
    _cameras = getCameras();
    controller = CameraController(cameras[0], ResolutionPreset.max);
    controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
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
        body: Column(
          children: [
            FutureBuilder<void>(
                future: _cameras,
                builder: (context, snapshot) {
                  return Center(
                    child: (_cameras == null)
                        ? CircularProgressIndicator()
                        : CameraPreview(controller),
                  );
                })
          ],
        ),
      ),
    );
  }
}
