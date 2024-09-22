import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:good_food/srcs/core/app_assets.dart';

import '../../../core/app_constants.dart';
import '../../../providers/post_provider.dart';
import '../post_overview/widgets/post_overview_user_info.dart';
import 'widgets/dish_item.dart';
import 'widgets/post_action_bar.dart';
import 'widgets/post_info.dart';
import 'widgets/post_restaurant_page.dart';

class PostDetailScreen extends StatelessWidget {
  static const String route = "/post-detail";
  const PostDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController();
    final postId = ModalRoute.of(context)!.settings.arguments as int;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Bài viết'),
          actions: [
            PopupMenuButton(
              onSelected: (value) {
                // Navigator.of(context).pushNamed(
                //   route[value],
                // );
              },
              itemBuilder: (context) => [
                const PopupMenuItem(
                  value: 0,
                  child: Text('Báo cáo'),
                )
              ],
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: defaultPadding,
          ),
          child: Consumer(
            builder: (context, ref, child) {
              return FutureBuilder(
                future: ref
                    .watch(PostDetailRepoProvider.notifier)
                    .getPostDetail(postId),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    if (snapshot.data != null) {
                      final postDetail = snapshot.data!;
                      return Column(
                        children: [
                          PostUserInfo(
                            userId: postDetail.nguoiDung.id,
                            isOverview: false,
                            avatar: postDetail.nguoiDung.idHinhAnh != 0
                                ? NetworkImage(
                                    '$baseUrl/Image/${postDetail.nguoiDung.idHinhAnh}',
                                  ) as ImageProvider
                                : const AssetImage(tLogoDefault),
                            username: postDetail.nguoiDung.hoVaTen != null
                                ? postDetail.nguoiDung.hoVaTen!
                                : 'user${postDetail.nguoiDung.id}',
                            time: postDetail.baiViet.thoiGian,
                          ),
                          Expanded(
                            // flex: 1,
                            child: PageView(
                              controller: controller,
                              children: [
                                PostRestaurantPage(postDetail: postDetail),
                                ...postDetail.monAn
                                    .map((dish) => DishItem(dish: dish))
                                    .toList(),
                              ],
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              PostInfo(postDetail: postDetail),
                              PostActionBar(
                                postDetail: postDetail,
                              ),
                            ],
                          ),
                        ],
                      );
                    }
                  }
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
