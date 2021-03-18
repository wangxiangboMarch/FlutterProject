import 'package:flutter/material.dart';
/// 创建有状态测试组件
class TestStatefulWidget extends StatefulWidget {
  @override
  createState() {
    print('create state');
    return TestState();
  }
}
/// 创建状态管理类，继承状态测试组件
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
        FlatButton(
          child: Text('$name $count'), // 使用 Text 组件显示描述字符和当前计算
          onPressed:()=> this.changeName(), // 点击触发修改描述字符 state name
        )
      ],
    );
  }
}

/// 执行顺序
// flutter: create state
// flutter: init state
// flutter: did change dependencies
// flutter: build
// flutter: reassemble
// flutter: did update widget
// flutter: build
/// 但其中最值得关注的是 build 运行了两次。这是在开发模式下才会执行的过程，在正式环境是不会出现的，因为重新渲染成本非常大，
/// 这个问题可以使用打印 build 的调用堆栈即可发现。
/// 其实这里会触发 didUpdateWidget 函数，是因为 TestStatefulWidget 组件是 MyApp 组件中的子组件，
/// 从而导致 MyApp 函数中的 build 触发子组件 didUpdateWidget 函数的执行，具体会在下面触发组件再次 build 中详细说明