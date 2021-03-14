
class Meta {
  double price;
  String name;
  Meta(this.name, this.price);
}

class Item extends Meta {
  Item(name, price) : super(name, price);
  // 重载了 + 运算符，合并商品为套餐商品
  Item operator +(Item item) => Item(name + item.name, price + item.price);
}

class ShoppingCart extends Meta {
  DateTime date;
  String? code;
  List<Item> bookings = [];
  // price() {
  //   double sum = 0.0;
  //   for (var i in bookings) {
  //     sum += i.price;
  //   }
  //   return sum;
  // }

  // double get price {
  //   double sum = 0.0;
  //   for (var i in bookings) {
  //     sum += i.price;
  //   }
  //   return sum;
  // }

//// 把迭代求和改写为归纳合并
  double get price =>
      bookings.reduce((value, element) => value + element).price;

  // 删掉了构造函数函数体
  ShoppingCart(name, this.code) : date = DateTime.now(),super(name,0);
  // 默认初始化方法，转发到 withCode 里
  // ShoppingCart({name}) : this.withCode(name:name, code: code);
  //withCode 初始化方法，使用语法糖和初始化列表进行赋值，并调用父类初始化方法
  // ShoppingCart.withCode(name, {this.code}) : date = DateTime.now(), super(name,0);

  // getInfo() {
  //   return '购物车信息:' +
  //       '\n-----------------------------' +
  //       '\n 用户名: ' +
  //       name +
  //       '\n 优惠码: ' +
  //       code +
  //       '\n 总价: ' +
  //       price.toString() +
  //       '\n 日期: ' +
  //       date.toString() +
  //       '\n-----------------------------';
  // }

  getInfo() => '''
    购物车信息:
    -----------------------------
      用户名: $name
      优惠码: $code
      总价: $price
      Date: $date
    -----------------------------
    ''';
}

void main() {
  ShoppingCart sc = ShoppingCart('张三Hello', '123456');
  sc.bookings = [Item('苹果', 10.0), Item('鸭梨', 20.0)];
  print(sc.getInfo());
}
