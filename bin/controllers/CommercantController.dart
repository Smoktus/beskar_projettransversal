import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../cors.dart';
import '../models/initiateModels.dart';

class CommercantController {
  Router get router {
    final router = Router();

    //GET /commercants
    router.get('/', (Request req) async {
      var Test = await modelCommercant();
      var results = await Test.getAll();
      print(results);
      return Response.ok(jsonEncode(results), headers: cors);
    });

    //GET /commercants/:id
    router.get('/<param>', (Request req, String param) async {
      var Test = await modelCommercant();
      var results = await Test.getOne(int.parse(param));
      print(results);
      return Response.ok(jsonEncode(results), headers: cors);
    });

    //POST /commercants
    router.post('/', (Request req) async {
      final payload = await req.readAsString();
      print(payload);
      var Test = await modelCommercant();
      var results = await Test.insert(jsonDecode(payload));
      print(results);
      return Response.ok(results.toString(), headers: cors);
    });

    //UPDATE /commercants/:id
    router.put('/<param>', (Request req, String param) async {
      final payload = await req.readAsString();
      //print(payload);
      var Test = await modelCommercant();
      var results = await Test.update(int.parse(param), jsonDecode(payload));
      return Response.ok(payload, headers: cors);
    });

    //DELETE /commercants/:id
    router.delete('/<param>', (Request req, String param) async {
      var Test = await modelCommercant();
      void results = await Test.destroy(int.parse(param));
      return Response.ok('Utilisateur supprimé', headers: cors);
    });

    router.all('/<ignored|.*>', (Request request) => Response.notFound('null'));

    return router;
  }
}