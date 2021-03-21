import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_app/Model/like_num_model.dart';
import 'package:flutter_app/syles/TextStyles.dart';

/// 帖子详情页的赞组件
///
/// 包括点赞组件 icon ，以及组件点击效果
/// 需要外部参数[likeNum],点赞数量
class ArticleDetailLike extends StatelessWidget {
  /// 有状态类返回组件信息
  @override
  Widget build(BuildContext context) {
    final likeNumModel = Provider.of<LikeNumModel>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        FlatButton(
          child: Icon(Icons.thumb_up, color: Colors.grey, size: 40),
          onPressed: () => likeNumModel.like(),
        ),
        Text(
          '${likeNumModel.value}',
          style: TextStyles.commonStyle(),
        ),
      ],
    );
  }
}