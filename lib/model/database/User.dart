import 'package:flutter_scaffold/scaffold/base/database/DatabaseModel.dart';
import 'package:flutter_scaffold/viewModel/database/MyDatabaseOpenHelper.dart';
import 'package:sqflite_common/sqlite_api.dart';

/// @ClassName: User
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

class User extends DatabaseModel {
  // 列标签
  static final String _id = "id";
  static final String _name = "name";
  static final String _age = "age";
  static final String _sex = "sex";

  // 列数据
  int id;
  String name;
  String age;
  String sex;

  static final String _tableName = "user";
  static final String _tableSql =
      "CREATE TABLE $_tableName ($_id INTEGER PRIMARY KEY AUTOINCREMENT UNIQUE, $_name TEXT, $_age TEXT, $_sex TEXT )";

  /// 构造函数
  User(
      {Database database,
      String tableName,
      String tableSql,
      this.id,
      this.name,
      this.age,
      this.sex})
      : super(database, _tableName, _tableSql);

  /// 表名
  @override
  String get tableName => super.tableName;

  /// 表语句
  @override
  // TODO: implement tableSql
  String get tableSql => super.tableSql;

  /// 转换为map
  @override
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {_id: id, _name: name, _age: age, _sex: sex};
    return map;
  }

  /// 转换为User
  @override
  Object forMap(Map<String, dynamic> map) {
    return User(id: map[_id], name: map[_name], age: map[age], sex: map[sex]);
  }
}
