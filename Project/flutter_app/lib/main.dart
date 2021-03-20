import 'package:flutter/material.dart';
import 'MyPage/MyScaffold.dart';
import 'TutorialHome.dart';
import 'pages/home_page.dart';
import 'package:flutter_app/pages/ArticleHomePage.dart';

void main() {
  
  runApp(ArticleMyApp());
  
  // runApp(MyApp());
  // 为了继承主题数据，widget需要位于MaterialApp内才能正常显示， 因此我们使用MaterialApp来运行该应用
  // runApp(new MaterialApp(
  //   title: 'My app', // used by the OS task switcher
  //   home: new TutorialHome(),
  // ));
}

/// MyApp 核心入口界面
class ArticleMyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Two You', // APP 名字
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue, // APP 主题
        ),
        home: Scaffold(
            appBar: AppBar(
              title: Text('News'), // 页面名字
            ),
            body: Center(
              child: ArticleHomePage(),
            )));
  }
}