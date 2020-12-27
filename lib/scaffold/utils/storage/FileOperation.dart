import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_scaffold/scaffold/ui/MoreColors.dart';
import 'package:path_provider/path_provider.dart';

/// @ClassName: FileOperation
///
/// @Author MingYCheung
///
/// @Website: https://www.mingycheung.tech
///
/// @Email: mingycheung@tom.com
///
/// @Creation: 2020/12/20 19:03
///
/// @Description: 文件操作

class FileOperation {
  /// 创建文件
  ///
  /// * [path] 路径
  /// * [fileName] 文件名
  /// * [recursive] 递归 (true: 则路径中有目录不存在时 会递归创建目录, false: 则路径中的目录不存在时)
  String createFile(String path, String fileName, {bool recursive: true}) {
    File file = new File('$path/$fileName');
    if (file.existsSync()) {
      print('file is exists.');
    } else {
      print('file is not exists, so create it.');
      try {
        file.createSync(recursive: recursive);
      } catch (e) {
        print(e);
      }
    }
    return file.path;
  }

  /// 删除文件
  ///
  /// * [path] 路径
  /// * [recursive] 递归 (true: 则路径中有目录不存在时 会递归创建目录, false: 则路径中的目录不存在时 直接报错)
  bool deleteFile(String path, {bool recursive: true}) {
    File file = new File(path);
    // delete
    try {
      file.delete(recursive: recursive);
    } catch (e) {
      print(e);
    }
    if (file.existsSync()) {
      print('delete fail.');
      return false;
    } else {
      print('delete success.');
      return true;
    }
  }

  /// 读文件
  ///
  /// * [path] 路径
  /// * [mode] 模式
  Object readFile(String path, {readModes readMode: readModes.string}) {
    File file = new File(path);
    Object fileContent;
    switch (readMode) {
      case readModes.string:
        fileContent = file.readAsStringSync();
        break;
      case readModes.bytes:
        fileContent = file.readAsBytesSync();
        break;
      case readModes.line:
        fileContent = file.readAsLinesSync();
        break;
    }
    return fileContent;
  }

  /// 写文件
  ///
  /// * [path] 路径
  /// * [content] 内容
  /// * [writeMode] 写模式
  /// * [fileMode] 文件模式
  /// * [encode] 编码格式
  void writeFile(String path, Object content,
      {writeModes writeMode: writeModes.string,
      FileMode fileMode: FileMode.write,
      Encoding encode: utf8}) {
    File file = new File(path);
    switch (writeMode) {
      case writeModes.string:
        file.writeAsString(content, mode: fileMode, encoding: encode);
        break;
      case writeModes.bytes:
        file.writeAsBytes(content, mode: fileMode);
        break;
    }
  }

  /// 复制文件
  ///
  /// * [path] 路径
  /// * [newPath] 新路径
  ///
  /// 注: 路径中目录必须存在 这个方法目前不进行辅助处理
  void copyFile(String path, String newPath) {
    File file = new File(path);
    file.copySync(newPath);
  }

  /// 重命名文件
  ///
  /// * [path] 路径
  /// * [newPath] 新路径
  void renameFile(String path, String newPath) {
    File file = new File(path);
    file.renameSync(newPath);
  }

  /// 文件信息
  ///
  /// * [path] 路径
  FileStat info(String path) {
    return new File(path).statSync();
  }
}

/// 读模式枚举
///
/// * [string] 字符串
/// * [bytes] 字节
/// * [line] 行
enum readModes { string, bytes, line }

/// 写模式枚举
///
/// * [string] 字符串
/// * [bytes] 字节
enum writeModes { string, bytes }
