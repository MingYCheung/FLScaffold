import 'package:flutter/material.dart';
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
  static int _version;
  static String _name;
  static Database _database;

  int get databaseVersion => _version;

  String get databaseName => _name;

  /// 构造函数
  DatabaseOpenHelper(
      Database db, String dbName, int dbVersion) {
    _name = "$dbName.db";
    _version = dbVersion;
    _database = db;
    // init
    init();
  }

  /// 创建
  void onCreate(Database db);

  /// 升级
  void onUpgrade(Database db, int oldVersion, int newVersion);

  /// 初始化
  static init() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, _name);
    // 打开数据库
    _database = await openDatabase(path,
        version: _version, onCreate: (Database db, int version) async {});
  }

  /// 关闭
  static close() {
    _database?.close();
    _database = null;
  }
}
