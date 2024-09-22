import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:good_food/srcs/core/app_constants.dart';

import '../../../models/comment/comment_model.dart';
import '../../../services/post_services.dart';
import 'widgets/comment_field.dart';
import 'widgets/comment_item.dart';

final commentsProvider = FutureProvider.family<List<CommentModel>, int>(
    (ref, postId) => ref.watch(postProvider).getCommentByPostId(postId));

class CommentsScreen extends StatelessWidget {
  static const String route = '/post/comments';
  const CommentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final postId = ModalRoute.of(context)!.settings.arguments as int;
    final textController = TextEditingController();

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Bình luận'),
        ),
        body: Consumer(
          builder: (context, ref, child) {
            final comments = ref.watch(commentsProvider(postId));
            return comments.when(
                data: (data) => RefreshIndicator(
                      onRefresh: () async {
                        return await ref.refresh(commentsProvider(postId));
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: defaultPadding,
                          vertical: defaultPadding / 2,
                        ),
                        child: Column(
                          children: [
                            Expanded(
                              child: ListView.builder(
                                // shrinkWrap: true,
                                // reverse: true,
                                itemCount: data.length,
                                itemBuilder: (context, index) => CommentItem(
                                  commentModel: data[index],
                                ),
                              ),
                            ),
                            CommentField(
                              textController: textController,
                              postId: postId,
                              ref: ref,
                            )
                          ],
                        ),
                      ),
                    ),
                error: (e, s) => Text(e.toString()),
                loading: () =>
                    const Center(child: CircularProgressIndicator()));
          },
        ),
      ),
    );
  }
}
