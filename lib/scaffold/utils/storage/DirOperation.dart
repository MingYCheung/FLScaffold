import 'dart:io';
import 'package:path/path.dart';

/// @ClassName: DirOperation
///
/// @Author MingYCheung
///
/// @Website: https://www.mingycheung.tech
///
/// @Email: mingycheung@tom.com
///
/// @Creation: 2020/12/20 15:45
///
/// @Description: 文件夹操作

class DirOperation {
  /// 创建目录
  ///
  /// * [path] 路径
  /// * [dirName] 文件夹名
  /// * [recursive] 递归 (true: 则路径中有目录不存在时 会递归创建目录, false: 则路径中的目录不存在时 直接报错)
  String createDir(String path, String dirName, {bool recursive: true}) {
    Directory dir = new Directory('$path/$dirName');
    if (dir.existsSync()) {
      print('dir is exists.');
    } else {
      print('dir is not exists, so create it.');
      try {
        dir.createSync(recursive: recursive);
      }catch(e) {
        print(e);
      }
    }
    return dir.path;
  }

  /// 创建临时目录
  ///
  /// * [path] 路径
  /// * [prefix] 前缀 额外的随机字符被附加到[prefix]以产生唯一的目录名。如果[prefix]缺少或为空，则为空
  String createTempDir(String path, {String prefix}) {
    Directory dir = new Directory(path);
    Directory tempDir;
    if (dir.existsSync()) {
      print('dir is exists.');
    } else {
      print('dir is not exists, so create it.');
      tempDir = dir.createTempSync(prefix);
    }
    return tempDir.path;
  }

  /// 删除目录
  ///
  /// * [path] 路径
  /// * [recursive] 递归 (true: 则路径中有目录不存在时 会递归创建目录, false: 则路径中的目录不存在时 直接报错)
  bool deleteDir(String path, {bool recursive: true}) {
    Directory dir = new Directory(path);
    // delete
    try {
      dir.delete(recursive: recursive);
    }catch(e) {
      print(e);
    }
    if (dir.existsSync()) {
      print('delete fail.');
      return false;
    } else {
      print('delete success.');
      return true;
    }
  }

  /// 遍历目录
  ///
  /// * [path] 路径
  /// * [recursive] 递归 (true: 递归列出子目录)
  /// * [followLinks] links (true: 允许link)
  List<String> traverseDir(String path,
      {bool recursive: false,
      bool followLinks: true,
      traverseCondition condition: traverseCondition.all,
      String suffix}) {
    Directory dir = new Directory(path);
    List<String> childPaths;
    List<FileSystemEntity> list =
        dir.listSync(recursive: recursive, followLinks: followLinks);
    for (var v in list) {
      switch (condition) {
        case traverseCondition.all:
          childPaths.add(v.path);
          break;
        case traverseCondition.OnlyDir:
          // 判断是否为目录
          if (FileSystemEntity.isDirectorySync(v.path)) {
            childPaths.add(v.path);
          }
          break;
        case traverseCondition.OnlyFile:
          // 判断是否为文件
          if (FileSystemEntity.isFileSync(v.path)) {
            // 判空 空就说明没有设置后缀名限制
            // true: 进行筛检指定后缀文件处理
            // false: 直接将文件路径添加至childPaths集合
            if (suffix != null) {
              // 得到文件后缀
              String fileSuffix = basename(v.path).split(".").last;
              // 如果文件后缀和限制的后缀相同则将路径添加至childPaths数组
              if (fileSuffix == suffix) {
                childPaths.add(v.path);
              }
            } else {
              childPaths.add(v.path);
            }
          }
          break;
      }
    }
    return childPaths;
  }

  /// 重命名目录
  ///
  /// * [path] 路径
  /// * [newPath] 新路径
  void renameDir(String path, String newPath) {
    Directory dir = new Directory(path);
    dir.renameSync(newPath);
  }

  /// 目录信息
  ///
  /// * [path] 路径
  FileStat info(String path) {
    return new Directory(path).statSync();
  }
}

/// 遍历条件枚举
///
/// * [all] 所有
/// * [OnlyDir] 只要文件夹
/// * [OnlyFile] 只要文件
enum traverseCondition { all, OnlyDir, OnlyFile }
