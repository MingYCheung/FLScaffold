import 'package:flutter/material.dart';
import 'package:flutter_scaffold/scaffold/ui/MoreColors.dart';
import 'package:flutter_scaffold/scaffold/utils/net/Url.dart';
import 'package:flutter_scaffold/view/widget/Buttons.dart';
import 'package:flutter_scaffold/view/widget/Cards.dart';
import 'package:flutter_scaffold/viewModel/pages/PermissionPageVM.dart';

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
                  Url.openWebUrl("https://gitee.com/MingYCheung/FLScaffold");
                }),
                SizedBox(width: 8),
                Buttons.roundTextButton("效果演示", clickCallback: () {
                  PermissionPageVM.aPermissionRequest(context);
                })
              ]),
          // 多个权限申请卡片
          Cards.demoPageCard(
              "向用户申请多个权限[位置, 日历, 相机]权限，\n直接弹出系统底部弹窗\n(建议android最后点击同意和永久拒绝，\n以便查看各状态回调弹出的Toast提示)",
              children: [
                Buttons.roundTextButton("文档主页", btnColor: MoreColors.tomato,
                    clickCallback: () {
                  Url.openWebUrl("https://gitee.com/MingYCheung/FLScaffold");
                }),
                SizedBox(width: 8),
                Buttons.roundTextButton("效果演示", clickCallback: () {
                  PermissionPageVM.permissionsRequest(context);
                }),
              ]),
        ],
      ),
    );
  }
}
