import 'package:sqflite/sqflite.dart';

import '../models/app_model.dart';

class DBHelper {
  static final DBHelper _instance = new DBHelper.internal();

  factory DBHelper() => _instance;
  DBHelper.internal();

  static late Database _database;

  get database => _database;

  init() async {
    var path = await getDatabasesPath() + 'test_maxkg.db';
    _database = await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  _onCreate(Database db, int version) async {
    await db.execute(
        '''CREATE TABLE `cart` (id INTEGER PRIMARY KEY NOT NULL, id_tov INTEGER, 
        id_post INTEGER, kol INTEGER, cenaok REAL, naim STRING, url STRING, 
        img STRING, sid INTEGER, dat1 STRING);''');
  }

  Future<int> insert(AppModel model) async =>
      await _database.insert(model.table, model.toMap());

  Future<int> insertToTable(String table, AppModel model) async =>
      await _database.insert(table, model.toMap());

  Future<int> update(AppModel model) async =>
      await _database.update(model.table, model.toMap(),
          where: 'id = ?', whereArgs: [model.id]);

  Future<int> updateTable(String table, AppModel model) async => await _database
      .update(table, model.toMap(), where: 'id = ?', whereArgs: [model.id]);

  Future<int> delete(AppModel model) async => await _database
      .delete(model.table, where: 'id = ?', whereArgs: [model.id]);

  deleteAll(table) async => await _database.delete(table);

  Future<int> deleteFromTable(String table, AppModel model) async =>
      await _database.delete(table, where: 'id = ?', whereArgs: [model.id]);

  Future<Map<String, dynamic>> find(table, id) async {
    final mapList =
        await _database.query(table, where: 'id = ?', whereArgs: [id]);
    return mapList.isNotEmpty ? mapList.first : {};
  }

  Future<List<Map<String, dynamic>>> query(table) async =>
      await _database.query(table);

  Future<List<Map<String, dynamic>>> rawQuery(String sql) async =>
      await _database.rawQuery(sql);

  Future close() async => _database.close();
}
