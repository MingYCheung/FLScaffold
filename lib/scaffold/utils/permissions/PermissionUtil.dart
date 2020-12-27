import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_scaffold/scaffold/ui/MoreColors.dart';
import 'package:flutter_scaffold/scaffold/utils/permissions/PermissionInterface.dart';
import 'package:permission_handler/permission_handler.dart';

/// @ClassName: PermissionUtil
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

class PermissionUtil {
  /// 检查权限状态
  ///
  /// 使用方法
  /// ```
  ///PermissionUtil().requestPermissionStats(
  ///    Permission.storage,
  ///    new PermissionStatusCallback(
  ///        // 未申请
  ///        onUndetermined: () {
  ///      Logs.i('onUndetermined', tag: _tag);
  ///   },
  ///       // 用户授予
  ///       onGranted: () {
  ///     Logs.i('onGranted', tag: _tag);
  ///   },
  ///       // 用户拒绝
  ///       onDenied: () {
  ///     Logs.i('onDenied', tag: _tag);
  ///   },
  ///       // 用户永不同意 仅android
  ///       onPermanentlyDenied: () {
  ///     Logs.i('onPermanentlyDenied', tag: _tag);
  ///   },
  ///      // 受系统限制 仅ios
  ///       onRestricted: () {
  ///     Logs.i('onRestricted', tag: _tag);
  ///   }));
  /// ```
  static void requestPermissionStatus(Permission permission,
      @required PermissionStatusCallback callback) async {
    // 请求单个权限
    PermissionStatus status = await permission.request();
    // 类型开关
    switch (status) {
      // 未申请
      case PermissionStatus.undetermined:
        callback.onUndetermined();
        break;
      // 用户授予
      case PermissionStatus.granted:
        callback.onGranted();
        break;
      // 用户拒绝
      case PermissionStatus.denied:
        callback.onDenied();
        break;
      // 用户永不同意 仅android
      case PermissionStatus.permanentlyDenied:
        callback.onPermanentlyDenied();
        break;
      // 受系统限制 仅ios
      case PermissionStatus.restricted:
        callback.onRestricted();
        break;
    }
  }

  static void requestPermissionsStatuses(List<Permission> permissions,
      @required PermissionsStatusesCallback callback) async {
    // 授权了的权限
    List<Permission> granted = new List();
    // 拒绝了的权限
    List<Permission> denied = new List();

    // 请求多个权限
    Map<Permission, PermissionStatus> statuses = await permissions.request();
    // 提出权限
    statuses.forEach((p, ps) {
      if (ps == PermissionStatus.granted && permissions.contains(p)) {
        granted.add(p);
      }
      if (ps == PermissionStatus.denied && permissions.contains(p)) {
        denied.add(p);
      }
    });
    // 遍历结束
    callback.permissionsStatuses(granted, denied, statuses);
  }
}
