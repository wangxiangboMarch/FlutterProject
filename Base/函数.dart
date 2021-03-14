/**
 * 函数
 * 函数是一段用来独立地完成某个功能的代码
 * 在 Dart 中，所有类型都是对象类型，函数也是对象，
 * 它的类型叫作 Function。这意味着函数也可以被定义为变量，
 * 甚至可以被定义为参数传递给另一个函数
*/

main(List<String> args) {
  Function f = isZero;
  int x = 10;
  int y = 0;
  printInfo(x, f); // 输出 10 is Zero: false
  printInfo(y, f); // 输出 0 is Zero: true
}

// 如果函数体只有一行表达式
// 还可以像 JavaScript 语言那样用箭头函数来简化这个函数
bool isZero(int number) => number == 0;
// bool isZero(int number) { // 判断整数是否为 0
//   return number == 0;
// }

void printInfo(int number, Function check) =>
    print("$number is Zero: ${check(number)}");

// void printInfo(int number,Function check) { // 用 check 函数来判断整数是否为 0
//   print("$number is Zero: ${check(number)}");
// }

// Dart 认为重载会导致混乱，因此从设计之初就不支持重载，
// 而是提供了可选命名参数和可选参数
// 具体方式是，在声明函数时:
// 给参数增加{}，以 paramName: value 的方式指定调用参数，也就是可选命名参数
// 给参数增加 []，则意味着这些参数是可以忽略的，也就是可选参数

// 两种方式定义函数时，我们还可以在参数未传递时设置默认值

// 要达到可选命名参数的用法，那就在定义函数的时候给参数加上 {}
void enable1Flags({required bool bold, bool? hidden}) =>
    print("$bold , $hidden");

// 定义可选命名参数时增加默认值
void enable2Flags({bool bold = true, bool hidden = false}) =>
    print("$bold ,$hidden");

// 可忽略的参数在函数定义时用 [] 符号指定
void enable3Flags(bool bold, [bool? hidden]) => print("$bold ,$hidden");

// 定义可忽略参数时增加默认值
void enable4Flags(bool bold, [bool hidden = false]) => print("$bold ,$hidden");

functionCheck() {
  // 可选命名参数函数调用
  enable1Flags(bold: true, hidden: false); //true, false
  enable1Flags(bold: true, hidden: null); //true, null
  enable2Flags(bold: false); //false, false

  // 可忽略参数函数调用
  enable3Flags(true, false); //true, false
  enable3Flags(
    true,
  ); //true, null
  enable4Flags(true); //true, false
  enable4Flags(true, true); // true, true
}
// 这里我要和你强调的是，在 Flutter 中会大量用到可选命名参数的方式，你一定要记住它的用法。
