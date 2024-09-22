import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:good_food/srcs/core/app_constants.dart';
import 'package:good_food/srcs/core/color_scheme.dart';
import 'package:good_food/srcs/screen/user/change_password/change_password.dart';

import '../../../providers/authentication_provider.dart';
import '../welcome_screen/welcome_screen.dart';

class SettingScreen extends ConsumerWidget {
  static const String route = 'setting';
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Cài đặt'),
        ),
        body: Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: TextButton(
                style: const ButtonStyle(
                  fixedSize: MaterialStatePropertyAll(Size.fromHeight(60)),
                  overlayColor: MaterialStatePropertyAll(commonLightGrey),
                  foregroundColor: MaterialStatePropertyAll(commonDark),
                  textStyle: MaterialStatePropertyAll(TextStyle(fontSize: 18)),
                ),
                onPressed: () {
                  Navigator.of(context).pushNamed(ChangePasswordScreen.route);
                },
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: defaultPadding),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: const [
                      Icon(Icons.lock_outline_rounded),
                      SizedBox(width: defaultPadding),
                      Text('Đổi mật khẩu'),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: TextButton(
                style: const ButtonStyle(
                  fixedSize: MaterialStatePropertyAll(Size.fromHeight(60)),
                  overlayColor: MaterialStatePropertyAll(commonLightGrey),
                  foregroundColor: MaterialStatePropertyAll(commonDark),
                  textStyle: MaterialStatePropertyAll(TextStyle(fontSize: 18)),
                ),
                onPressed: () {
                  ref.read(authenticationProvider).signOut();
                  Navigator.of(context)
                      .pushReplacementNamed(WelcomeScreen.route);
                },
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: defaultPadding),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: const [
                      Icon(Icons.logout_rounded),
                      SizedBox(width: defaultPadding),
                      Text('Đăng xuất'),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
