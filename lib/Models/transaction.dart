import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

class Transaction {
  Database _db;
  int id;
  int fromid;
  int toid;
  double amount;
  String opr;
  String created;

  Transaction(
      this.id, this.fromid, this.toid, this.amount, this.opr, this.created) {}

  static Future<List<Transaction>> loadAllTransaction(int id) async {
    var dbPath = await getDatabasesPath() + "/mysqlite.db";
    var db = await openDatabase(dbPath, version: 1);
    var rows = await db.query("transactions",
        where: "fromid = ? OR toid = ?", whereArgs: [id, id]);
    var transacs = rows
        .map((r) => Transaction(r["id"], r["fromid"], r["toid"], r["amount"],
            r["opr"], r["created"]))
        .toList();
    return transacs;
  }

  Future<Database> loadDB() async {
    // loadDB() async {
    var dbPath = await getDatabasesPath() + "/mysqlite.db";
    _db = await openDatabase(dbPath, version: 1);
    return _db;
  }

  //constructor
  Map<String, dynamic> toMap() {
    return {
      // "id": id,
      "fromid": fromid, "toid": toid, "amount": amount, "opr": opr,
      "created": created
    };
  }

  Future<void> save() async {
    var _db = await loadDB();
    await _db.insert(
      "transactions",
      this.toMap(),
    );
    await _db.close();
  }
}
