import 'package:freezed_annotation/freezed_annotation.dart';

part 'comment_model.freezed.dart';
part 'comment_model.g.dart';

@freezed
class CommentModel with _$CommentModel {
  const factory CommentModel({
    required int id,
    required DateTime thoiGian,
    required String noiDung,
    required int idBaiViet,
    required int idNguoiDung,
    required String tenNguoiDung,
    required int idHinhAnh,
    required bool isCommented,
    required bool isOwnerComment,
  }) = _CommentModel;

  factory CommentModel.fromJson(Map<String, dynamic> json) =>
      _$CommentModelFromJson(json);
}
