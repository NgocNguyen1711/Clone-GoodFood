import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../core/app_constants.dart';
import '../../../../models/post_detail/post_detail_model.dart';
import '../../post_overview/widgets/post_overview_image.dart';
import '../../post_overview/widgets/post_overview_title.dart';
import 'post_content.dart';
import 'post_place.dart';

class PostRestaurantPage extends StatelessWidget {
  const PostRestaurantPage({
    super.key,
    required this.postDetail,
  });

  final PostDetailModel postDetail;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  return Dialog(
                    insetPadding: const EdgeInsets.symmetric(horizontal: 0),
                    child: InteractiveViewer(
                      maxScale: 2.0,
                      child: CachedNetworkImage(
                        imageUrl:
                            '$baseUrl/Image/${postDetail.baiViet.idHinhAnhQuanAn}',
                        imageBuilder: (context, imageProvider) => Image(
                            width: double.infinity,
                            fit: BoxFit.contain,
                            image: imageProvider),
                        placeholder: (context, url) =>
                            const CircularProgressIndicator(),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      ),
                    ),
                  );
                },
              );
            },
            child: PostOverviewImage(
              imageUrl: '$baseUrl/Image/${postDetail.baiViet.idHinhAnhQuanAn}',
            ),
          ),
          PostTitle(title: postDetail.baiViet.tieuDe),
          PostContent(content: postDetail.baiViet.nhanXet),
          PostPlace(
            postDetail: postDetail,
          ),
        ],
      ),
    );
  }
}
