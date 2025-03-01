import 'dart:async' show Future;
//import 'dart:indexed_db';

import 'package:shelf_router/shelf_router.dart';
import 'package:shelf/shelf.dart';
import '../cors.dart';
import '../models/initiateModels.dart';
import 'dart:convert';
// import 'package:shelf/shelf_io.dart' as shelf_io;

class TestController {
  // By exposing a [Router] for an object, it can be mounted in other routers.
  Router get router {
    final router = Router();

    // get request to "/test"
    router.get('/', (Request req) {
      return Response.ok("The Test Controller", headers: cors);
    });

    // get request to "/getall" use as model on how to work with models and json responses
    router.get('/getall', (Request req) async {
      //print("entering get all");
      var Test = await model();
      var results = await Test.getAll();
      print(results);
      return Response.ok(jsonEncode(results), headers: cors);
    });

    // get request to "/test/<param>?query=????"
    router.get('/<param>', (Request req, String param) {
      print(req.url.queryParameters["query"]); // acessing a url query
      print(req.method);
      print("param " + param);
      return Response.ok(param, headers: cors);
    });

    /*router.post('/personne/<id>', (Request req, String id) async {
      var Test = await model();
      print(req);
      print(id);
      //var results = await Test.insert();
      return Response.ok(id, headers: cors);
    });*/
    // catch all for "/test"
    router.all('/<ignored|.*>', (Request request) => Response.notFound('null'));

    return router;
  }
}
