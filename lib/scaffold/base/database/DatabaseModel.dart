import 'package:flutter_scaffold/view/pages/DatabasePage.dart';
import 'package:sqflite/sqflite.dart';

/// @ClassName: DatabaseModel
///
/// @Author MingYCheung
///
/// @Website: https://www.mingycheung.tech
///
/// @Email: mingycheung@tom.com
///
/// @Creation: 2021/1/3 19:50
///
/// @Description:

abstract class DatabaseModel {
  Database database;

  // 表名称
  String tableName;

  // 表sql语句
  String tableSql;

  /// 构造函数
  DatabaseModel(this.database, this.tableName, this.tableSql);

  /// 转换为map
  Map<String, dynamic> toMap();

  /// 转换为对象
  Object forMap(Map<String, dynamic> map);
}
