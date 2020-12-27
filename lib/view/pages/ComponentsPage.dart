import 'package:flutter/material.dart';
import 'package:flutter_scaffold/scaffold/ui/MoreColors.dart';

/// @ClassName: ComponentsPage
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

class ComponentsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ComponentsPageState();
}

String _tag = 'ComponentsPage: ';

class ComponentsPageState extends State<ComponentsPage> {
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
        title:
        Text('ComponentsPage', style: TextStyle(color: MoreColors.black)),
      ),
      body: Center(
        child: Text('ComponentsPage'),
      ),
    );
  }
}