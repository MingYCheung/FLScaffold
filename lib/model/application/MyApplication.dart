import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_scaffold/model/database/User.dart';
import 'package:flutter_scaffold/scaffold/base/database/DatabaseOpenHelper.dart';
import 'package:flutter_scaffold/scaffold/ui/MoreColors.dart';
import 'package:flutter_scaffold/scaffold/ui/widget/message/Toast.dart';
import 'package:flutter_scaffold/scaffold/utils/common/Logs.dart';
import 'package:flutter_scaffold/scaffold/utils/common/ScreenUtil.dart';
import 'package:flutter_scaffold/scaffold/utils/permissions/PermissionInterface.dart';
import 'package:flutter_scaffold/scaffold/utils/permissions/PermissionUtil.dart';
import 'package:flutter_scaffold/viewModel/database/MyDatabaseOpenHelper.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter_scaffold/scaffold/utils/database/DatabaseUtil.dart';

/// @ClassName: MyApplication
///
/// @Author MingYCheung
///
/// @Website: https://www.mingycheung.tech
///
/// @Email: mingycheung@tom.com
///
/// @Creation: 2021/1/2 22:28
///
/// @Description:

class MyApplication {
  static final _tag = "MyApplication:";
  BuildContext context;
  static MyDatabaseOpenHelper myDatabaseOpenHelper;

  MyApplication(BuildContext context);

  Future<void> init() async {
    // 设置沉浸式状态栏
    ScreenUtil.setBarStatus(true);
    // 申请权限 && 初始化数据库
    requestPermission();
  }

  /// 申请权限
  void requestPermission() {
    PermissionUtil.requestPermissionStatus(
        Permission.storage,
        new PermissionStatusCallback(
            // 授予
            onGranted: (List<Permission> coincident,
                Map<Permission, PermissionStatus> initial) {
          Logs.v("授予${coincident.toString()}");
          // 初始化数据库
          MyDatabaseOpenHelper().init();
          User user = new User(database: MyDatabaseOpenHelper.database);
          user.name = "MingYCheung";
          user.age = "18";
          user.sex = "男";
          user.insert(user.toMap());
        },
            // 拒绝
            onDenied: (List<Permission> coincident,
                Map<Permission, PermissionStatus> initial) async {
          Toast.show(
              "您必须授予FLScaffold 内存读写权限, 否则将无法正常使用该软件, 5秒后向您重新申请", context);
          await Future.delayed(Duration(seconds: 3));

          Logs.v("拒绝${coincident.toString()}", tag: _tag);
        },
            // 永拒 android
            onPermanentlyDenied: (List<Permission> coincident,
                Map<Permission, PermissionStatus> initial) async {
          Toast.show(
              "您必须授予FLScaffold 内存读写权限, 否则将无法正常使用该软件, 5秒后打开设置页面", context);
          await Future.delayed(Duration(seconds: 3));
          openAppSettings();
          Logs.v("永拒${coincident.toString()}", tag: _tag);
        },
            // 受限 ios
            onRestricted: (List<Permission> coincident,
                Map<Permission, PermissionStatus> initial) {
          SystemChannels.platform.invokeMethod('SystemNavigator.pop');
          Logs.v("${coincident.toString()}受限", tag: _tag);
        }));
  }
}
