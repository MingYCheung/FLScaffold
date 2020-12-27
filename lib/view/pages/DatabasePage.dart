import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_scaffold/scaffold/ui/MoreColors.dart';

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
  State<StatefulWidget> createState() =>DatabasePageState();
}

class DatabasePageState extends State<DatabasePage> {
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
          title: Text("Database Demo",
              style: TextStyle(color: MoreColors.black)),
        ),
        body: GestureDetector(
          onTap: () {
            // 清除焦点
            FocusScope.of(context).requestFocus(new FocusNode());
          },
          child: content(context),
        ));
  }
}

content(BuildContext context) {
  return Center(
    child: Column(
      children: [
        //
      ],
    ),
  );
}
