import 'package:flutter_app/struct/UserInfoStruct.dart';

/// CommentListStruct数据结构描述信息
class CommentInfoStruct {
  /// 用户的昵称
  final UserInfoStruct userInfo;

  /// 用户头像信息
  final String comment;

  /// 构造函数
  const CommentInfoStruct(this.userInfo, this.comment);
}