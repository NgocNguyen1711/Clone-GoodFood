import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/dish/dish_model.dart';
import '../models/post_review/post_review_model.dart';

class PostReviewModelState extends StateNotifier<PostReviewModel> {
  PostReviewModelState()
      : super(
          const PostReviewModel(
            restaurantId: 0,
            title: "",
            content: "",
            imagePath: "",
            hygiene: 0,
            taste: 0,
            space: 0,
            price: 0,
            service: 0,
            dishes: [],
          ),
        );
  void updateState({
    int? restaurantId,
    String? title,
    String? content,
    String? imagePath,
    double? hygiene,
    double? taste,
    double? space,
    double? price,
    double? service,
    List<DishModel>? dishes,
  }) {
    state = state.copyWith(
        restaurantId: restaurantId ?? state.restaurantId,
        title: title ?? state.title,
        content: content ?? state.content,
        imagePath: imagePath ?? state.imagePath,
        hygiene: hygiene ?? state.hygiene,
        taste: taste ?? state.taste,
        space: space ?? state.space,
        price: price ?? state.price,
        service: service ?? state.service,
        dishes: dishes ?? state.dishes);
  }
}

final postReviewModelStateProvider =
    AutoDisposeStateNotifierProvider<PostReviewModelState, PostReviewModel>(
        (ref) => PostReviewModelState());
