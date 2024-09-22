import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/authentication_provider.dart';

class ValidateServices {
  bool isNotNull(String? value) {
    if (value == null || value.isEmpty) {
      return false;
    }
    return true;
  }

  String? isValidEmail(String? email) {
    // final emailRegExp = RegExp(r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+');
    return isNotNull(email)
        ? null
        // ? (emailRegExp.hasMatch(email!) ? null : 'Email không hợp lệ')
        : 'Trường không được để trống';
  }

  String? isValidName(String? name) {
    final nameRegExp =
        RegExp(r"^\s*([A-Za-z]{1,}([\.,] |[-']| ))+[A-Za-z]+\.?\s*$");
    return isNotNull(name)
        ? (nameRegExp.hasMatch(name!) ? null : 'Tên không hợp lệ')
        : 'Trường không được để trống';
  }

  String? isValidPassword(String? password) {
    final passwordRegExp =
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
    return isNotNull(password)
        ? (passwordRegExp.hasMatch(password!) ? null : 'Mật khẩu không hợp lệ')
        : 'Trường không được để trống';
  }

  String? Function(String?) isValidConfirmPassword(WidgetRef ref) =>
      (String? value) {
        final password = ref.watch(signUpPassword).text;
        final confirmPassword1 = ref.watch(confirmPassword).text;
        if (!isNotNull(confirmPassword1)) return 'Trường không được để trống';
        if (confirmPassword1 == password) return null;
        return 'Mật khẩu xác nhận chưa đúng';
      };

  String? isValidPhone(String? phone) {
    final phoneRegExp = RegExp(r'^\+?0[0-9]{9}$');
    return isNotNull(phone)
        ? (phoneRegExp.hasMatch(phone!) ? null : 'Số điện thoại không hợp lệ')
        : 'Trường không được để trống';
  }
}
