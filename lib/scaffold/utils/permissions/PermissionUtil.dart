import 'package:flutter/material.dart';
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
  static String _tag = "PermissionUtil:";

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
    // 符合的
    List<Permission> coincident = new List();
    // 最初的
    Map<Permission, PermissionStatus> initial = new Map();
    // 类型开关
    switch (status) {
      // 未申请
      case PermissionStatus.undetermined:
        coincident.add(permission);
        initial[permission] = status;
        callback.onUndetermined(coincident, initial);
        break;
      // 用户授予
      case PermissionStatus.granted:
        coincident.add(permission);
        initial[permission] = status;
        callback.onGranted(coincident, initial);
        break;
      // 用户拒绝
      case PermissionStatus.denied:
        coincident.add(permission);
        initial[permission] = status;
        callback.onDenied(coincident, initial);
        break;
      // 用户永不同意 仅android
      case PermissionStatus.permanentlyDenied:
        coincident.add(permission);
        initial[permission] = status;
        callback.onPermanentlyDenied(coincident, initial);
        break;
      // 受系统限制 仅ios
      case PermissionStatus.restricted:
        coincident.add(permission);
        initial[permission] = status;
        callback.onRestricted(coincident, initial);
        break;
    }
  }

  static void requestPermissionsStatuses(List<Permission> permissions,
      @required PermissionStatusCallback callback) async {
    // 已处理
    int processed = 0;
    // 对应
    List<Permission> undeterminedList = new List();
    List<Permission> grantedList = new List();
    List<Permission> deniedList = new List();
    List<Permission> permanentlyDeniedList = new List();
    List<Permission> restrictedList = new List();
    // 请求多个权限
    Map<Permission, PermissionStatus> statuses = await permissions.request();
    // 提出权限
    statuses.forEach((p, s) {
      switch (s) {
        case PermissionStatus.undetermined:
          processed++;
          undeterminedList.add(permissions.contains(p) ? p : null);
          if (processed == permissions.length)
          callback.onUndetermined(undeterminedList, statuses);
          break;
        case PermissionStatus.granted:
          processed++;
          grantedList.add(permissions.contains(p) ? p : null);
          if (processed == permissions.length)
          callback.onGranted(grantedList, statuses);
          break;
        case PermissionStatus.denied:
          processed++;
          deniedList.add(permissions.contains(p) ? p : null);
          if (processed == permissions.length)
          callback.onDenied(deniedList, statuses);
          break;
        case PermissionStatus.restricted:
          processed++;
          restrictedList.add(permissions.contains(p) ? p : null);
          if (processed == permissions.length)
          callback.onRestricted(restrictedList, statuses);
          break;
        case PermissionStatus.permanentlyDenied:
          processed++;
          permanentlyDeniedList.add(permissions.contains(p) ? p : null);
          if (processed == permissions.length)
          callback.onPermanentlyDenied(permanentlyDeniedList, statuses);
          break;
      }
    });
  }
}
