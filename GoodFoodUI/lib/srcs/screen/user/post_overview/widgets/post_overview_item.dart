import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:good_food/srcs/core/app_assets.dart';
import 'package:good_food/srcs/core/app_constants.dart';
import 'package:good_food/srcs/screen/user/post_detail/post_detail_screen.dart';

import '../../../../models/post_overview/post_overview_model.dart';
import '/srcs/core/color_scheme.dart';
import 'post_overview_icon_bar.dart';
import 'post_overview_image.dart';
import 'post_overview_title.dart';
import 'post_overview_user_info.dart';

class PostOverviewItem extends StatelessWidget {
  const PostOverviewItem(
      {super.key, required PostOverviewModel postOverviewModel})
      : _postOverviewModel = postOverviewModel;
  final PostOverviewModel _postOverviewModel;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) => GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed(
            PostDetailScreen.route,
            arguments: _postOverviewModel.id,
          );
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          key: Key(_postOverviewModel.id.toString()),
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: commonLightGrey,
                width: 1,
              ),
            ),
          ),
          child: Column(
            children: [
              PostUserInfo(
                userId: _postOverviewModel.userId,
                isOverview: true,
                username: _postOverviewModel.username.isNotEmpty
                    ? _postOverviewModel.username
                    : 'user${_postOverviewModel.userId}',
                avatar: _postOverviewModel.avatar != 0
                    ? NetworkImage(
                        '$baseUrl/Image/${_postOverviewModel.avatar.toString()}',
                      ) as ImageProvider
                    : const AssetImage(tLogoDefault),
                time: _postOverviewModel.thoiGian,
              ),
              PostOverviewImage(
                imageUrl:
                    '$baseUrl/Image/${_postOverviewModel.image.toString()}',
              ),
              PostTitle(title: _postOverviewModel.tieuDe),
              PostOverviewIconBar(
                like: _postOverviewModel.like,
                comment: _postOverviewModel.comment,
                favorite: _postOverviewModel.favorite,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
