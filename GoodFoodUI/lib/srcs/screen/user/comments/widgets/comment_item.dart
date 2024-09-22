import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:good_food/srcs/common/widgets/show_loading.dart';
import 'package:good_food/srcs/services/post_services.dart';
import 'package:intl/intl.dart';

import '../../../../core/app_assets.dart';
import '../../../../core/app_constants.dart';
import '../../../../core/color_scheme.dart';
import '../../../../models/comment/comment_model.dart';
import '../comments_screen.dart';

class CommentItem extends StatelessWidget {
  const CommentItem({
    super.key,
    required this.commentModel,
  });
  final CommentModel commentModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {
        showDeleteButton(context);
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundColor: commonLightGrey,
            backgroundImage: commentModel.idHinhAnh != 0
                ? NetworkImage(
                    '$baseUrl/Image/${commentModel.idHinhAnh}',
                  ) as ImageProvider
                : const AssetImage(tLogoDefault),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(defaultPadding / 2),
                  decoration: BoxDecoration(
                    color: commonLightGrey.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            commentModel.tenNguoiDung.trim(),
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          if (commentModel.isOwnerComment)
                            Container(
                              decoration: BoxDecoration(
                                color: userTints1,
                                borderRadius:
                                    BorderRadius.circular(defaultPadding / 2),
                              ),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: defaultPadding / 2),
                              margin: const EdgeInsets.symmetric(
                                  horizontal: defaultPadding / 2),
                              child: const Text('Chủ quán'),
                            ),
                        ],
                      ),
                      Text(
                        commentModel.noiDung.trim(),
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
                Text(
                  DateFormat('dd-MM-yyyy').format(commentModel.thoiGian),
                  style: const TextStyle(
                    fontSize: 14,
                    color: commonGrey,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<dynamic> showDeleteButton(BuildContext context) {
    return showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8),
        ),
      ),
      context: context,
      builder: (context) => Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Consumer(
            builder: (context, ref, child) => TextButton(
              onPressed: commentModel.isCommented
                  ? () {
                      showLoaderDialog(context);
                      ref
                          .watch(postProvider)
                          .deleteComment(commentModel.id)
                          .whenComplete(() {
                        Navigator.of(context).pop();
                        Navigator.of(context).pop();
                        return ref.refresh(
                          commentsProvider(commentModel.idBaiViet),
                        );
                      });
                    }
                  : null,
              style: ButtonStyle(
                foregroundColor:
                    MaterialStateProperty.resolveWith<Color>((states) {
                  if (states.contains(MaterialState.disabled)) {
                    return Colors.grey;
                  }
                  return Colors.red;
                }),
                minimumSize: const MaterialStatePropertyAll(
                  Size(double.infinity, 50),
                ),
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: defaultPadding),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Xoá bình luận',
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
