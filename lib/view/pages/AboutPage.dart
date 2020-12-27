import 'package:flutter/material.dart';
import 'package:flutter_scaffold/scaffold/ui/MoreColors.dart';

/// @ClassName: AboutPage
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

class AboutPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AboutPageState();
}

class AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MoreColors.whiteSmoke,
      appBar: AppBar(
        backgroundColor: MoreColors.white,
        elevation: 0.0,
        centerTitle: true,
        title:
            Text("About", style: TextStyle(color: MoreColors.black)),
      ),
      body: Center(
        child: Text("About"),
      ),
    );
  }
}