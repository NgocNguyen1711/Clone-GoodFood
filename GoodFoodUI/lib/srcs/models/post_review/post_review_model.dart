import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:good_food/srcs/models/dish/dish_model.dart';

part 'post_review_model.freezed.dart';
part 'post_review_model.g.dart';

@freezed
class PostReviewModel with _$PostReviewModel {
  const factory PostReviewModel({
    required int restaurantId,
    required String title,
    required String content,
    required String imagePath,
    required double hygiene,
    required double taste,
    required double space,
    required double price,
    required double service,
    required List<DishModel> dishes,
  }) = _PostReviewModel;

  factory PostReviewModel.fromJson(Map<String, dynamic> json) =>
      _$PostReviewModelFromJson(json);
}
