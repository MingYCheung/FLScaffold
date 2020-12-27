import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_scaffold/scaffold/ui/MoreColors.dart';
import 'package:path_provider/path_provider.dart';

/// @ClassName: Buttons
///
/// @Author MingYCheung
///
/// @Website: https://www.mingycheung.tech
///
/// @Email: mingycheung@tom.com
///
/// @Creation: 2020/12/23 19:45
///
/// @Description:

class Buttons {
  /// 圆角按钮
  static RaisedButton roundTextButton(String btnText,
      {Color btnColor: MoreColors.deepSkyBlue,
      Color highlightColor: MoreColors.transparent,
      Color splashColor,
      Color btnTextColor: MoreColors.white,
      double buttonRadius: 6.0,
      @required VoidCallback clickCallback}) {
    return new RaisedButton(
      color: btnColor,
      highlightColor: highlightColor,
      splashColor: splashColor,
      child: Text(btnText,
          style:
              new TextStyle(color: btnTextColor, fontWeight: FontWeight.w700)),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(buttonRadius)),
      onPressed: clickCallback,
    );
  }
}
