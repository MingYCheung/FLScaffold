import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_scaffold/scaffold/ui/MoreColors.dart';
import 'package:path_provider/path_provider.dart';

/// @ClassName: Dialog
///
/// @Author MingYCheung
///
/// @Website: https://mingycheung.tech
///
/// @Email: mingycheung@tom.com
///
/// @Creation: 2021/1/2 17:45
///
/// @Description: 弹窗封装

class Dialog {
  static void show() {

  }

  Widget baseWidget(){
    return AlertDialog(
      title: Text('提示'),
      content: Text('确认删除吗？'),
      backgroundColor: Colors.lightBlueAccent,
      elevation: 24,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      actions: <Widget>[
        FlatButton(child: Text('取消'),onPressed: (){},),
        FlatButton(child: Text('确认'),onPressed: (){},),
      ],
    );
  }
}