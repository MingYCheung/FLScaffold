import 'package:flutter/material.dart';
import 'package:flutter_scaffold/model/database/User.dart';
import 'package:flutter_scaffold/scaffold/base/database/DatabaseProvider.dart';
import 'package:flutter_scaffold/scaffold/ui/MoreColors.dart';

/// @ClassName: UserProvider
///
/// @Author MingYCheung
///
/// @Website: https://www.mingycheung.tech
///
/// @Email: mingycheung@tom.com
///
/// @Creation: 2020/12/20 15:30
///
/// @Description:

class UserProvider extends DatabaseProvider{
  
  /// 构造方法
  /// 传入User
  UserProvider(Object model) : super(User);

  @override
  // TODO: implement model
  Object get model => super.model;


}
