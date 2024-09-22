import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:good_food/srcs/services/user_services.dart';

import '../models/user/user_model.dart';

class UserModelState extends StateNotifier<UserModel> {
  UserModelState()
      : super(
          const UserModel(id: 0, loaiNguoiDung: -1, token: '', setTag: false),
        );

  Future<UserModel> getUser() async {
    state = await UserServices().getUser() ?? state;
    return state;
  }

  void updateState({
    String? hoVaTen,
    int? idHinhAnh,
    String? imagePath,
    DateTime? ngaySinh,
    String? gioiTinh,
    String? soDienThoai,
    String? email,
  }) {
    state = state.copyWith(
      hoVaTen: hoVaTen ?? state.hoVaTen,
      idHinhAnh: idHinhAnh ?? state.idHinhAnh,
      imagePath: imagePath ?? state.imagePath,
      ngaySinh: ngaySinh ?? state.ngaySinh,
      gioiTinh: gioiTinh ?? state.gioiTinh,
      soDienThoai: soDienThoai ?? state.soDienThoai,
      email: email ?? state.email,
    );
  }
}

final userModelProvider =
    AutoDisposeStateNotifierProvider<UserModelState, UserModel>(
        (ref) => UserModelState());
