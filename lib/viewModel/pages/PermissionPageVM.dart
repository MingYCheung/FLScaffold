import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_scaffold/scaffold/ui/MoreColors.dart';
import 'package:flutter_scaffold/scaffold/ui/widget/message/Toast.dart';
import 'package:flutter_scaffold/scaffold/utils/common/Logs.dart';
import 'package:flutter_scaffold/scaffold/utils/permissions/PermissionInterface.dart';
import 'package:flutter_scaffold/scaffold/utils/permissions/PermissionUtil.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

/// @ClassName: PermissionPageVM
///
/// @Author MingYCheung
///
/// @Website: https://mingycheung.tech
///
/// @Email: mingycheung@tom.com
///
/// @Creation: 2020/12/29 20:09
///
/// @Description:

class PermissionPageVM {
  static String _tag = "PermissionPage:";

  /// 申请单个权限 (点击事件)
  static void aPermissionRequest(BuildContext context) {
    // 申请权限
    PermissionUtil.requestPermissionStatus(
        Permission.storage,
        new PermissionStatusCallback(
            // 授予
            onGranted: (List<Permission> coincident,
                Map<Permission, PermissionStatus> initial) {
          Toast.show("用户授予${coincident.toString()}", context);
          Logs.v("授予${coincident.toString()}");
        },
            // 拒绝
            onDenied: (List<Permission> coincident,
                Map<Permission, PermissionStatus> initial) {
          Toast.show("用户拒绝${coincident.toString()}", context);
          Logs.v("拒绝${coincident.toString()}", tag: _tag);
        },
            // 永拒 android
            onPermanentlyDenied: (List<Permission> coincident,
                Map<Permission, PermissionStatus> initial) {
          Toast.show("用户选择了拒绝不再提醒${coincident.toString()}, 2秒后打开设置页面", context);
          openAppSettings();
          Logs.v("永拒${coincident.toString()}", tag: _tag);
        },
            // 受限 ios
            onRestricted: (List<Permission> coincident,
                Map<Permission, PermissionStatus> initial) {
          Toast.show("${coincident.toString()}权限受到系统限制, 无法获取", context);
          Logs.v("${coincident.toString()}受限", tag: _tag);
        }));
  }

  /// 申请多个权限 (点击事件)
  static void permissionsRequest(BuildContext context) {
    PermissionUtil.requestPermissionsStatuses(
        [Permission.location, Permission.calendar, Permission.camera],
        new PermissionStatusCallback(
            // 授予
            onGranted: (List<Permission> coincident,
                Map<Permission, PermissionStatus> initial) {
          Toast.show("用户授予${coincident.toString()}", context);
          Logs.v("授予${coincident.toString()}, ${initial.toString()}",
              tag: _tag);
        },
            // 拒绝
            onDenied: (List<Permission> coincident,
                Map<Permission, PermissionStatus> initial) {
          Toast.show("用户拒绝${coincident.toString()}", context);
          Logs.v("拒绝${coincident.toString()}, ${initial.toString()}",
              tag: _tag);
        },
            // 永拒 android
            onPermanentlyDenied: (List<Permission> coincident,
                Map<Permission, PermissionStatus> initial) {
          Toast.show("用户选择了拒绝不再提醒${coincident.toString()}", context);
          Logs.v("永拒${coincident.toString()}, ${initial.toString()}",
              tag: _tag);
        },
            // 受限 ios
            onRestricted: (List<Permission> coincident,
                Map<Permission, PermissionStatus> initial) {
          Toast.show("${coincident.toString()}权限受到系统限制, 无法获取", context);
          Logs.v("${coincident.toString()} 受限", tag: _tag);
        }));
  }
}
