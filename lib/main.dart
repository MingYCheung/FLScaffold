import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_scaffold/scaffold/ui/MoreColors.dart';
import 'package:flutter_scaffold/scaffold/utils/common/ScreenUtil.dart';
import 'package:flutter_scaffold/view/pages/DemosPage.dart';
import 'package:flutter_scaffold/view/pages/ComponentsPage.dart';
import 'package:flutter_scaffold/view/pages/ExperimentPage.dart';
import 'package:flutter_scaffold/view/pages/AboutPage.dart';

/// @ClassName: main
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

void main() {
  runApp(MyApp());
  // 设置沉浸式状态栏
  ScreenUtil.setBarStatus(true);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "FLScaffold Demo",
      theme: ThemeData(
        primarySwatch: Colors.grey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // 导航栏选中位置
  int _selectedIndex;

  @override
  void initState() {
    super.initState();
    _selectedIndex = 0;
  }

  buildBody(int index) {
    switch (index) {

      /// DemoPage
      case 0:
        return DemosPage();

      /// ComponentsPage
      case 1:
        return ComponentsPage();

      /// ExperimentPage
      case 2:
        return ExperimentPage();

      /// AboutPage
      case 3:
        return AboutPage();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildBody(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: MoreColors.white,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: MoreColors.dodgerBlue,
        unselectedItemColor: MoreColors.gray,
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        currentIndex: _selectedIndex,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.data_usage),
            label: "Demo",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: "Component",
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.science), label: "Experiment"),
          BottomNavigationBarItem(icon: Icon(Icons.whatshot), label: "About"),
        ],
      ),
    );
  }
}
