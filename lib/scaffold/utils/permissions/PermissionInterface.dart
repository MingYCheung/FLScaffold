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

// 未申请
typedef OnUndetermined = void Function();
// 用户授予
typedef OnGranted = void Function();
// 用户拒绝
typedef OnDenied = void Function();
// 用户永不同意 仅android
typedef OnPermanentlyDenied = void Function();
// 受系统限制 仅ios
typedef OnRestricted = void Function();

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

typedef PermissionsStatuses = void Function(
    List<Permission> granted,
    List<Permission> denied,
    Map<Permission, PermissionStatus> map);

class PermissionsStatusesCallback {
  PermissionsStatuses permissionsStatuses;

  PermissionsStatusesCallback(
      {@required PermissionsStatuses this.permissionsStatuses});
}
