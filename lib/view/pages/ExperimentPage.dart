import 'package:flutter/material.dart';
import 'package:flutter_scaffold/scaffold/ui/MoreColors.dart';

/// @ClassName: ExperimentPage
///
/// @Author MingYCheung
///
/// @Website: https://www.mingycheung.tech
///
/// @Email: mingycheung@tom.com
///
/// @Creation: 2020/12/20 15:31
///
/// @Description:

class ExperimentPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ExperimentPageState();
}

class ExperimentPageState extends State<ExperimentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MoreColors.smoke,
      appBar: AppBar(
        backgroundColor: MoreColors.smoke,
        elevation: 0.8,
        centerTitle: true,
        title:
        Text('ExperimentPage', style: TextStyle(color: MoreColors.black)),
      ),
      body: Center(
        child: Text('ExperimentPage'),
      ),
    );
  }
}