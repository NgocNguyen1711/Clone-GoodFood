import 'package:freezed_annotation/freezed_annotation.dart';

part 'restaurant_type_model.freezed.dart';
part 'restaurant_type_model.g.dart';

@freezed
class RestaurantTypeModel with _$RestaurantTypeModel {
  const factory RestaurantTypeModel({
    required int id,
    required String tenTheLoai,
  }) = _RestaurantTypeModel;

  factory RestaurantTypeModel.fromJson(Map<String, dynamic> json) =>
      _$RestaurantTypeModelFromJson(json);
}
