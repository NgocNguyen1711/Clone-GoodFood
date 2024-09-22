import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/post_detail/post_detail_model.dart';
import '../services/post_services.dart';

class PostDetailRepository extends StateNotifier<PostDetailModel?> {
  PostDetailRepository() : super(null);

  Future<PostDetailModel?> getPostDetail(postId) async {
    state = await PostServices().getPostDetail(postId);
    return state;
  }

  PostDetailModel? updateState(bool isLiked) {
    return state?.copyWith(isLiked: isLiked);
  }

  Future<void> addLike(int postId) async {
    await PostServices().addLike(postId);
    await getPostDetail(postId);
  }

  Future<void> removeLike(int postId) async {
    await PostServices().removeLike(postId);
    await getPostDetail(postId);
  }
}
