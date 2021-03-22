import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_app/Model/like_num_model.dart';

import 'package:flutter_app/TabbarWidget.dart';

void main() {
  
  runApp(MyApp());
}

/// MyApp 核心入口界面
class MyApp extends StatelessWidget {
  /// 创建 like model
  final likeNumModel = LikeNumModel();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return Provider<int>.value(
      child: ChangeNotifierProvider.value(
        value: likeNumModel,
        child: MaterialApp(
            title: 'Two You', // APP 名字
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.blue, // APP 主题
            ),
            home: TabbarController()
        ),
      ),
    );
  }
}