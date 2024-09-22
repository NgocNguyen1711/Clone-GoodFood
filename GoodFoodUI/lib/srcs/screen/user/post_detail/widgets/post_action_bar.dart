import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:good_food/srcs/services/bookmark_services.dart';

import '../../../../common/widgets/show_loading.dart';
import '../../../../core/color_scheme.dart';
import '../../../../models/post_detail/post_detail_model.dart';
import '../../../../providers/post_provider.dart';
import '../../comments/comments_screen.dart';
import 'post_action_button.dart';

class PostActionBar extends StatelessWidget {
  const PostActionBar({
    super.key,
    required this.postDetail,
  });
  final PostDetailModel postDetail;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 2,
            child: Consumer(
              builder: (context, ref, child) {
                final postDetailRepoRef =
                    ref.watch(PostDetailRepoProvider.notifier);
                final postDetailModel = ref.watch(PostDetailRepoProvider)!;
                return PostActionButton(
                  color: defaultScaffold,
                  label: const Text('Thích'),
                  icon: postDetailModel.isLiked
                      ? const Icon(Icons.favorite_rounded, color: Colors.red)
                      : const Icon(Icons.favorite_outline_rounded),
                  onTap: () async {
                    showLoaderDialog(context);
                    postDetailModel.isLiked
                        ? await postDetailRepoRef
                            .removeLike(postDetail.baiViet.id)
                        : await postDetailRepoRef
                            .addLike(postDetail.baiViet.id);
                    await ref
                        .watch(postOverviewRepoProvider.notifier)
                        .getPostoverviews();
                    await postDetailRepoRef
                        .getPostDetail(postDetail.baiViet.id);
                    if (context.mounted) {
                      Navigator.of(context).pop();
                    }
                  },
                );
              },
            ),
          ),
          Expanded(
            flex: 3,
            child: PostActionButton(
              color: defaultScaffold,
              label: const Text('Bình luận'),
              icon: const Icon(Icons.mode_comment_outlined),
              onTap: () {
                Navigator.of(context).pushNamed(CommentsScreen.route,
                    arguments: postDetail.baiViet.id);
              },
            ),
          ),
          Expanded(
            flex: 2,
            child: PostActionButton(
              color: defaultScaffold,
              label: const Text('Lưu'),
              icon: const Icon(Icons.bookmark_outline_rounded),
              onTap: () {
                ref.refresh(bookmarkProvider).addPost(postDetail.baiViet.id);
              },
            ),
          ),
        ],
      ),
    );
  }
}
