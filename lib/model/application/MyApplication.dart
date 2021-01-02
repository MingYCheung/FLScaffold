import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_scaffold/scaffold/base/database/DatabaseOpenHelper.dart';
import 'package:flutter_scaffold/scaffold/ui/MoreColors.dart';
import 'package:flutter_scaffold/viewModel/database/MyDatabaseOpenHelper.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

/// @ClassName: MyApplication
///
/// @Author MingYCheung
///
/// @Website: https://mingycheung.tech
///
/// @Email: mingycheung@tom.com
///
/// @Creation: 2021/1/2 22:28
///
/// @Description:

class MyApplication {
  static final _tag = "MyApplication:";
  static MyDatabaseOpenHelper myDatabaseOpenHelper;

  static void init() {
    myDatabaseOpenHelper = new MyDatabaseOpenHelper();
  }
}