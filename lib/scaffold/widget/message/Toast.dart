import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_scaffold/scaffold/ui/MoreColors.dart';
import 'package:flutter_scaffold/scaffold/utils/common/Logs.dart';
import 'package:flutter_scaffold/view/ui/MyColors.dart';
import 'package:path_provider/path_provider.dart';

/// @ClassName: Toast
///
/// @Author MingYCheung
///
/// @Website: https://www.mingycheung.tech
///
/// @Email: mingycheung@tom.com
///
/// @Creation: 2020/12/25 18:19
///
/// @Description: Toast 信息提示 简单实现

class Toast {
  // duration 持续时间
  static const int LENGTH_SHORT = 1;
  static const int LENGTH_LONG = 2;

  // gravity 位置
  static const int TOP = 0;
  static const int CENTER = 1;
  static const int BOTTOM = 2;

  /// 显示 Toast
  static void show(String msg, BuildContext context,
      {int duration: Toast.LENGTH_SHORT,
      int gravity: Toast.BOTTOM,
      double backgroundRadius: 8.0,
      Color color: MyColors.defToastColor,
      Color textColor: MoreColors.white,
      Widget widget}) {
    widget ??= Text(msg, softWrap: true, style: TextStyle(fontSize: 15, color: textColor));
    ToastView._dismiss(duration);
    ToastView.createView(msg, context, duration, backgroundRadius, gravity,
        color, widget, textColor);
  }

  static void dismiss() async {
    ToastView._isShow = false;
    ToastView._overlayEntry.markNeedsBuild();
    await Future.delayed(Duration(milliseconds: 400));
    ToastView._overlayEntry.remove();
    ToastView._overlayEntry = null;
  }
}

class ToastView {
  ToastView._internal();

  static OverlayState _overlayState;
  static OverlayEntry _overlayEntry;
  static DateTime _startedTime;
  static int _maxLen = 16;
  static bool _isShow = false;

  static void createView(
      String msg,
      BuildContext context,
      int duration,
      double backgroundRadius,
      int gravity,
      Color color,
      Widget widget,
      Color textColor) async {
    // 字符过长处理
    if (msg.length > _maxLen) {}
    // 获得时间
    _startedTime = DateTime.now();
    // 获取实例
    _overlayState = Overlay.of(context);
    _isShow = true;
    if (_overlayEntry == null) {
      _overlayEntry = new OverlayEntry(
        builder: (BuildContext context) => ToastWidget(
            widget: ToastWidget.defWidget(msg, context, widget,
                backgroundRadius, color, textColor, _isShow),
            gravity: gravity),
      );
      _overlayState.insert(_overlayEntry);
    } else {
      _overlayEntry.markNeedsBuild();
    }
    await Future.delayed(Duration(seconds: duration));
    ToastView._dismiss(duration);
  }

  /// 移除 Toast
  static _dismiss(int duration) async {
    if (!_isShow) {
      return;
    } else {
      if (DateTime.now().difference(_startedTime).inSeconds >= duration) {
        _isShow = false;
        _overlayEntry.markNeedsBuild();
        await Future.delayed(Duration(milliseconds: 400));
        _overlayEntry.remove();
        _overlayEntry = null;
      }
    }
  }
}

/// ToastWidget
class ToastWidget extends StatelessWidget {
  ToastWidget({
    Key key,
    @required this.widget,
    @required this.gravity,
  }) : super(key: key);

  final Widget widget;
  final int gravity;

  @override
  Widget build(BuildContext context) {
    return new Positioned(
        top: gravity == Toast.TOP ? 52 : null,
        bottom: gravity == Toast.BOTTOM ? 52 : null,
        child: Material(color: MoreColors.transparent, child: widget));
  }

  static Widget defWidget(String msg, BuildContext context, Widget widget,
      double backgroundRadius, Color color, Color textColor, bool isShow) {
    return Container(
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width,
      child: AnimatedOpacity(
        opacity: isShow ? 1.0 : 0.0,
        duration:
            isShow ? Duration(milliseconds: 100) : Duration(milliseconds: 400),
        child: Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width,
          child: Container(
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(backgroundRadius),
            ),
            margin: EdgeInsets.symmetric(horizontal: 20),
            padding: EdgeInsets.fromLTRB(16, 10, 16, 10),
            child: widget,
          ),
        ),
      ),
    );
  }
}
