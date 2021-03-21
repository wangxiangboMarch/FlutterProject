import 'package:flutter/material.dart';

import 'package:flutter_app/struct/ArticleSummaryStruct.dart';
import 'package:flutter_app/struct/UserInfoStruct.dart';

import 'package:flutter_app/widgets/homepage/ArticleSummary.dart';
import 'package:flutter_app/widgets/homepage/ArticleBottomBar.dart';
import 'package:flutter_app/widgets/homepage/ArticleLikeBar.dart';

import 'package:flutter_app/pages/ArticleDetail.dart';

/// 此为帖子描述类，包括了帖子UI中的所有元素
class ArticleCard extends StatelessWidget {
  /// 传入的用户信息
  final UserInfoStruct userInfo;

  /// 传入的帖子信息
  final ArticleSummaryStruct articleInfo;

  /// 构造函数
  const ArticleCard({Key key, this.userInfo, this.articleInfo})
      : super(key: key);

  /// 执行页面跳转到article_detail
  void goToArticleDetailPage(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return ArticleDetail();
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(8),
      child: FlatButton(
        onPressed: () => goToArticleDetailPage(context),
        child: Column(
          children: <Widget>[
            ArticleSummary(
                title: articleInfo.title,
                summary: articleInfo.summary,
                articleImage: articleInfo.articleImage),
            Row(
              children: <Widget>[
                Expanded(
                  flex: 9,
                  child: ArticleBottomBar(
                      nickname: userInfo.nickname,
                      headerImage: userInfo.headerImage,
                      commentNum: articleInfo.commentNum),
                ),
                Expanded(
                  flex: 3,
                  child: ArticleLikeBar(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}