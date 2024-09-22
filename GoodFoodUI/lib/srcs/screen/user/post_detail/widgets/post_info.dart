import 'package:flutter/material.dart';

import '../../../../models/post_detail/post_detail_model.dart';

class PostInfo extends StatelessWidget {
  const PostInfo({
    super.key,
    required this.postDetail,
  });

  final PostDetailModel postDetail;

  @override
  Widget build(BuildContext context) {
    return Text(
      '${postDetail.baiViet.like} Lượt thích, ${postDetail.baiViet.comment} Bình luận',
    );
  }
}
