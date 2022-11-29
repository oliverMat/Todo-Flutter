import '../models/Todo.dart';
import 'DatabaseHelper.dart';
import 'package:sqflite/sqflite.dart';

class TodoHelper {

  DatabaseHelper databaseHelper = DatabaseHelper();

  Future<void> insert(Todo todo) async {
    final db = await databaseHelper.database;
    await db?.insert(
        Todo.TABLE,
        todo.toMap()
    );
  }

  Future<List<Todo>> list() async {
    final db = await databaseHelper.database;
    var objects = await db!.rawQuery('SELECT * FROM ${Todo.TABLE} '
        'ORDER BY ${Todo.COL_TITLE} COLLATE NOCASE'
    );

    return objects.map((obj) => Todo.fromMap(obj)).toList();
  }

  Future<void> update(Todo todo) async {
    final db = await databaseHelper.database;
    await db!.update(
        Todo.TABLE,
        todo.toMap(),
        where: '${Todo.COL_ID} = ?',
        whereArgs: [todo.id]
    );
  }

  Future<void> delete(int id) async {
    var db = await databaseHelper.database;
    db!.delete(
      Todo.TABLE,
      where: "${Todo.COL_ID} = ?",
      whereArgs: [id],
    );
  }

  Future<void> deleteAll() async {
    var db = await databaseHelper.database;
    db!.delete(Todo.TABLE);

  }
}
