import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../cors.dart';
import '../models/initiateModels.dart';

class FactureController {
  Router get router {
    final router = Router();

    //GET /transaction
    router.get('/', (Request req) async {
      var Test = await modelFacture();
      var results = await Test.getAll();
      print(results);
      return Response.ok(jsonEncode(results), headers: cors);
    });

    //GET /transaction/:id
    router.get('/<param>', (Request req, String param) async {
      var Test = await modelFacture();
      var results = await Test.getOne(int.parse(param));
      print(results);
      return Response.ok(jsonEncode(results), headers: cors);
    });

    router.all('/<ignored|.*>', (Request request) => Response.notFound('null'));

    return router;
  }
}
