import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:good_food/srcs/models/nguoidung.dart';
import 'package:good_food/srcs/repositories/nguoidung_repository.dart';

import '../models/user/user_model.dart';
import '../services/user_services.dart';

final nguoiDungRepositoryProvider =
    Provider<INguoiDungRepository>((ref) => NguoiDungRepository());

final nguoiDungDetails =
    FutureProvider.autoDispose<NguoiDungResponse>((ref) async {
  final repository = ref.watch(nguoiDungRepositoryProvider);

  return repository.fetchUserDetails();
});

final userTagsProvider = FutureProvider.family<void, List<int>>(
    (ref, tags) => ref.watch(userProvider).setUserTags(tags));

class UserModelState extends StateNotifier<UserModel?> {
  UserModelState() : super(null);

  Future<UserModel?> getUser() async {
    state = await UserServices().getUser();
    return state;
  }
}

final userStateProvider = StateNotifierProvider<UserModelState, UserModel?>(
    (ref) => UserModelState());
