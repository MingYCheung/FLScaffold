import 'package:flutter/material.dart';
import 'package:flutter_scaffold/scaffold/ui/MoreColors.dart';
import 'package:flutter_scaffold/view/pages/DatabasePage.dart';
import 'package:flutter_scaffold/view/widget/Cards.dart';
import 'PermissionPage.dart';

/// @ClassName: DemosPage
///
/// @Author MingYCheung
///
/// @Website: https://www.mingycheung.tech
///
/// @Email: mingycheung@tom.com
///
/// @Creation: 2020/12/20 15:32
///
/// @Description:

class DemosPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => DemosPageState();
}

class DemosPageState extends State<DemosPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: MoreColors.whiteSmoke,
        appBar: AppBar(
          backgroundColor: MoreColors.white,
          elevation: 0.0,
          centerTitle: true,
          title: Text("Demos", style: TextStyle(color: MoreColors.black)),
        ),
        body: GridView(
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 260.0,
            childAspectRatio: 0.68,
          ),
          children: <Widget>[
            Cards.demosPageCard(
                "S..", "数据库", "sqfLite二次封装, 减少sql语句的使用、开发成本以及构建数据库时间", "Demo",
                clickCallback: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => DatabasePage()));
            }),
            Cards.demosPageCard(
                "P..",
                "权限",
                "permission_handler二次封装, 较少代码冗余、开发者的动态申请调试次数",
                "Demo", clickCallback: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => PermissionPage()));
            }),
          ],
        ));
  }
}
