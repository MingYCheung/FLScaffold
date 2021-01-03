import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_scaffold/model/database/User.dart';
import 'package:flutter_scaffold/scaffold/base/database/DatabaseOpenHelper.dart';
import 'package:flutter_scaffold/scaffold/utils/common/Logs.dart';
import 'package:flutter_scaffold/scaffold/utils/database/DatabaseUtil.dart';
import 'package:sqflite_common/sqlite_api.dart';

/// @ClassName: MyDatabaseOpenHelper
///
/// @Author MingYCheung
///
/// @Website: https://www.mingycheung.tech
///
/// @Email: mingycheung@tom.com
///
/// @Creation: 2020/12/20 15:32
///
/// @Description:

class MyDatabaseOpenHelper extends DatabaseOpenHelper {
  static final _tag = "MyDatabaseOpenHelper:";
  static int dbVersion = 1;
  static String dbName = "myDatabase";
  static Database database;

  /// 构造函数
  MyDatabaseOpenHelper({Database db, String name, int version})
      : super(database, dbName, dbVersion);

  /// 创建
  @override
  Future<void> onCreate(Database db, int version) async {
    Logs.v("onCreate", tag: _tag);
    // 创建
    db.execute(User().tableSql);
    Logs.v("UserSql: ${User().tableSql}", tag: _tag);
  }

  /// 降级
  @override
  Future<void> onDowngrade(Database db, int oldVersion, int newVersion) async {
    Logs.v("onDowngrade", tag: _tag);
    // 降级
  }

  /// 升级
  @override
  Future<void> onUpgrade(Database db, int oldVersion, int newVersion) async {
    Logs.v("onUpgrade", tag: _tag);
    // 升级
  }

  /// 获取数据库名称
  @override
  String get databaseName => super.databaseName;

  /// 获取当前数据库版本
  @override
  int get databaseVersion => super.databaseVersion;
}
