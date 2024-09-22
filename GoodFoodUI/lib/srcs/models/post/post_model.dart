import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_model.freezed.dart';
part 'post_model.g.dart';

@freezed
class PostModel with _$PostModel {
  const factory PostModel({
    required int id,
    required String tieuDe,
    required String nhanXet,
    required DateTime thoiGian,
    required int idHinhAnhQuanAn,
    required int idQuanAn,
    required int idNguoiDung,
    required double veSinh,
    required double huongVi,
    required double khongGian,
    required double giaCa,
    required double phucVu,
    required int like,
    required int favorite,
    required int comment,
  }) = _PostModel;

  factory PostModel.fromJson(Map<String, dynamic> json) =>
      _$PostModelFromJson(json);
}
