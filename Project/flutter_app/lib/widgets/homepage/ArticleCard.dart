import 'package:flutter/material.dart';

import 'package:flutter_app/struct/ArticleSummaryStruct.dart';
import 'package:flutter_app/struct/UserInfoStruct.dart';

import 'package:flutter_app/widgets/homepage/ArticleSummary.dart';
import 'package:flutter_app/widgets/homepage/ArticleBottomBar.dart';
import 'package:flutter_app/widgets/homepage/ArticleLikeBar.dart';

class ArticleCard extends StatelessWidget {

  /// 传入的用户信息
  final UserInfoStruct userInfo;

  /// 传入的帖子信息
  final ArticleSummaryStruct articleInfo;

  /// 构造函数
  const ArticleCard({Key key, this.userInfo, this.articleInfo})
      : super(key: key);

  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ArticleSummary(
            title: articleInfo.title,
            summary: articleInfo.summary,
            articleImage: articleInfo.articleImage),
        Row(
          children: <Widget>[
            ArticleBottomBar(
                nickname: userInfo.nickname,
                headerImage: userInfo.headerImage,
                commentNum: articleInfo.commentNum),
            ArticleLikeBar(likeNum: articleInfo.likeNum),
          ],
        ),
      ],
    );
  }
}