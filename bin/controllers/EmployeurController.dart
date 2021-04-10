import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../cors.dart';
import '../models/initiateModels.dart';

class EmployeurController {
  Router get router {
    final router = Router();

    //GET /employeurs
    router.get('/', (Request req) async {
      var Test = await modelEmployeur();
      var results = await Test.getAll();
      print(results);
      return Response.ok(jsonEncode(results), headers: cors);
    });

    //GET /employeurs/:id
    router.get('/<param>', (Request req, String param) async {
      var Test = await modelEmployeur();
      var results = await Test.getOne(int.parse(param));
      print(results);
      return Response.ok(jsonEncode(results), headers: cors);
    });

    //POST /employeurs
    router.post('/', (Request req) async {
      final payload = await req.readAsString();
      print(payload);
      var Test = await modelEmployeur();
      var results = await Test.insert(jsonDecode(payload));
      print(results);
      return Response.ok(payload, headers: cors);
    });

    //UPDATE /employeurs/:id
    router.put('/<param>', (Request req, String param) async {
      final payload = await req.readAsString();
      //print(payload);
      var Test = await modelEmployeur();
      var results = await Test.update(int.parse(param), jsonDecode(payload));
      return Response.ok(payload, headers: cors);
    });

    //DELETE /employeurs/:id
    router.delete('/<param>', (Request req, String param) async {
      var Test = await modelEmployeur();
      void results = await Test.destroy(int.parse(param));
      return Response.ok('Utilisateur supprimé', headers: cors);
    });

    router.all('/<ignored|.*>', (Request request) => Response.notFound('null'));

    return router;

  }
}