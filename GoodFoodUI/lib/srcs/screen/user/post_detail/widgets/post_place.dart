import 'package:flutter/material.dart';
import 'package:good_food/srcs/core/color_scheme.dart';
import 'package:good_food/srcs/screen/user/view_restaurant/view_restaurant.dart';

import '../../../../models/post_detail/post_detail_model.dart';

class PostPlace extends StatelessWidget {
  const PostPlace({
    super.key,
    required this.postDetail,
  });

  final PostDetailModel postDetail;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.of(context).pushNamed(ViewRestaurantScreen.route,
            arguments: postDetail.quanAnDetail);
      },
      contentPadding: const EdgeInsets.symmetric(horizontal: 0),
      minLeadingWidth: 10,
      horizontalTitleGap: 5,
      leading: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          Icon(
            Icons.place,
            color: userTints4,
          ),
        ],
      ),
      title: Text(
        postDetail.quanAnDetail.tenQuanAn,
        overflow: TextOverflow.ellipsis,
      ),
      subtitle: Text(
        postDetail.quanAnDetail.diaChi,
        overflow: TextOverflow.ellipsis,
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            postDetail.quanAnDetail.chatLuong,
            style: const TextStyle(fontSize: 16),
          ),
          const Icon(
            Icons.star_rate_rounded,
            color: userTints4,
          )
        ],
      ),
    );
  }
}
