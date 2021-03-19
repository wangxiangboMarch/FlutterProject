import 'package:flutter/material.dart';

///  创建有状态测试组件
class TestStatefulWidget extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    print('create state');
    return TestState();
  }
}

class TestState extends State<TestStatefulWidget> {
  /// 定义 state [count] 计算器
  int count = 1;
  /// 定义 state [name] 为当前描述字符串
  String name = 'test';

  @override
  initState() {
    print('init state');
    super.initState();
  }
  @override
  didChangeDependencies() {
    print('did change dependencies');
    super.didChangeDependencies();
  }
  @override
  didUpdateWidget(TestStatefulWidget oldWidget) {
    count++;
    print('did update widget');
    super.didUpdateWidget(oldWidget);
  }
  @override
  deactivate() {
    print('deactivate');
    super.deactivate();
  }
  @override
  dispose() {
    print('dispose');
    super.dispose();
  }
  @override
  reassemble(){
    print('reassemble');
    super.reassemble();
  }
  /// 修改 state name
  void changeName() {
    setState(() {
      print('set state');
      this.name = 'flutter';
    });
  }
  @override
  Widget build(BuildContext context) {
    print('build');
    return Column(
      children: <Widget>[
        TextButton(onPressed: changeName, child: Text('$name $count'))
      ],
    );
  }
}
