import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../cors.dart';
import '../models/initiateModels.dart';

class EmployeController {
  Router get router {
    final router = Router();

    //GET /employes
    router.get('/', (Request req) async {
      var Test = await modelEmploye();
      var results = await Test.getAll();
      print(results);
      return Response.ok(jsonEncode(results), headers: cors);
    });

    //GET /employes/:id
    router.get('/<param>', (Request req, String param) async {
      var Test = await modelEmploye();
      var results = await Test.getOne(int.parse(param));
      print(results);
      return Response.ok(jsonEncode(results), headers: cors);
    });

    //POST /employes
    router.post('/', (Request req) async {
      final payload = await req.readAsString();
      print(payload);
      var Test = await modelEmploye();
      var results = await Test.insert(jsonDecode(payload));
      print(results);
      return Response.ok(results.toString(), headers: cors);
    });

    //UPDATE /employes/:id
    router.put('/<param>', (Request req, String param) async {
      final payload = await req.readAsString();
      //print(payload);
      var Test = await modelEmploye();
      var results = await Test.update(int.parse(param), jsonDecode(payload));
      return Response.ok(payload, headers: cors);
    });

    router.all('/<ignored|.*>', (Request request) => Response.notFound('null'));

    return router;
  }
}
