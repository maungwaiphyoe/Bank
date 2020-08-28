import 'dart:core';

import 'package:databasemasterdemo/Models/account.dart';
import 'package:sqflite/sqflite.dart';

class Bank {
  static Account currentAccount;

  Database _db;

  Bank() {
    //create db/ load db

    var _dbFuture = loadDB();
    _dbFuture.then((db) {
      _db = db;
    });
  }

  Future<Database> loadDB() async {
    // loadDB() async {
    var dbPath = await getDatabasesPath() + "/mysqlite.db";
    _db = await openDatabase(dbPath, onCreate: (db, ver) async {
      var sql =
          "CREATE TABLE users(id INTEGER PRIMARY KEY AUTOINCREMENT, username TEXT, password TEXT)";
      await db.execute(sql);

      //var admin1 = User(1,"admin"."admin");
      //db.insert("table",admin1.map())

      await _fillDefaultUsertoDB(db); //Main function
      var sqltranc =
          "CREATE TABLE transactions(id INTEGER PRIMARY KEY AUTOINCREMENT, fromid INTEGER NOT NULL, toid INTEGER NOT NULL, amount REAL NOT NULL, opr TEXT NOT NULL, created TEXT NOT NULL)";
      await db.execute(sqltranc);

      // return dbr;
    }, version: 2);
    return _db;
  }

  _fillDefaultUsertoDB(db) async {
    var adminUser = Account(1, "admin", "admin");
    var user1 = Account(2, "user1", "user1");
    var user2 = Account(3, "user2", "user2");
    var user3 = Account(4, "user3", "user4");
    var user4 = Account(5, "user4", "user4");
    var user5 = Account(5, "amo", "amo");

    db.insert(
      'users',
      adminUser.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    db.insert(
      'users',
      user1.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    db.insert(
      'users',
      user2.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    db.insert(
      'users',
      user3.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    db.insert(
      'users',
      user4.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    db.insert(
      'users',
      user5.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  addUser(Account user) {
    _db.insert(
      "users",
      user.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  //Method****

  Future<Account> login(String username, String password) async {
    //TODO check in db for user ,with same username/ password
    _db = _db.isOpen ? _db : await loadDB();
    if (this._db != null) {
      var usersArray = await _db.query("users",
          where: "username = ? AND password = ?",
          whereArgs: [username, password]);
      if (usersArray == null || usersArray.length <= 0) return null;
      var users = usersArray.map((u) {
        return
            // User(u["id"],u["userma"])
            Account(u["id"], u["username"], null);
      }).toList(); //Jump to iterable
      Bank.currentAccount = users.first;
      return users.first;
    }
    return null;
  }

  Future<bool> logout() {
    Bank.currentAccount = null;
    _db.close();
  }

  Future<bool> isAccountExit(int id) async {
    //TODOcheck in db for user ,with same id
    var db = _db ?? await loadDB();
    // if (this._db != null) {
    var usersArray = await db.query(
      "users",
      where: "id= $id",
    );
    if (usersArray == null || usersArray.length <= 0) return false;
    return true;
    // }
    // return false;
  }
}
