import 'package:flutter/material.dart';
import 'package:flutter_scaffold/scaffold/ui/MoreColors.dart';

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

class User {
  // tableName
  static String TABLENAME = 'User';

  // const
  int _id;
  String _name;
  String _age;
  String _sex;

  // columnName & type
  static String ID = 'id integer primary key';
  static String NAME = 'name text not null';
  static String AGE = 'age text not null';
  static String SEX = 'sex text not null';

  // mode
  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map['id'] = _id;
    map['name'] = _name;
    map['age'] = _age;
    map['sex'] = _sex;
    return map;
  }

  User.fromMapObject(Map<String, dynamic> map) {
    this._id = map['id'];
    this._name = map['name'];
    this._age = map['age'];
    this._sex = map['sex'];
  }

  int get id => _id;

  String get name => _name;

  String get age => _age;

  String get sex => _sex;

  set name(String value) {
    _name = value;
  }

  set age(String value) {
    _age = value;
  }

  set sex(String value) {
    _sex = value;
  }
}
