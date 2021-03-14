/**
 * 类的定义及初始化
 * 值得一提的是，Dart 中并没有 public、protected、private 这些关键字，
 * 我们只要在声明变量与方法时，在前面加上“_”即可作为 private 方法使用。
 * 如果不加“_”，则默认为 public。不过，“_”的限制范围并不是类访问级别的，
 * 而是库访问级别
*/

class Point {
  num x, y;
  // 类变量
  static num factor = 0;
  // 语法糖，等同于在函数体内：this.x = x;this.y = y;
  Point(this.x, this.y);
  void printInfo() => print('($x, $y)');
  static void printZValue() => print('$factor');
}

class Point1 {
  num x, y, z;
  Point1(this.x, this.y) : z = 0; // 初始化变量 z
  Point1.bottom(num x) : this(x, 0); // 重定向构造函数
  void printInfo() => print('($x,$y,$z)');
}

// main(List<String> args) {
//   var p = new Point(100, 200); // new 关键字可以省略
//   p.printInfo(); // 输出 (100, 200);
//   Point.factor = 10;
//   Point.printZValue(); // 输出 10

//   var p1 = Point1.bottom(100);
//   p1.printInfo(); // 输出 (100,0,0)
// }
/**
 * 
 * 复用
 * 在面向对象的编程语言中，将其他类的变量与方法纳入
 * 本类中进行复用的方式一般有两种：继承父类和接口实现
 * 
 * 继承父类意味着，子类由父类派生，会自动获取父类的成员变量和方法实现，
 * 子类可以根据需要覆写构造函数及父类方法；
 * 
 * 接口实现则意味着，子类获取到的仅仅是接口的成员变量符号和方法符号，
 * 需要重新实现成员变量，以及方法的声明和初始化，否则编译器会报错。
*/

class BigPoint {
  num x = 0, y = 0;
  void printInfo() => print('($x, $y)');
}

//Vector 继承自 BigPoint
class Vector extends BigPoint {
  num z = 0;
  @override
  void printInfo() => print('($x,$y,$z)'); // 覆写了 printInfo 实现
}

//Coordinate 是对 BigPoint 的接口实现
class Coordinate implements BigPoint {
  num x = 0, y = 0; // 成员变量需要重新声明
  void printInfo() => print('($x,$y)'); // 成员函数需要重新声明实现
}

// 混入
class Coordinate1 with BigPoint {}

/**
 * 除了继承和接口实现之外，Dart 还提供了另一种机制来实现类的复用，
 * 即“混入”（Mixin）
 * 混入鼓励代码重用，可以被视为具有实现方法的接口。这样一来，
 * 不仅可以解决 Dart 缺少对多重继承的支持问题，
 * 还能够避免由于多重继承可能导致的歧义（菱形问题）
 * 要使用混入，只需要 with 关键字即可
*/

main(List<String> args) {
  var xxx = Vector();
  xxx
    ..x = 1
    ..y = 2
    ..z = 3; // 级联运算符，等同于 xxx.x=1; xxx.y=2;xxx.z=3;
  xxx.printInfo(); // 输出 (1,2,3)

  var yyy = Coordinate();
  yyy
    ..x = 1
    ..y = 2; // 级联运算符，等同于 yyy.x=1; yyy.y=2;
  yyy.printInfo(); // 输出 (1,2)
  print(yyy is Point); //true
  print(yyy is Coordinate); //true

  // 混入
  var yyy1 = Coordinate1();
  print(yyy1 is Point); //true
  print(yyy1 is Coordinate); //true
}

/**
 * 运算符
 * Dart 多了几个额外的运算符，用于简化处理变量实例缺失（即 null）的情况
 * 
 * ?.运算符：假设 Point 类有 printInfo() 方法，
 * p 是 Point 的一个可能为 null 的实例。那么，p 调用成员方法的安全代码，
 * 可以简化为 p?.printInfo() ，表示 p 为 null 的时候跳过，避免抛出异常
 * 
 *  ??= 运算符：如果 a 为 null，则给 a 赋值 value，否则跳过。
 *  这种用默认值兜底的赋值语句在 Dart 中我们可以用 a ??= value 表示
 * 
 *  ??运算符：如果 a 不为 null，返回 a 的值，
 * 否则返回 b。在 Java 或者 C++ 中，
 * 我们需要通过三元表达式 (a != null)? a : b 来实现这种情况。
 * 而在 Dart 中，这类代码可以简化为 a ?? b
 * 
 * 在 Dart 中，一切都是对象，就连运算符也是对象成员函数的一部分
*/

/**
 * 对于系统的运算符，一般情况下只支持基本数据类型和标准库中提供的类型。
   而对于用户自定义的类，如果想支持基本操作，比如比较大小、相加相减等，
   则需要用户自己来定义关于这个运算符的具体实现

   Dart 提供了类似 C++ 的运算符覆写机制，
   使得我们不仅可以覆写方法，还可以覆写或者自定义运算符。
 */

class Vector2 {
  num x, y;
  Vector2(this.x, this.y);
  // 自定义相加运算符，实现向量相加
  Vector2 operator +(Vector2 v) => Vector2(x + v.x, y + v.y);
  // 覆写相等运算符，判断向量相等
  bool operator ==(dynamic v) => x == v.x && y == v.y;
}

// operator 是 Dart 的关键字，与运算符一起使用，
// 表示一个类成员运算符函数。在理解时，我们应该把 operator
// 和运算符作为整体，看作是一个成员函数名
haha() {
  final x = Vector2(3, 3);
  final y = Vector2(2, 2);
  final z = Vector2(1, 1);
  print(x == (y + z)); //  输出 true
}

// class Point {
//   num x, y;
//   Point() : this.make(0,0);
//   Point.left(x) : this.make(x,0);
//   Point.right(y) : this.make(0,y);
//   Point.make(this.x, this.y);
//   void printInfo() => print('($x,$y)');
// }

// class Vector extends Point{
//   num z = 0;
// /*5 个构造函数
//   Vector
//   Vector.left;
//   Vector.middle
//   Vector.right
//   Vector.make
// */
//   @override
//   void printInfo() => print('($x,$y,$z)'); // 覆写了 printInfo 实现
// }

// 你是怎样理解父类继承，接口实现和混入的？我们应该在什么场景下使用它们？
// 在父类继承的场景中，父类子类之间的构造函数执行顺序是怎样的？如果父类有多个构造函数，子类也有多个构造函数，如何从代码层面确保父类子类之间构造函数的正确调用？
