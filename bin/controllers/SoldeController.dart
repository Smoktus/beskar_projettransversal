import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../cors.dart';
import '../models/initiateModels.dart';

class SoldeController {
  Router get router {
    final router = Router();

    //GET/v1/solde/:id
    router.get('/<param>', (Request req, String param) async {
      var Test = await modelEmploye();
      var results = await Test.getSolde(int.parse(param));
      print(results);
      return Response.ok(jsonEncode(results), headers: cors);
    });

    // get request to "/test/<param>?query=????"
    /*router.put('/<param>', (Request req, String param) async {
      var Test = await modelEmploye();
      var results = await Test.updateSolde(int.parse(param),
          solde: double.parse(req.url.queryParameters["query"]));
      print(results);
      return Response.ok(jsonEncode(results), headers: cors);
    });*/

    router.all('/<ignored|.*>', (Request request) => Response.notFound('null'));

    return router;
  }
}
