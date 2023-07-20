import 'package:bloc_clean_arxitectura/common/models/task.dart';
import 'package:bloc_clean_arxitectura/common/models/user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:sqflite/sqflite.dart' as sql;

class DBHelper {
  static Future<void> createTables(sql.Database database) async {
    await database.execute("CREATE TABLE todos("
        "id INTEGER PRIMARY KEY AUTOINCREMENT,"
        "title STRING, desc TEXT,date STRING,"
        "startTime STRING, endTime STRING, "
        "remind INTEGER, repeat STRING,"
        "isCompleted INTEGER)");

    await database.execute("CREATE TABLE user("
        "id INTEGER PRIMARY KEY AUTOINCREMENT DEFAULT 0, "
        "isVerfied INTEGER)");
  }

  static Future<sql.Database> db() async {
    return sql.openDatabase("Zoirbek", version: 1,
        onCreate: (sql.Database database, int version) async {
      await createTables(database);
    });
  }

  static Future<int> createItem(Task task) async {
    final db = await DBHelper.db();

    final id = await db.insert("todos", task.toJson(),
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return id;
  }

  static Future<int> createUser(int isVerfied) async {
    final db = await DBHelper.db();

    final data = {'id': 1, "isVerified": isVerfied};

    final id = await db.insert("user", data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return id;
  }

  static Future<List<Map<String, dynamic>>> getUser() async {
    final db = await DBHelper.db();

    return db.query("user", orderBy: 'id');
  }

  static Future<List<Map<String, dynamic>>> getItems() async {
    final db = await DBHelper.db();

    return db.query("todos", orderBy: "id");
  }

  static Future<List<Map<String, dynamic>>> getItem(int id) async {
    final db = await DBHelper.db();

    return db.query("todos", where: 'id = ?', whereArgs: [id], limit: 1);
  }

  static Future<int> updateItem(
    int id,
    String title,
    String desc,
    int isCompleted,
    String date,
    String startTime,
    String endTime,
  ) async {
    final db = await DBHelper.db();

    final data = {
      "title": title,
      "desc": desc,
      "isCompleted": isCompleted,
      "date": date,
      "startTime": startTime,
      "endTime": endTime,
    };

    final results =
        await db.update("todos", data, where: "id = ?", whereArgs: [id]);

    return results;
  }

  static Future<void> deleteItem( int id) async{
    final db = await DBHelper.db();

    try{

      db.delete("todos",where: "id = ?", whereArgs: [id]);

    }catch(e){
      debugPrint('Unable to delete $e');
    }

  }
}
