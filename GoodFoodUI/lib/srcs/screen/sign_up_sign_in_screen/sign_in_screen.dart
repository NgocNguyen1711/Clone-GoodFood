import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:good_food/srcs/core/app_constants.dart';

import '../../providers/authentication_provider.dart';
import '/srcs/core/app_assets.dart';
import 'widgets/custom_text_form_field.dart';
import 'widgets/forget_password.dart';
import 'widgets/button.dart';
import 'widgets/final_line.dart';
import './sign_up_screen.dart';

class SignInScreen extends ConsumerWidget {
  static const String route = '/sign-in';
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: defaultPadding),
                  child: Image(image: AssetImage(tLogo)),
                ),
                Form(
                  key: ref.watch(formKeySignIn),
                  child: Container(
                    margin: const EdgeInsets.all(15),
                    height: 500,
                    child: Column(
                      children: [
                        CustomTextFormField(
                          controller: ref.watch(signInPhone),
                          labelValue: 'Tên đăng nhập',
                          isEmail: true,
                        ),
                        Container(
                          padding: const EdgeInsets.only(top: 10),
                          child: CustomTextFormField(
                            controller: ref.watch(signInPassword),
                            labelValue: 'Mật khẩu',
                            isPassword: true,
                          ),
                        ),
                        const ForgetPassword(),
                        const Button(
                          false,
                          'Đăng nhập',
                        ),
                        const FinalLine(
                          'Chưa có tài khoản? ',
                          'Đăng ký',
                          SignUpScreen(),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
