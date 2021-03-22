import 'package:flutter/material.dart';

class TutorialHome extends StatefulWidget {

  TutorialHome({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _TutorialHomeState createState() => _TutorialHomeState();
}


class _TutorialHomeState extends State<TutorialHome> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    //Scaffold是Material中主要的布局组件.
    return new Scaffold(
      appBar: new AppBar(
        leading: new IconButton(
          icon: new Icon(Icons.menu),
          tooltip: 'Navigation menu',
          onPressed: null,
        ),
        title: new Text('Example title'),
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
        child: new Text('Hello, world! + $_counter'),
      ),
      floatingActionButton: new FloatingActionButton(
        heroTag: "002",
        tooltip: 'Add',
        child: new Icon(Icons.add),
        onPressed: _incrementCounter,
      ),
    );
  }
}