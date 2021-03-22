import 'package:flutter/material.dart';

import 'package:flutter_app/struct/UserInfoStruct.dart';
import 'package:flutter_app/struct/ArticleSummaryStruct.dart';

import 'package:flutter_app/widgets/common/BannerInfo.dart';
import 'package:flutter_app/widgets/homepage/ArticleCard.dart';
/// 首页列表信息
///
/// 展示banner和帖子信息
class ArticleHomePage extends StatelessWidget {

  /// banner 地址信息
  final String bannerImage =
      'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fpic1.win4000.com%2Fwallpaper%2F2019-01-17%2F5c401c0cd16ca.jpg&refer=http%3A%2F%2Fpic1.win4000.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1618752717&t=5f1c6af58885322c16dc03728ff4560e';

  /// 帖子标题
  final UserInfoStruct userInfo = UserInfoStruct('flutter',
      'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fi0.hdslb.com%2Fbfs%2Fface%2Fecedaaee95e9562fe257d1aaed2f9bb9195a8ca6.jpg&refer=http%3A%2F%2Fi0.hdslb.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1618752717&t=40d539ad67f8f1aa5e103fd766edb410');

  /// 帖子概要描述信息
  final ArticleSummaryStruct articleInfo = ArticleSummaryStruct(
      '你好，教个朋友',
      '我是一个小可爱',
      'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fi0.hdslb.com%2Fbfs%2Fface%2Fecedaaee95e9562fe257d1aaed2f9bb9195a8ca6.jpg&refer=http%3A%2F%2Fi0.hdslb.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1618752717&t=40d539ad67f8f1aa5e103fd766edb410',
      20,
      30);

  @override
  Widget build(BuildContext context) {

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
      body: new Container(
        child: Column(
          children: <Widget>[
            BannerInfo(bannerImage: bannerImage),
            ArticleCard(
              userInfo: userInfo,
              articleInfo: articleInfo,
            ),
          ],
        ),
      )
    );
  }
}