import 'package:freezed_annotation/freezed_annotation.dart';

part 'dish_model.freezed.dart';
part 'dish_model.g.dart';

@freezed
class DishModel with _$DishModel {
  const factory DishModel({
    required int id,
    required String tenMon,
    required int giaTien,
    required int idQuanAn,
    required int idHinhAnh,
    required String nhanXet,
    required String imagePath,
  }) = _DishModel;

  factory DishModel.fromJson(Map<String, dynamic> json) =>
      _$DishModelFromJson(json);
}
