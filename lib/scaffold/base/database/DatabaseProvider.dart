import 'package:flutter/material.dart';
import 'package:flutter_scaffold/scaffold/ui/MoreColors.dart';

/// @ClassName: DatabaseProvider
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
abstract class DatabaseProvider {
  static Object _model;

  DatabaseProvider(Object model) {
    _model = model;
  }

  Object get model => _model;

}
