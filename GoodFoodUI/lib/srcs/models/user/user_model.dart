import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  const factory UserModel({
    required int id,
    String? hoVaTen,
    String? soDienThoai,
    DateTime? ngaySinh,
    String? email,
    String? gioiTinh,
    int? idHinhAnh,
    String? imagePath,
    required int loaiNguoiDung,
    required String token,
    required bool setTag,
  }) = _User;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
