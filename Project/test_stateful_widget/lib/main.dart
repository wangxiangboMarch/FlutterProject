import 'package:flutter/material.dart';
import 'test_stateful_widget.dart';

void main() {
  runApp(MyApp());
}

/// MyApp 核心入口界面
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Two You are', // APP 名字
        theme: ThemeData(
          primarySwatch: Colors.blue, // APP 主题
        ),
        home: Scaffold(
            appBar: AppBar(
              title: Text('Two You are'), // 页面名字
            ),
            body: Center(
              child:
              TestStatefulWidget(),
            )
        ));
  }
}