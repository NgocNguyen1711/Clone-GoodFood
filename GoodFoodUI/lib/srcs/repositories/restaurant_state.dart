import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/google_location/location_model.dart';
import '../models/restaurant/restaurant_model.dart';
import '../models/restaurant/restaurant_type_model.dart';

class RestaurantNotifier extends StateNotifier<RestaurantModel> {
  final RestaurantModel restaurantModel;
  RestaurantNotifier({required this.restaurantModel})
      : super(
          RestaurantModel(
            idQuanAn: restaurantModel.idQuanAn,
            diaChi: restaurantModel.diaChi,
            placeId: restaurantModel.placeId,
            gioDongCua: restaurantModel.gioDongCua,
            gioMoCua: restaurantModel.gioMoCua,
            hinhAnh: restaurantModel.hinhAnh,
            soDienThoai: restaurantModel.soDienThoai,
            tenQuanAn: restaurantModel.tenQuanAn,
            theLoai: restaurantModel.theLoai,
            chatLuong: restaurantModel.chatLuong,
            idNguoiSoHuu: restaurantModel.idNguoiSoHuu,
            imagePath: restaurantModel.imagePath,
            idHinhAnh: restaurantModel.idHinhAnh,
          ),
        );

  void update({
    String? tenQuanAn,
    LocationModel? locationModel,
    String? gioMoCua,
    String? gioDongCua,
    List<RestaurantTypeModel>? theLoai,
    String? soDienThoai,
    String? hinhAnh,
    String? imagePath,
  }) {
    state = state.copyWith(
      tenQuanAn: tenQuanAn ?? state.tenQuanAn,
      diaChi: locationModel?.description ?? state.diaChi,
      placeId: locationModel?.place_id ?? state.placeId,
      gioMoCua: gioMoCua ?? state.gioMoCua,
      gioDongCua: gioDongCua ?? state.gioDongCua,
      theLoai: theLoai ?? state.theLoai,
      soDienThoai: soDienThoai ?? state.soDienThoai,
      hinhAnh: hinhAnh ?? state.hinhAnh,
      imagePath: imagePath ?? state.imagePath,
    );
  }
}
