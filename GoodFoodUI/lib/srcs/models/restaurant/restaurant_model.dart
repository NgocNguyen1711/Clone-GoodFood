import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:good_food/srcs/models/restaurant/restaurant_type_model.dart';

part 'restaurant_model.freezed.dart';
part 'restaurant_model.g.dart';

@freezed
class RestaurantModel with _$RestaurantModel {
  const factory RestaurantModel({
    required int idQuanAn,
    required String tenQuanAn,
    required String diaChi,
    required String placeId,
    required String gioMoCua,
    required String gioDongCua,
    required String hinhAnh,
    required List<RestaurantTypeModel> theLoai,
    required String soDienThoai,
    required String chatLuong,
    required int idNguoiSoHuu,
    required String? imagePath,
    required int idHinhAnh,
  }) = _RestaurantModel;

  factory RestaurantModel.fromJson(Map<String, dynamic> json) =>
      _$RestaurantModelFromJson(json);

  factory RestaurantModel.empty() => const RestaurantModel(
        idQuanAn: 0,
        tenQuanAn: "",
        diaChi: "",
        placeId: "",
        gioMoCua: "",
        gioDongCua: "",
        hinhAnh: '',
        theLoai: [],
        soDienThoai: '',
        chatLuong: '',
        idNguoiSoHuu: 0,
        imagePath: '',
        idHinhAnh: 0,
      );
}
