import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // 需要在pubspec.yaml增加该模块

class HomePage extends StatefulWidget {

  TabController _controller;

  /// 当前时间显示的前缀信息
  final String prefix = '当前时间';
  @override
  createState() => HomePageState();
}

/// 首页有状态组件类
///
/// 主要是获取当前时间，并动态展示当前时间
class HomePageState extends State<HomePage> {

  TabController _controller;

  /// 展示当前时间字符串
  String currentTimeStr;
  @override
  void initState() {
    super.initState();
    // _controller = TabController(initialIndex: 0,vsync: ,length: 3);
    this.currentTimeStr = getCurrentTime();
    refreshTimeStr();
  }

  /// 更新当前时间字符串 [currentTimeStr]
  ///
  /// 每 500ms 更新一次，使用 Timer
  void refreshTimeStr() {
    const period = Duration(milliseconds: 500);
    // 定时更新当前时间的 currentTimeStr 字符串
    Timer.periodic(period, (timer) {
      setState(() {
        this.currentTimeStr = getCurrentTime();
      });
    });
  }

  /// 获取当前时间戳
  ///
  /// [prefix]需要传入一个前缀信息
  /// 返回一个字符串类型的前缀信息：时间戳
  String getCurrentTime() {
    DateTime now = DateTime.now();
    var formatter = DateFormat('yy-mm-dd H:m:s');
    return formatter.format(now);
  }
  /// 有状态类返回组件信息
  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      appBar: new AppBar(
        leading: new IconButton(
          icon: new Icon(Icons.menu),
          tooltip: 'Navigation menu',
          onPressed: null,
        ),
        title: new Text('Example title'),
        // bottom: TabBar(
        //   controller: _controller,
        //   tabs: [
        //     Tab(
        //       icon: Icon(Icons.view_list),
        //       text: "推荐",
        //     ),
        //     Tab(
        //       icon: Icon(Icons.favorite),
        //       text: "关注",
        //     ),
        //     Tab(
        //       icon: Icon(Icons.person),
        //       text: "我",
        //     )
        //   ],
        // ),
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.search),
            tooltip: 'Search',
            onPressed: null,
          ),
        ],
      ),
      //body占屏幕的大部分
      body: new Center(
        child: new Column(
          children: <Widget>[
            Text(widget.prefix),
            Text(this.currentTimeStr)
          ],
        )
      ),
    );
  }
}
