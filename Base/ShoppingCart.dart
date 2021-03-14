// 第一个版本
// 定义商品 Item 类
class Item {
  double price;
  String name;
  Item(this.name, this.price);
}

// 定义购物车类
class ShoppingCart {
  String name;
  DateTime date = DateTime.now();
  String code;
  List<Item> bookings = [];

  price() {
    double sum = 0.0;
    for (var i in bookings) {
      sum += i.price;
    }
    return sum;
  }

  ShoppingCart(this.name, this.code);

  getInfo() {
    return '购物车信息:' +
        '\n-----------------------------' +
        '\n 用户名: ' +
        name +
        '\n 优惠码: ' +
        code +
        '\n 总价: ' +
        price().toString() +
        '\n 日期: ' +
        date.toString() +
        '\n-----------------------------';
  }
}

void main() {
  ShoppingCart sc = ShoppingCart('张三', '123456');
  sc.bookings = [Item('苹果', 10.0), Item('鸭梨', 20.0)];
  print(sc.getInfo());
}
