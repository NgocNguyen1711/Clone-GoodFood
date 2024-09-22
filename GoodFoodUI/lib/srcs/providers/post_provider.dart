import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/post_detail/post_detail_model.dart';
import '../models/post_overview/post_overview_model.dart';
import '../repositories/post_detail_repository.dart';
import '../repositories/post_overview_repository.dart';

final PostDetailRepoProvider =
    StateNotifierProvider<PostDetailRepository, PostDetailModel?>(
  (ref) => PostDetailRepository(),
);

final postOverviewRepoProvider =
    StateNotifierProvider<PostOverviewRepository, List<PostOverviewModel>>(
  (ref) {
    final postOverviewRepo = PostOverviewRepository();
    postOverviewRepo.getPostoverviews();
    return postOverviewRepo;
  },
);
