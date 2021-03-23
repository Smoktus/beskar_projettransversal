import "./connection.dart";
import "../models/samplemodel.dart";

// This file is for testing the DB class

void main() async {
  var db = DB();
  await db.conn.open();
  var samplemodel = SampleModel(db.conn);
  //var r = await samplemodel.insert();
  var results = await samplemodel.update(3, name: "Steve 2");
  print(results);
  db.conn.close();
}
