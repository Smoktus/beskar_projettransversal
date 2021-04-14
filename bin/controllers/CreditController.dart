import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../cors.dart';
import '../models/initiateModels.dart';

class CreditController {
  Router get router {
    final router = Router();

    //GET/v1/credits/:id
    router.get('/<param>', (Request req, String param) async {
      var Test = await modelCredit();
      var results = await Test.getCredit(int.parse(param));
      print(results);
      return Response.ok(jsonEncode(results), headers: cors);
    });

    //GET/v1/credits
    router.get('/', (Request req) async {
      var Test = await modelCredit();
      var results = await Test.getCredHistory();
      print(results);
      return Response.ok(jsonEncode(results), headers: cors);
    });

    //POST/v1/credits
    router.post('/', (Request req) async {
      final payload = await req.readAsString();
      print(payload);
      var Test = await modelCredit();
      var results = await Test.insert(jsonDecode(payload));
      print(results);
      return Response.ok(results.toString(), headers: cors);
    });

    //POST/v1/credits_all
    /*router.post('/', (Request req) async {
      final payload = await req.readAsString();
      print(payload);
      var Test = await modelCredit();
      var results = await Test.insert(jsonDecode(payload));
      print(results);
      return Response.ok(results.toString(), headers: cors);
    }); */

    router.all('/<ignored|.*>', (Request request) => Response.notFound('null'));
    return router;

  }
}