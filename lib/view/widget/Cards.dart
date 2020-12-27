import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_scaffold/scaffold/ui/MoreColors.dart';
import 'package:path_provider/path_provider.dart';

/// @ClassName: Cards
///
/// @Author MingYCheung
///
/// @Website: https://www.mingycheung.tech
///
/// @Email: mingycheung@tom.com
///
/// @Creation: 2020/12/23 18:06
///
/// @Description:

class Cards {
  /// DemosPageCard
  ///
  /// 例子页面卡片
  static Card demosPageCard(
    String angleText,
    String title,
    String description,
    String btnText, {
    Color cardBackgroundColor: MoreColors.lightsLateGray,
    double cardElevation: 16.0,
    double cardRadius: 16.0,
    Color btnColor: MoreColors.deepSkyBlue,
    Color btnTextColor: MoreColors.white,
    VoidCallback clickCallback,
    Key key,
  }) {
    return new Card(
      key: key,
      color: cardBackgroundColor,
      elevation: cardElevation,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(cardRadius))),
      margin: const EdgeInsets.fromLTRB(12, 12, 12, 0),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          // 右上文字
          Container(
            alignment: Alignment(1.0, -1.0),
            margin: const EdgeInsets.fromLTRB(0, 0, 8, 0),
            child: Text(angleText,
                style: TextStyle(
                    fontSize: 98.0,
                    color: Color.fromRGBO(192, 192, 192, 0.6),
                    fontWeight: FontWeight.w700)),
          ),
          // 标题
          Container(
            padding: const EdgeInsets.fromLTRB(18, 0, 18, 0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Divider(color: Colors.transparent, height: 65.0),
                  Text(title,
                      textAlign: TextAlign.center,
                      style: new TextStyle(
                          fontSize: 32.0,
                          color: Colors.white,
                          fontWeight: FontWeight.w600)),
                  Text(description,
                      textAlign: TextAlign.center,
                      style: new TextStyle(
                          fontSize: 16.0,
                          color: Colors.white,
                          fontWeight: FontWeight.w600)),
                  Divider(color: MoreColors.white, height: 18.0),
                  RaisedButton(
                    child: Text(btnText,
                        textAlign: TextAlign.center,
                        style: new TextStyle(
                            color: btnTextColor, fontWeight: FontWeight.w700)),
                    color: btnColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    onPressed: clickCallback,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  /// 创建卡片
  static Card demoPageCard(
    String content, {
    List<Widget> children,
    Color cardBackgroundColor = MoreColors.lightsLateGray,
    double cardElevation = 16.0,
    double cardRadius = 16.0,
    Key key
  }) {
    return new Card(
      key: key,
      color: cardBackgroundColor,
      elevation: cardElevation,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(cardRadius))),
      margin: const EdgeInsets.fromLTRB(12, 12, 12, 0),
      clipBehavior: Clip.antiAlias,
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // 正文
              Text(content,
                  textAlign: TextAlign.center,
                  style: new TextStyle(
                      fontSize: 16.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w500)),
              // 分割线
              Divider(color: MoreColors.white),
              // 按钮
              Row(mainAxisAlignment: MainAxisAlignment.end, children: children)
            ],
          ),
        ),
      ),
    );
  }
}
