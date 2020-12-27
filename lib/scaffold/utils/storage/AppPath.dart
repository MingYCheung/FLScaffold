import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_scaffold/scaffold/ui/MoreColors.dart';
import 'package:path_provider/path_provider.dart';

/// @ClassName: AppPath
///
/// @Author: MingYCheung
///
/// @Website: https://www.mingycheung.tech
///
/// @Email: mingycheung@tom.com
///
/// @Creation: 2020/12/20 14:22
///
/// @Description: 获取 android ios 存储路径

class AppPath {
  /// 获得应用临时目录路径
  ///
  /// 适用于 android ios
  ///
  /// 该目录下存储的数据会被随时删除 可以理解为缓存目录
  Future<String> getTempDirPath() async {
    Directory dir = await getTemporaryDirectory();
    return dir.path;
  }

  /// 获得应用支持目录路径
  ///
  /// 适用 android ios
  ///
  /// 该目录下存储的数据一般为应用程序运行所需的支持数据
  ///
  /// 用户不可见
  Future<String> getAppSupportDirPath() async {
    Directory dir = await getApplicationSupportDirectory();
    return dir.path;
  }

  /// 获得应用文件目录路径
  ///
  /// 适用于 android ios
  ///
  /// 该目录下存储的数据为用户生成的数据或指应用程序无法重新生成相同的数据
  ///
  /// 用户不可见
  Future<String> getAppDocDirPath() async {
    Directory dir = await getApplicationDocumentsDirectory();
    return dir.path;
  }

  /// 获得应用持久存储目录路径
  ///
  /// 适用于 ios
  ///
  /// 该目录下存储持久化、备份和用户不可见的文件
  ///
  /// 用户不可见
  Future<String> getLibDirPath() async {
    Directory dir = await getLibraryDirectory();
    return dir.path;
  }

  /// 获得外部存储路径
  ///
  /// 适用于 android
  ///
  /// 手机的外部存储路径
  ///
  /// 用户可见
  Future<String> getExternalStorageDirPath() async {
    Directory dir = await getExternalStorageDirectory();
    return dir.path;
  }

  /// 获得外部存储路径列表
  ///
  /// 适用于 android
  ///
  /// 可以存储应用程序特定数据的目录
  /// 这些路径通常驻留在外部存储上 如单独的分区或SD卡 (可以有多个 所以返回List)
  ///
  /// 用户可见
  Future<List<String>> getExternalStorageDirPaths() async {
    List<Directory> dirList = await getExternalStorageDirectories();
    List<String> dirPaths;
    for (var dirPath in dirList) {
      dirPaths.add(dirPath.path);
    }
    return dirPaths;
  }

  /// 获得外部缓存目录路径列表
  ///
  /// 可以存储应用程序特定数据的目录
  /// 这些路径通常驻留在外部存储上 如单独的分区或SD卡 (可以有多个 所以返回List)
  ///
  /// 用户可见
  Future<List<String>> getExternalCacheDirPaths() async {
    List<Directory> dirList = await getExternalCacheDirectories();
    List<String> dirPaths;
    for (var dirPath in dirList) {
      dirPaths.add(dirPath.path);
    }
    return dirPaths;
  }
}
