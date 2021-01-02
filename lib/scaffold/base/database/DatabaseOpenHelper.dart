import 'package:flutter/material.dart';
import 'package:flutter_scaffold/scaffold/utils/common/Logs.dart';
import 'package:flutter_scaffold/viewModel/database/MyDatabaseOpenHelper.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

/// @ClassName: DatabaseOpenHelper
///
/// @Author MingYCheung
///
/// @Website: https://www.mingycheung.tech
///
/// @Email: mingycheung@tom.com
///
/// @Creation: 2020/12/20 15:30
///
/// @Description:

abstract class DatabaseOpenHelper {
  static final String _tag = "DatabaseOpenHelper:";

  static int _version;
  static String _name;
  static Database _database;

  int get databaseVersion => _version;

  String get databaseName => _name;

  /// 构造函数
  DatabaseOpenHelper(Database db, String dbName, int dbVersion) {
    _version = dbVersion;
    _name = "$dbName.db";
    _database = db;
    _init();
  }

  /// 创建
  void onCreate(Database db, int version);

  /// 升级
  void onUpgrade(Database db, int oldVersion, int newVersion);

  /// 初始化
  _init() async {
    // 获得数据库路径
    var databasesPath = await getDatabasesPath();
    // 拼接路径
    String path = join(databasesPath, _name);
    Logs.v("$path", tag: _tag);
    // 打开数据库
    _database = await openDatabase(path, version: _version);
    // onCreate
    onCreate(_database, _version);
  }

  /// 关闭
  static close() async {
    await _database?.close();
    _database = null;
  }

// //insert
// insert(Map map) async {
//   //var values = {'name':'my_name','type':'my_type'};
//   await _database.insert(tableName, map);
// }
//
// //query
// query(List list) async {
//   //var myColumns = ['name', 'type'];
//   var result = await _database.query(tableName, columns: list);
//   for (var x in result) {
//     print(x.keys);
//     print(x.values);
//   }
// }
//
// //delete
// delete(List list) async {
//   var myWhere = 'name = ?';
//   //var myArgs = ['cat'];
//   await _database.delete(tableName, where: myWhere, whereArgs: list);
// }
//
// //update
// update(Map map) async {
//   //var values = {'name':'my_name','type':'my_type'};
//   await _database.update(tableName, map);
// }

}
