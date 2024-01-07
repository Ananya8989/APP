import 'dart:async';


import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:planner_app_1/task.dart';
import 'package:sqflite/sqflite.dart';
class DatabaseHelper {
  static final DatabaseHelper dH = DatabaseHelper._();


  DatabaseHelper._();


  late Database db;


  factory DatabaseHelper() {
    return dH;
  }
  Future<void> initDB() async {
   
    String path = await getDatabasesPath();
    db = await openDatabase(
      join(path, 'task.db'),
      onCreate: (database, version) async {
        await database.execute(
            """
            CREATE TABLE tasks (
              done INTEGER NOT NULL,
              name TEXT NOT NULL,
              day TEXT NOT NULL
            )
          """,
        );
      },
      version: 1,
    );
  }


  Future<int> setTask(Task task) async {
    int result = await db.insert('tasks', task.toMap());
    return result;
  }
 
  Future<List<Task>> getTask() async {
    final List<Map<String, Object?>> queryResult = await db.query('tasks');
    return queryResult.map((e) => Task.fromMap(e)).toList();
  }


  Future<void> deleteTask(String name) async {
    await db.delete(
      'tasks',
      where: "name = ?",
      whereArgs: [name],
    );
  }
 
}
