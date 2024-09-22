import 'package:freezed_annotation/freezed_annotation.dart';

import '../post/post_model.dart';
import '../restaurant/restaurant_model.dart';

part 'user_bookmark.freezed.dart';
part 'user_bookmark.g.dart';

@freezed
class UserBookmarkModel with _$UserBookmarkModel {
  const factory UserBookmarkModel({
    required int id,
    required int idNguoiDung,
    required List<PostModel> baiViet,
    required List<RestaurantModel> quanAn,
  }) = _UserBookmarkModel;

  factory UserBookmarkModel.fromJson(Map<String, dynamic> json) =>
      _$UserBookmarkModelFromJson(json);
}
