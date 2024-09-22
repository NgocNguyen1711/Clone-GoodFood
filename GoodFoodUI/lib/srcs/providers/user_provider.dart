import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:good_food/srcs/models/user/user_model.dart';

// final userProvider = StateProvider<User?>((ref) => null);

final userProvider =
    StateNotifierProvider<UserNotifier, UserModel?>((ref) => UserNotifier());

class UserNotifier extends StateNotifier<UserModel?> {
  UserNotifier() : super(null);

  void setUser(UserModel? user) {
    state = user;
  }
}
