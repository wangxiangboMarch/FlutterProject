
import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 该GestureDetector widget并不具有显示效果，而是检测由用户做出的手势
    //  当用户点击Container时， GestureDetector会调用它的onTap回调
    return new GestureDetector(
      onTap: () {
        print('MyButton was tapped!');
      },
        child: new Container(
          height: 36.0,
          padding: const EdgeInsets.all(8.0),
          margin: const EdgeInsets.symmetric(horizontal: 8.0),
          decoration: new BoxDecoration(
            borderRadius: new BorderRadius.circular(5.0),
            color: Colors.lightGreen[500],
          ),
          child: new Center(
            child: new Text('Engage'),
          ),
        )
    );
    // TODO: implement build
    throw UnimplementedError();
  }
}