import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../common/widgets/show_loading.dart';
import '../../../../core/color_scheme.dart';
import '../../../../services/post_services.dart';
import '../comments_screen.dart';

class CommentField extends StatelessWidget {
  const CommentField({
    super.key,
    required this.textController,
    required this.postId,
    required this.ref,
  });

  final TextEditingController textController;
  final int postId;
  final WidgetRef ref;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textController,
      maxLength: 250,
      decoration: InputDecoration(
        suffixIcon: IconButton(
          onPressed: () async {
            if (textController.text.isEmpty) return;
            showLoaderDialog(context);
            final commentResult = await ref
                .watch(postProvider)
                .addComment(textController.text, postId)
                .whenComplete(() => ref.refresh(commentsProvider(postId)));
            if (context.mounted) {
              Navigator.of(context).pop();
              if (commentResult != null) {
                FocusManager.instance.primaryFocus?.unfocus();
                textController.clear();
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Thêm bình luận không thành công'),
                  ),
                );
              }
            }
          },
          icon: const Icon(
            Icons.send,
            color: userTints4,
          ),
        ),
        hintText: 'Thêm nội dung bình luận...',
      ),
    );
  }
}
