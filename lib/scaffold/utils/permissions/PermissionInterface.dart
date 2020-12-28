import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_scaffold/scaffold/ui/MoreColors.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

/// @ClassName: PermissionInterface
///
/// @Author MingYCheung
///
/// @Website: https://www.mingycheung.tech
///
/// @Email: mingycheung@tom.com
///
/// @Creation: 2020/12/20 21:17
///
/// @Description:

/// 未申请
///
/// * [coincident] 符合条件的权限的list
/// * [initial] 最初的权限对象
typedef OnUndetermined = void Function(
    List<Permission> coincident, Map<Permission, PermissionStatus> initial);

/// 用户授予
///
/// * [coincident] 符合条件的权限的list
/// * [initial] 最初的权限对象
typedef OnGranted = void Function(
    List<Permission> coincident, Map<Permission, PermissionStatus> initial);

/// 用户拒绝
///
/// * [coincident] 符合条件的权限的list
/// * [initial] 最初的权限对象
typedef OnDenied = void Function(
    List<Permission> coincident, Map<Permission, PermissionStatus> initial);

/// 用户永不同意 仅android
///
/// * [coincident] 符合条件的权限的list
/// * [initial] 最初的权限对象
typedef OnPermanentlyDenied = void Function(
    List<Permission> coincident, Map<Permission, PermissionStatus> initial);

/// 受系统限制 仅ios
///
/// * [coincident] 符合条件的权限的list
/// * [initial] 最初的权限对象
typedef OnRestricted = void Function(
    List<Permission> coincident, Map<Permission, PermissionStatus> initial);

class PermissionStatusCallback {
  // 未申请
  OnUndetermined onUndetermined;

  // 用户授予
  OnGranted onGranted;

  // 用户拒绝
  OnDenied onDenied;

  // 用户永不同意 仅android
  OnPermanentlyDenied onPermanentlyDenied;

  // 受系统限制 仅ios
  OnRestricted onRestricted;

  PermissionStatusCallback(
      {OnUndetermined this.onUndetermined,
      @required OnGranted this.onGranted,
      @required OnDenied this.onDenied,
      @required OnPermanentlyDenied this.onPermanentlyDenied,
      @required OnRestricted this.onRestricted});
}
