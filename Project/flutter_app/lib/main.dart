import 'package:flutter/material.dart';
import 'MyPage/MyScaffold.dart';
import 'TutorialHome.dart';
import 'home_page.dart';

void main() {
  runApp(MyApp());
  // 为了继承主题数据，widget需要位于MaterialApp内才能正常显示， 因此我们使用MaterialApp来运行该应用
  // runApp(new MaterialApp(
  //   title: 'My app', // used by the OS task switcher
  //   home: new TutorialHome(),
  // ));
}
