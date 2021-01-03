import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_scaffold/scaffold/base/database/DatabaseModel.dart';
import 'package:flutter_scaffold/scaffold/base/database/DatabaseOpenHelper.dart';
import 'package:flutter_scaffold/scaffold/ui/MoreColors.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

/// @ClassName: DatabaseUtil
///
/// @Author MingYCheung
///
/// @Website: https://mingycheung.tech
///
/// @Email: mingycheung@tom.com
///
/// @Creation: 2021/1/3 18:11
///
/// @Description:

extension DatabaseUtil on DatabaseModel {
  static final _tag = "DatabaseUtil:";
  /// 插入
  ///
  /// * [tableName] 表名称
  /// * [value] 值
  Future<int> insert(Map<String, dynamic> value) async {
    return await this.database.insert(this.tableName, value);
  }

  /// 插入多条
  ///
  /// * [tableName] 表名称
  /// * [value] 值
  Future<List<Future<int>>> inserts(List<Map<String, dynamic>> values) async {
    List<Future<int>> r;
    values.forEach((value) {
      r.add(insert(value));
    });
    return r;
  }

  /// 原生方法插入
  ///
  /// * [sql] sql语句
  /// * [values] 值
  ///
  /// 别用这方法, 难用死了, sql语句烦死人, 你要是很懂sql当我没说
  Future<int> insertOfOrigin(String sql, List values) async {
    return await this.database.rawInsert(sql, values);
  }

  /// 删除
  ///
  /// * [tableName] 表名
  /// * [whereStr] 条件, 如: 'id=?' 或 'type=? and id=?'
  /// * [whereArgs] 定位参数数组, 如: '1, 5'
  ///
  /// 删除全部: [whereStr] && [whereArgs] 传 null
  Future<int> delete(String whereStr, List whereArgs) async {
    return await this.database.delete(this.tableName,
        where: whereStr, whereArgs: whereArgs);
  }

  /// 原生方法删除
  ///
  /// * [sql] sql语句
  /// * [values] 值
  ///
  /// 别用这方法, 难用死了, sql语句烦死人, 你要是很懂sql当我没说
  Future<int> deleteOfOrigin(String sql, List values) async {
    return await this.database.rawDelete(sql, values);
  }

  /// 修改
  ///
  /// * [tableName] 表名
  /// * [value] 值
  /// * [whereStr] 条件, 如: 'id=?' 或 'type=? and id=?'
  /// * [whereArgs] 定位参数数组, 如: '1, 5'
  Future<int> update(
      Map<String, dynamic> value, String whereStr, List whereArgs) async {
    return await this.database.update(this.tableName, value,
        where: whereStr, whereArgs: whereArgs);
  }

  /// 修改多条
  ///
  /// * [tableName] 表名
  /// * [values] 值
  /// * [whereStr] 条件, 如: 'id=?' 或 'type=? and id=?'
  /// * [whereArgs] 定位参数数组, 如: '1, 5'
  Future<List<Future<int>>> updates(List<Map<String, dynamic>> values,
      String whereStr, List whereArgs) async {
    List<Future<int>> r;
    values.forEach((value) {
      r.add(update(value, whereStr, whereArgs));
    });
    return r;
  }

  /// 原生方法修改
  ///
  /// * [sql] sql语句
  /// * [values] 值
  ///
  /// 别用这方法, 难用死了, sql语句烦死人, 你要是很懂sql当我没说
  Future<int> updateOfOrigin(String sql, List values) async {
    return await this.database.rawUpdate(sql, values);
  }

  /// 查询
  ///
  /// * [tableName] 表名称
  /// * [selects] 要查询的列
  /// * [whereStr] 条件, 如: 'id=?' 或 'type=? and id=?'
  /// * [whereArgs] 定位参数数组, 如: '1, 5'
  ///
  /// 别用这方法, 难用死了, sql语句烦死人, 你要是很懂sql当我没说
  Future<List<Map>> query(
      List<String> selects, String whereStr, List whereArgs) async {
    List<Map> maps = await this.database.query(this.tableName,
        columns: selects, where: whereStr, whereArgs: whereArgs);
    return maps;
  }

  /// 原生方法查询
  ///
  /// * [sql] sql语句
  ///
  /// 别用这方法, 难用死了, sql语句烦死人, 你要是很懂sql当我没说
  Future<List<Map>> queryOfOrigin(String sql) async {
    return await this.database.rawQuery(sql);
  }
}
