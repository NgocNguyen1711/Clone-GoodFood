import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:good_food/srcs/common/widgets/goodfood_button.dart';
import 'package:good_food/srcs/core/app_constants.dart';
import 'package:good_food/srcs/core/color_scheme.dart';
import 'package:good_food/srcs/providers/authentication_provider.dart';

import '../welcome_screen/welcome_screen.dart';
import 'widgets/password_input_field.dart';

class ChangePasswordScreen extends ConsumerWidget {
  static const String route = 'change-password';
  ChangePasswordScreen({super.key});

  final formkey = GlobalKey<FormState>();

  final Map<String, TextEditingController> passwordControllers = {
    'current': TextEditingController(),
    'new': TextEditingController(),
    'duplicate': TextEditingController(),
  };

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Đổi mật khẩu'),
        ),
        body: Form(
          key: formkey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: defaultPadding / 2),
                    child: Text(
                      'Mật khẩu của bạn phải có ít nhất 8 ký tự,'
                      ' bao gồm chữ cái thường, chữ cái in hoa, chữ số và ký tự đặc biệt (!\$@%).',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  PasswordInputField(
                    controllers: passwordControllers,
                    controllerKey: 'current',
                    label: const Text('Mật khẩu hiện tại'),
                  ),
                  PasswordInputField(
                    controllers: passwordControllers,
                    controllerKey: 'new',
                    label: const Text('Mật khẩu mới'),
                  ),
                  PasswordInputField(
                    controllers: passwordControllers,
                    controllerKey: 'duplicate',
                    label: const Text('Nhập lại mật khẩu mới'),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: defaultPadding / 2),
                    child: GoodfoodPrimaryButton(
                      onPressed: () async {
                        FocusManager.instance.primaryFocus?.unfocus();
                        if (formkey.currentState!.validate()) {
                          final result = await ref
                              .watch(authenticationProvider)
                              .changePassword(
                                passwordControllers['current']!.text,
                                passwordControllers['new']!.text,
                              );
                          if (context.mounted) {
                            showDialog(
                              barrierDismissible: false,
                              context: context,
                              builder: (context) => AlertDialog(
                                actionsAlignment: MainAxisAlignment.center,
                                content: Text(
                                  result
                                      ? 'Đổi mật khẩu thành công \n'
                                          'Đăng nhập lại để tiếp tục sử dụng'
                                      : 'Đổi mật khẩu không thành công',
                                  textAlign: TextAlign.center,
                                ),
                                actions: [
                                  ElevatedButton(
                                    style: const ButtonStyle(
                                      backgroundColor:
                                          MaterialStatePropertyAll(userTints4),
                                      foregroundColor:
                                          MaterialStatePropertyAll(commonDark),
                                    ),
                                    onPressed: result
                                        ? () {
                                            ref
                                                .read(authenticationProvider)
                                                .signOut();
                                            Navigator.of(context)
                                                .pushReplacementNamed(
                                                    WelcomeScreen.route);
                                          }
                                        : () {
                                            Navigator.of(context).pop();
                                          },
                                    child: const Text('OK'),
                                  )
                                ],
                              ),
                            );
                          }
                        }
                      },
                      child: const Text('Cập nhật'),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
