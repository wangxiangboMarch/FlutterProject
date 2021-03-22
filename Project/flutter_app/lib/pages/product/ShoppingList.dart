import 'package:flutter/material.dart';

import 'package:flutter_app/struct/Product.dart';
import 'package:flutter_app/pages/product/ProductDetaile.dart';

import 'package:flutter_app/widgets/product/ShoppingListItem.dart';

/// 商品列表
///
///
class ShoppingList extends StatefulWidget {
  /// 商品数据
  final List<Product> products;

  ShoppingList({Key key, this.products}) : super(key: key);


  @override
  _ShoppingListState createState() => new _ShoppingListState();
}

class _ShoppingListState extends State<ShoppingList> {
  Set<Product> _shoppingCart = new Set<Product>();

  void _handleCartChanged(Product product, bool inCart) {
    setState(() {
      // When user changes what is in the cart, we need to change _shoppingCart
      // inside a setState call to trigger a rebuild. The framework then calls
      // build, below, which updates the visual appearance of the app.

      if (inCart)
        _shoppingCart.add(product);
      else
        _shoppingCart.remove(product);
    });
  }
  /// Future
  Future<void> _pushToNewNav() async {

    // 打开`TipRoute`，并等待返回结果
    var result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return ShoppingDetaile(
            // 路由参数
            text: "我是提示xxxx",
          );
        },
      ),
    );
    //输出`TipRoute`路由返回结果
    print("路由返回值: $result");
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Shopping List'),
      ),
      body: new ListView(
        padding: new EdgeInsets.symmetric(vertical: 8.0),
        children: widget.products.map((Product product) {
          return new ShoppingListItem(
            product: product,
            inCart: _shoppingCart.contains(product),
            onCartChanged: _handleCartChanged,
          );
        }).toList(),
      ),
      floatingActionButton: new FloatingActionButton(
        heroTag: "001",
        onPressed: _pushToNewNav,
        tooltip: 'Increment',
        child: new Icon(Icons.add),
      ),
    );
  }
}
