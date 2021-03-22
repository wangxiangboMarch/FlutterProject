import 'package:flutter/material.dart';

import 'pages/home_page.dart';
import 'package:flutter_app/pages/ArticleHomePage.dart';
import 'package:flutter_app/pages/TutorialHome.dart';
import 'package:flutter_app/pages/product/ShoppingList.dart';

import 'package:flutter_app/struct/Product.dart';

class TabbarController extends StatefulWidget {

  @override
  _TabbarControllerState createState() => new _TabbarControllerState();

}

class _TabbarControllerState extends State<TabbarController> {

  var _indexNum = 0;
  /// 获取页面组件
  Widget _getPagesWidget(int index) {
    List<Widget> widgetList = [
      HomePage(),
      ArticleHomePage(),
      TutorialHome(),
      ShoppingList(
        products: <Product>[
          new Product(name: 'Eggs'),
          new Product(name: 'Flour'),
          new Product(name: 'Chocolate chips'),
        ],
      )
    ];
    return Offstage(
      offstage: _indexNum != index,
      child: TickerMode(
        enabled: _indexNum == index,
        child: widgetList[index],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Stack(
        children: <Widget>[
          _getPagesWidget(0),
          _getPagesWidget(1),
          _getPagesWidget(2),
          _getPagesWidget(3)
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: '推荐',
            activeIcon: Icon(Icons.people_outline),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: '关注',
            activeIcon: Icon(Icons.favorite_border),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: '我',
            activeIcon: Icon(Icons.person_outline),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: '我',
            activeIcon: Icon(Icons.person_outline),
          )
        ],
        iconSize: 24,
        currentIndex: _indexNum,
        /// 选中后，底部BottomNavigationBar内容的颜色(选中时，默认为主题色)
        /// （仅当type: BottomNavigationBarType.fixed,时生效）
        fixedColor: Colors.lightBlueAccent,
        type: BottomNavigationBarType.fixed,
        onTap: (int index) {
          ///这里根据点击的index来显示，非index的page均隐藏
          if(_indexNum != index){
            setState(() {
              _indexNum = index;
            });
          }
        },
      ),
    );
  }
}