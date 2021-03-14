// 变量与类型
// 在默认情况下，未初始化的变量的都是null，
// 因此我们不用担心无法判定一个传递过来的、未定义变量到底是 undefined
/**
 *  Dart 是类型安全的语言，并且所有类型都是对象类型，
 *  都继承自顶层类型 Object，因此一切变量的值都是类的实例
 * （即对象），甚至数字、布尔值、函数和 null 也都是
 *  继承自 Object 的对象
 */

/**
 *  Dart 内置了一些基本类型，
 *  如 num、bool、String、List 和 Map，
 *  在不引入其他库的情况下可以使用它们去声明变量
 *  Dart 的数值类型 num，只有两种子类：即 64 位 int 
 *  和符合 IEEE 754 标准的 64 位 double。
*/

main(List<String> args) {
  int x = 1;
  int hex = 0xEEADBEEF;
  double y = 1.1;
  double exponents = 1.13e5;
  // 使用继承自 num 的 abs()、round()
  // 等方法，来实现求绝对值、取整的功能
  int roundy = y.round();

  print(hex);
}

/**
 * 其他高级运算方法的需求 num 无法满足，
 * 你可以试用一下 dart:math 库
 * 这个库提供了诸如三角函数、指数、对数、平方根等高级函数
*/

// 为了表示布尔值，Dart 使用了一种名为 bool 的类型。
// 在 Dart 里，只有两个对象具有 bool 类型：true 和 false，
// 它们都是编译时常量
checkIsZero() {
  // 检查是否为 0.
  var number = 0;
  assert(number == 0);
  // assert(number); 错误
}

/**
 * 使用 ${express} 把一个表达式的值放进字符串。而如果是一个标识符，你可以省略{}
*/
addString() {
  var s = 'cat';
  var s1 = 'this is a uppercased string: ${s.toUpperCase()}';
  print(s1);
  // 为了获得内嵌对象的字符串，Dart 会调用对象的toString()方法
  // 常见字符串的拼接，Dart 则通过内置运算符“+”实现
  var s2 = 'Hello' + ' ' + 'World!';
  // 多行字符串的构建，你可以通过三个单引号或三个双引号的方式声明

  var s3 = """This is a
  ulti-line string.""";
}

/**
 * List 与 Map
 * 数组和字典类型，在 Dart 中的对应实现是 List 和 Map
*/
checkList() {
  // var arr1 = ["Tom", "Andy", "Jack"];
  // var arr2 = List.of([1, 2, 3]);
  // arr2.add(499);
  // arr2.forEach((v) => print('${v}'));

  var arr1 = <String>['Tom', 'Andy', 'Jack'];
  var arr2 = new List<int>.of([1, 2, 3]);
  arr2.add(499);
  arr2.forEach((v) => print('${v}'));
  print(arr2 is List<int>); // true
}

checkMap() {
  // var map1 = {"name": "Tom", 'sex': 'male'};
  // var map2 = new Map();
  // map2['name'] = 'Tom';
  // map2['sex'] = 'male';
  // map2.forEach((k, v) => print('${k}: ${v}'));

  var map1 = <String, String>{
    'name': 'Tom',
    'sex': 'male',
  };
  var map2 = new Map<String, String>();
  map2['name'] = 'Tom';
  map2['sex'] = 'male';
  map2.forEach((k, v) => print('${k}: ${v}'));
  print(map2 is Map<String, String>); // true
}
/**
 * 常量定义
 * 如果你想定义不可变的变量，则需要在定义变量前加上 final 或 const 关键字
 * const，表示变量在编译期间即能确定的值
 * final 则不太一样，用它定义的变量可以在运行时确定值，而一旦确定后就不可再变
 * final可以式一个表达式
*/

checkFinalConst() {
  final name = 'Andy';
  const count = 3;

  var x = 70;
  var y = 30;
  final z = x / y;
}
