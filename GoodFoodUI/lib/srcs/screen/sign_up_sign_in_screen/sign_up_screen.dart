import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:good_food/srcs/core/app_constants.dart';

import '../../providers/authentication_provider.dart';
import '/srcs/core/app_assets.dart';
import 'widgets/custom_text_form_field.dart';
import 'widgets/button.dart';
import 'widgets/final_line.dart';
import './sign_in_screen.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                Consumer(
                  builder: (context, ref, child) => Form(
                    key: ref.watch(formKeySignUp),
                    child: Container(
                      margin: const EdgeInsets.all(15),
                      height: 500,
                      child: Column(
                        children: [
                          CustomTextFormField(
                            controller: ref.watch(signUpEmail),
                            isEmail: true,
                            labelValue: 'Tên đăng nhập',
                          ),
                          CustomTextFormField(
                            controller: ref.watch(signUpPassword),
                            labelValue: 'Mật khẩu',
                            isPassword: true,
                          ),
                          CustomTextFormField(
                            controller: ref.watch(confirmPassword),
                            labelValue: 'Xác nhận mật khẩu',
                            isPassword: true,
                            isConfirmPassword: true,
                          ),
                          const SizedBox(
                            height: 22,
                          ),
                          const Button(
                            true,
                            'Đăng ký',
                          ),
                          const FinalLine(
                            'Đã có tài khoản? ',
                            'Đăng nhập',
                            SignInScreen(),
                          ),
                        ],
                      ),
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
