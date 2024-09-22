import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:good_food/srcs/screen/user/post_detail/post_detail_screen.dart';

import '../../../../core/app_constants.dart';
import '../../../../models/post_overview/post_overview_model.dart';

class UserPosts extends StatelessWidget {
  const UserPosts({
    super.key,
    required this.posts,
  });

  final List<PostOverviewModel> posts;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: defaultPadding / 2),
      child: GridView.builder(
        physics: const ScrollPhysics(),
        itemCount: posts.length,
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: defaultPadding,
          crossAxisSpacing: defaultPadding,
        ),
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            Navigator.of(context)
                .pushNamed(PostDetailScreen.route, arguments: posts[index].id);
          },
          child: GridTile(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: CachedNetworkImage(
                    imageUrl: '$baseUrl/Image/${posts[index].image}',
                    imageBuilder: (context, imageProvider) => ClipRRect(
                      borderRadius: BorderRadius.circular(defaultPadding / 2),
                      child: Image(
                          width: double.infinity,
                          fit: BoxFit.cover,
                          image: imageProvider),
                    ),
                    placeholder: (context, url) =>
                        const Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                ),
                const SizedBox(
                  height: defaultPadding / 2,
                ),
                Text(
                  posts[index].tieuDe,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
