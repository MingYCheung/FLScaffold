import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_scaffold/scaffold/utils/common/Logs.dart';
import 'package:flutter_scaffold/viewModel/database/MyDatabaseOpenHelper.dart';
import 'package:flutter_scaffold/viewModel/pages/DatabasePageVM.dart';
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

  int version;
  String name;
  Database db;

  int get databaseVersion => version;

  String get databaseName => "$name.db";

  /// 构造函数
  DatabaseOpenHelper(this.db, this.name, this.version);

  /// 创建
  Future<void> onCreate(Database db, int version);

  /// 升级
  Future<void> onUpgrade(Database db, int oldVersion, int newVersion);

  /// 降级
  Future<void> onDowngrade(Database db, int oldVersion, int newVersion);

  /// 初始化
  Future<Database> init() async {
    // 获得数据库路径
    var databasesPath = await getDatabasesPath();
    // 拼接路径
    String path = join(databasesPath, databaseName);
    Logs.v("Path: $path", tag: _tag);
    // 打开数据库
    try {
      db = await openDatabase(
        path,
        version: version,
        singleInstance: false,
        onCreate: onCreate,
        onUpgrade: onUpgrade,
        onDowngrade: onDowngrade,
      );
      onCreate(db, version);
      int oldVersion = await db.getVersion();
      onUpgrade(db, oldVersion, oldVersion++);
      onDowngrade(db, oldVersion, oldVersion--);
    } catch (e) {
      print("Error $e");
    }
    return db;
  }

  /// 关闭
  void close() async {
    await db?.close();
    db = null;
  }

  /// 获取数据库中所有的表
  Future<List> getTables(Database db) async {
    if (db == null) {
      return Future.value([]);
    }
    List tables = await db
        .rawQuery("select name from sqlite_master where type = 'table'");
    List<String> targetList = [];
    tables.forEach((item) {
      targetList.add(item['name']);
    });
    return targetList;
  }

  /// 表是否存在
  Future<bool> isTableExists(Database db, String table) async {
    String sql =
        "select * from sqlite_master where type='table' and name= '$table'";
    var result = await db.rawQuery(sql);
    return result != null && result.length > 0;
  }
}
