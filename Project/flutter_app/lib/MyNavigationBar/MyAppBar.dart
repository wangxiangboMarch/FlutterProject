import 'package:flutter/material.dart';

///  自定义的navigation bar
class MyAppBar extends StatelessWidget {
  MyAppBar({this.title});
  
  // Widget子类中的字段往往都会定义为"final"
  final Widget title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56.0, // 单位是逻辑上的像素（并非真实的像素，类似于浏览器中的像素）
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      decoration: new BoxDecoration(color: Colors.blue[500]),
      // Row 是水平方向的线性布局（linear layout）
        child: new Row(
          //列表项的类型是 <Widget>
            children: <Widget>[
              new IconButton(
                icon: new Icon(Icons.menu),
                tooltip: 'Navigation menu',
                onPressed: null, // null 会禁用 button
              ),
              // Expanded expands its child to fill the available space.
              // widget被标记为Expanded, ，这意味着它会填充尚未被其他子项占用的的剩余可用空间
              new Expanded(
                child: title,
              ),
              new IconButton(
                icon: new Icon(Icons.search),
                tooltip: 'Search',
                onPressed: null,
              )
            ]
        )
    );
  }
}
