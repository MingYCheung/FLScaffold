import 'package:flutter/material.dart';
import 'package:flutter_scaffold/model/database/User.dart';
import 'package:flutter_scaffold/scaffold/base/database/DatabaseOpenHelper.dart';
import 'package:flutter_scaffold/scaffold/utils/common/Logs.dart';
import 'package:sqflite_common/sqlite_api.dart';

/// @ClassName: MyDatabaseOpenHelper
///
/// @Author MingYCheung
///
/// @Website: https://mingycheung.tech
///
/// @Email: mingycheung@tom.com
///
/// @Creation: 2020/12/20 15:32
///
/// @Description:

class MyDatabaseOpenHelper extends DatabaseOpenHelper {
  static final _tag = "MyDatabaseOpenHelper:";
  static int _dbVersion = 1;
  static String _dbName = "myDatabase";
  static Database _db;

  /// 构造方法
  MyDatabaseOpenHelper() : super(_db, _dbName, _dbVersion);

  /// 初始化数据库操作
  /// 创建表
  @override
  void onCreate(Database db, int version) async {
    Logs.v("onCreate", tag: _tag);
    // 建表
    await db.execute(
        "create table ${User.TABLENAME} ( ${User.ID}, ${User.NAME}, ${User.AGE}, ${User.SEX} )");
  }

  /// 升级数据库操作
  @override
  void onUpgrade(Database db, int oldVersion, int newVersion) async {
    Logs.v("onUpgrade", tag: _tag);
  }

  /// 获取数据库名称
  @override
  String get databaseName => super.databaseName;

  /// 获取当前数据库版本
  @override
  int get databaseVersion => super.databaseVersion;
}
