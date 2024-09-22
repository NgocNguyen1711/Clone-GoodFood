import 'package:freezed_annotation/freezed_annotation.dart';

import '../dish/dish_model.dart';
import '../post/post_model.dart';
import '../restaurant/restaurant_model.dart';
import '../user/user_model.dart';

part 'post_detail_model.freezed.dart';
part 'post_detail_model.g.dart';

@freezed
class PostDetailModel with _$PostDetailModel {
  const factory PostDetailModel({
    required PostModel baiViet,
    required RestaurantModel quanAnDetail,
    required UserModel nguoiDung,
    required List<DishModel> monAn,
    required bool isLiked,
  }) = _PostDetailModel;

  factory PostDetailModel.fromJson(Map<String, dynamic> json) =>
      _$PostDetailModelFromJson(json);
}
