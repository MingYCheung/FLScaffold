import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_scaffold/scaffold/ui/MoreColors.dart';
import 'package:flutter_scaffold/scaffold/utils/common/Logs.dart';
import 'package:flutter_scaffold/scaffold/utils/net/Url.dart';
import 'package:flutter_scaffold/scaffold/utils/permissions/PermissionInterface.dart';
import 'package:flutter_scaffold/scaffold/utils/permissions/PermissionUtil.dart';
import 'package:flutter_scaffold/view/widget/Buttons.dart';
import 'package:flutter_scaffold/view/widget/Cards.dart';
import 'package:flutter_scaffold/scaffold/ui/widget/message/Toast.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart';

/// @ClassName: PermissionPage
///
/// @Author MingYCheung
///
/// @Website: https://www.mingycheung.tech
///
/// @Email: mingycheung@tom.com
///
/// @Creation: 2020/12/20 23:32
///
/// @Description:

class PermissionPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => PermissionPageState();
}

String _tag = "PermissionPage:";

class PermissionPageState extends State<PermissionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: MoreColors.whiteSmoke,
        appBar: AppBar(
          backgroundColor: MoreColors.white,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_rounded, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
          elevation: 0.0,
          centerTitle: true,
          title: Text("Permission Demo",
              style: TextStyle(color: MoreColors.black)),
        ),
        body: body(context));
  }

  // 内容
  body(BuildContext context) {
    return Center(
      child: ListView(
        children: [
          // 单权限申请卡片
          Cards.demoPageCard(
              "向用户申请单个[文件读写]权限，\n直接弹出系统底部弹窗\n(建议android最后点击同意和永久拒绝，\n以便查看各状态回调弹出的Toast提示)",
              children: [
                Buttons.roundTextButton("文档主页", btnColor: MoreColors.tomato,
                    clickCallback: () {
                  Logs.i("文档主页", tag: _tag);
                  Url.openWebUrl("https://gitee.com/MingYCheung/FLScaffold");
                }),
                SizedBox(width: 8),
                Buttons.roundTextButton("效果演示", clickCallback: () {
                  Logs.i("效果演示", tag: _tag);
                  // 申请权限
                  PermissionUtil.requestPermissionStatus(
                      Permission.storage,
                      new PermissionStatusCallback(
                          // 授予
                          onGranted: (List<Permission> coincident,
                              Map<Permission, PermissionStatus> initial) {
                        Toast.show("用户授予${coincident.toString()}", context);
                        Logs.v("授予${coincident.toString()}", tag: _tag);
                      },
                          // 拒绝
                          onDenied: (List<Permission> coincident,
                              Map<Permission, PermissionStatus> initial) {
                        Toast.show("用户拒绝${coincident.toString()}", context);
                        Logs.v("拒绝${coincident.toString()}", tag: _tag);
                      },
                          // 永拒 android
                          onPermanentlyDenied: (List<Permission> coincident,
                              Map<Permission, PermissionStatus> initial) {
                            Toast.show("用户选择了拒绝不再提醒${coincident.toString()}, 2秒后打开设置页面", context);
                            openAppSettings();
                            Logs.v("永拒${coincident.toString()}", tag: _tag);
                      },
                          // 受限 ios
                          onRestricted: (List<Permission> coincident,
                              Map<Permission, PermissionStatus> initial) {
                        Toast.show("${coincident.toString()}权限受到系统限制, 无法获取", context);
                        Logs.v("${coincident.toString()}受限", tag: _tag);
                      }));
                }),
              ]),
          // 多个权限申请卡片
          Cards.demoPageCard(
              "向用户申请多个权限[位置, 日历, 相机]权限，\n直接弹出系统底部弹窗\n(建议android最后点击同意和永久拒绝，\n以便查看各状态回调弹出的Toast提示)",
              children: [
                Buttons.roundTextButton("文档主页", btnColor: MoreColors.tomato,
                    clickCallback: () {
                  Logs.i("文档主页", tag: _tag);
                  Url.openWebUrl("https://gitee.com/MingYCheung/FLScaffold");
                }),
                SizedBox(width: 8),
                Buttons.roundTextButton("效果演示", clickCallback: () {
                  Logs.i("效果演示", tag: _tag);
                  // 申请权限
                  PermissionUtil.requestPermissionsStatuses(
                      [Permission.location, Permission.calendar, Permission.camera],
                      new PermissionStatusCallback(
                          // 授予
                          onGranted: (List<Permission> coincident,
                              Map<Permission, PermissionStatus> initial) {
                        Toast.show("用户授予${coincident.toString()}", context);
                        Logs.v("授予${coincident.toString()}, ${initial.toString()}", tag: _tag);
                      },
                          // 拒绝
                          onDenied: (List<Permission> coincident,
                              Map<Permission, PermissionStatus> initial) {
                        Toast.show("用户拒绝${coincident.toString()}", context);
                        Logs.v("拒绝${coincident.toString()}, ${initial.toString()}", tag: _tag);
                      },
                          // 永拒 android
                          onPermanentlyDenied: (List<Permission> coincident,
                              Map<Permission, PermissionStatus> initial) {
                        Toast.show("用户选择了拒绝不再提醒${coincident.toString()}", context);
                        Logs.v("永拒${coincident.toString()}, ${initial.toString()}", tag: _tag);
                      },
                          // 受限 ios
                          onRestricted: (List<Permission> coincident,
                              Map<Permission, PermissionStatus> initial) {
                        Toast.show("${coincident.toString()}权限受到系统限制, 无法获取", context);
                        Logs.v("${coincident.toString()} 受限", tag: _tag);
                      }));
                }),
              ]),
        ],
      ),
    );
  }
}
