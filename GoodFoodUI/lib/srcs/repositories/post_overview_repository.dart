import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:good_food/srcs/models/post_overview/post_overview_model.dart';
import 'package:good_food/srcs/services/post_services.dart';

class PostOverviewRepository extends StateNotifier<List<PostOverviewModel>> {
  PostOverviewRepository() : super([]);

  Future<List<PostOverviewModel>> getPostoverviews() async {
    state = await PostServices().getPostOverviews();
    return state;
  }

  void updatePostOverviews(postOverviewId, bool isAdd) {
    final postOverviewIndex =
        state.indexWhere((element) => element.id == postOverviewId);
    state[postOverviewIndex] = state[postOverviewIndex]
        .copyWith(like: state[postOverviewIndex].like + (isAdd ? 1 : -1));
  }
}
