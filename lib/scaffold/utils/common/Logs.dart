import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_scaffold/scaffold/ui/MoreColors.dart';
import 'package:path_provider/path_provider.dart';

/// @ClassName: Logs
///
/// @Author MingYCheung
///
/// @Website: https://www.mingycheung.tech
///
/// @Email: mingycheung@tom.com
///
/// @Creation: 2020/12/22 19:34
///
/// @Description: 日志

class Logs {
  static const String _tag = "Logs=>";
  static int _maxLen = 128;

  /// Verbose
  ///
  /// 打印一些最为繁琐、意义不大的日志信息
  ///
  /// ```
  /// Logs.v('Log message', tag: tag);
  /// ```
  static void v(Object msg, {String tag}) {
    _printLog(tag, "[V]>> ", msg);
  }

  /// Debug
  ///
  /// 打印一些调试信息
  ///
  /// ```
  /// Logs.d('Log message', tag: tag);
  /// ```
  static void d(Object msg, {String tag}) {
    _printLog(tag, "[D]>> ", msg);
  }

  /// Info
  ///
  /// 打印一些比较重要的数据，可帮助你分析用户行为数据
  ///
  /// ```
  /// Logs.i('Log message', tag: tag);
  /// ```
  static void i(Object msg, {String tag}) {
    _printLog(tag, "[I]>> ", msg);
  }

  /// Warn
  ///
  /// 打印一些警告信息，提示程序该处可能存在的风险
  ///
  /// ```
  /// Logs.w('Log message', tag: tag);
  /// ```
  static void w(Object msg, {String tag}) {
    _printLog(tag, "[W]>> ", msg);
  }

  /// Error
  ///
  /// 打印程序中的错误信息
  ///
  /// ```
  /// Logs.e('Log message', tag: tag);
  /// ```
  static void e(Object msg, {String tag}) {
    _printLog(tag, "[E]>> ", msg);
  }

  static void _printLog(String tag, String label, Object msg) {
    String message = msg.toString();
    tag = tag ?? _tag;
    if (message.length <= _maxLen) {
      print('$label$tag $message.');
      return;
    }
    print(
        "$label$tag ╭───────────────────────────────────────────────────────────── START ──────────────────────────────────────────────────────────────╮ ");
    while (message.isNotEmpty) {
      if (message.length > _maxLen) {
        print("$label$tag ┆ ${message.substring(0, _maxLen)} ┆");
        message = message.substring(_maxLen, message.length);
      } else {
        print("$label$tag ┆ $message.");
        message = "";
      }
    }
    print(
        "$label$tag ╰───────────────────────────────────────────────────────────── END ────────────────────────────────────────────────────────────────╯  ");
  }
}
