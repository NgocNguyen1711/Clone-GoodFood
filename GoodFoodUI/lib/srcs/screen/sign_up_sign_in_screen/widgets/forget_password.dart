import 'package:flutter/material.dart';
import '/srcs/core/color_scheme.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        SizedBox(
          height: 35,
          child: TextButton(
            child: const Text(
              'Quên mật khẩu',
              style: TextStyle(
                color: user1,
                fontSize: 15,
                fontFamily: 'OpenSans',
                fontWeight: FontWeight.w500,
              ),
            ),
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}
