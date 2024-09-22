import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_overview_model.freezed.dart';
part 'post_overview_model.g.dart';

@freezed
class PostOverviewModel with _$PostOverviewModel {
  const factory PostOverviewModel({
    required int id,
    required String username,
    required int userId,
    required int avatar,
    required String tieuDe,
    required String nhanXet,
    required DateTime thoiGian,
    required int image,
    required int like,
    required int comment,
    required int favorite,
  }) = _PostOverviewModel;

  factory PostOverviewModel.fromJson(Map<String, dynamic> json) =>
      _$PostOverviewModelFromJson(json);
}
