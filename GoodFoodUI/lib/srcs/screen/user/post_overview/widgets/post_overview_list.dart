import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../providers/post_provider.dart';
import 'post_overview_item.dart';

class PostOverviewList extends StatefulWidget {
  const PostOverviewList({
    super.key,
  });
  @override
  State<PostOverviewList> createState() => _PostOverviewListState();
}

class _PostOverviewListState extends State<PostOverviewList>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Consumer(
      builder: (context, ref, child) {
        final list = ref.watch(postOverviewRepoProvider);
        return ListView.builder(
          key: widget.key,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return PostOverviewItem(
              postOverviewModel: list[index],
            );
          },
          itemCount: list.length,
        );
      },
    );
  }
}
