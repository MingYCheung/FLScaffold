import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_scaffold/scaffold/ui/MoreColors.dart';
import 'package:flutter_scaffold/view/widget/Cards.dart';

/// @ClassName: DatabaseOperation
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

class DatabasePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => DatabasePageState();
}

class DatabasePageState extends State<DatabasePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: MoreColors.smoke,
        appBar: AppBar(
          backgroundColor: MoreColors.smoke,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_rounded, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
          elevation: 0.8,
          centerTitle: true,
          title:
              Text('DatabasePage', style: TextStyle(color: MoreColors.black)),
        ),
        body: body(context));
  }
}

body(BuildContext context) {
  return Container(
    margin: const EdgeInsets.all(8.0),
    child: Column(
      children: [
        Cards.databasePageCard(
            child: Column(
    mainAxisSize: MainAxisSize.min,
          children: [
            // 标题
            Text("UserTable",
                style: TextStyle(
                    color: MoreColors.white,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold)),
            // 占位
            SizedBox(height: 12),
            // 表格
            Table(
              columnWidths: const {
                0: FixedColumnWidth(80.0),
                1: FixedColumnWidth(100.0),
                2: FixedColumnWidth(80.0),
                3: FixedColumnWidth(100.0),
              },
              children: [
                userTableHeader(),
                userTableRow(
                    id: "0", name: "MingYCheung", age: "18", sex: "men"),
                userTableRow(id: "1", name: "Ethan", age: "19", sex: "men"),
                userTableRow(id: "2", name: "Emily", age: "21", sex: "women"),
                userTableRow(id: "3", name: "Rick", age: "34", sex: "men"),
                userTableRow(id: "4", name: "Price", age: "42", sex: "men"),
                userTableRow(id: "5", name: "George", age: "21", sex: "men"),
              ],
            ),
          ],
        )),
      ],
    ),
  );
}

// UserTable头部
TableRow userTableHeader() {
  return TableRow(
      decoration: BoxDecoration(
        color: MoreColors.slateBlue,
        borderRadius: BorderRadius.all(Radius.circular(32)),
      ),
      children: [
        tableRowChild("Id",
            fontSize: 16.0,
            textColor: MoreColors.powderBlue,
            fontWeight: FontWeight.bold),
        tableRowChild("Name",
            fontSize: 16.0,
            textColor: MoreColors.white,
            fontWeight: FontWeight.bold),
        tableRowChild("Age",
            fontSize: 16.0,
            textColor: MoreColors.white,
            fontWeight: FontWeight.bold),
        tableRowChild("Sex",
            fontSize: 16.0,
            textColor: MoreColors.white,
            fontWeight: FontWeight.bold),
      ]);
}

// UserTable行
TableRow userTableRow({String id, String name, String age, String sex}) {
  return TableRow(children: [
    tableRowChild(id,
        textColor: MoreColors.powderBlue, fontWeight: FontWeight.bold),
    tableRowChild(name,
        textColor: MoreColors.white, fontWeight: FontWeight.w500),
    tableRowChild(age,
        textColor: MoreColors.white, fontWeight: FontWeight.w500),
    tableRowChild(sex,
        textColor: MoreColors.white, fontWeight: FontWeight.w500),
  ]);
}

// 表格行子
Widget tableRowChild(String text,
    {double fontSize: 12.0,
    EdgeInsetsGeometry margin: const EdgeInsets.all(6.0),
    Color textColor: MoreColors.black,
    FontWeight fontWeight: FontWeight.normal}) {
  return Center(
      child: Container(
          margin: margin,
          child: Text(text,
              style: TextStyle(
                  fontSize: fontSize,
                  color: textColor,
                  fontWeight: fontWeight))));
}
