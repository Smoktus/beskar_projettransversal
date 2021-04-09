import 'package:postgres/postgres.dart';
import 'dart:io' show Platform;

class DB {
  PostgreSQLConnection conn;

  DB() {
    Map<String, String> envVars = Platform.environment;
    var host = envVars["DB_HOST"] == null ? "ec2-52-213-167-210.eu-west-1.compute.amazonaws.com" : envVars["DB_HOST"];
    var port =
        envVars["DB_PORT"] == null ? 5432 : int.parse(envVars["DB_PORT"]);
    var database = envVars["DB_DATABASE"] == null
        ? "d2pqn9a2sjvng6"
        : envVars["DB_DATABASE"];
    var username =
        envVars["DB_USERNAME"] == null ? "wwqyeegwbauyji" : envVars["DB_USERNAME"];
    var password =
        envVars["DB_PASSWORD"] == null ? "52e47109d13fcb8c6038790bd48f07ce0578370089e44da721a50e66348f9314" : envVars["DB_PASSWORD"];
    this.conn = PostgreSQLConnection(host, port, database,
        username: username, password: password);
  }
}
