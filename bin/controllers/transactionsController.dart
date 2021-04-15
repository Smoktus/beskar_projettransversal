import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../cors.dart';
import '../models/credit/creditModel.dart';
import '../models/initiateModels.dart';
import '../models/transaction/transactionModel.dart';

class TransactionController {
  Router get router {
    final router = Router();

    //GET /transaction
    router.get('/', (Request req) async {
      var Test = await modelTransaction();
      var results = await Test.getAll();
      print(results);
      return Response.ok(jsonEncode(results), headers: cors);
    });

    //GET /transaction/:id
    router.get('/<param>', (Request req, String param) async {
      var Test = await modelTransaction();
      var results = await Test.getOne(int.parse(param));
      print(results);
      return Response.ok(jsonEncode(results), headers: cors);
    });

    //POST /transaction/
    router.post('/', (Request req) async {
      final payload = await req.readAsString();
      print(payload);
      var Test = await modelTransaction();
      var results = await Test.insert(jsonDecode(payload));
      print(results);
      return Response.ok(results.toString(), headers: cors);
    });

    //UPDATE /transaction/id_employe
    router.put('/<param>', (Request req, String param) async {
      final payload = await req.readAsString();
      print(payload);
      var Test = await modelTransaction();
      var results = await Test.updateID(
          int.parse(jsonDecode(payload)["id_employe"]), int.parse(param));
      return Response.ok(results.toString(), headers: cors);
    });

    router.all('/<ignored|.*>', (Request request) => Response.notFound('null'));

    return router;
  }
}
