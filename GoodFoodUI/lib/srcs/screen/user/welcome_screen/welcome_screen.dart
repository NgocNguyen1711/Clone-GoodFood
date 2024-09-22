import 'package:flutter/material.dart';
import 'package:good_food/srcs/core/color_scheme.dart';
import 'package:good_food/srcs/core/app_assets.dart';

import '/srcs/screen/sign_up_sign_in_screen/sign_in_screen.dart';
import '/srcs/screen/sign_up_sign_in_screen/sign_up_screen.dart';

class WelcomeScreen extends StatelessWidget {
  static const String route = "/welcome";
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    String sOnboarding1 = 'Đăng tải và chia sẻ trải nghiệm';
    // String sOnboarding2 = 'Lưu lại các bài viết và nhà hàng muốn đến';
    // String sOnboarding3 = 'Khám phá các địa điểm ăn uống mới';
    // Color cOnboarding1 = const Color.fromRGBO(255, 238, 193, 1.0);
    // Color cOnboarding2 = const Color.fromRGBO(255, 238, 193, 1.0);
    // Color cOnboarding3 = const Color.fromRGBO(255, 191, 174, 1.0);

    return Scaffold(
      backgroundColor: userTints8,
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          children: [
            Image(
              image: const AssetImage(tOnboarding1),
              height: height * 0.6,
            ),
            Text(
              sOnboarding1,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignInScreen(),
                        ),
                      );
                    },
                    style: OutlinedButton.styleFrom(
                      fixedSize: const Size(double.infinity, 40),
                      shape: const RoundedRectangleBorder(),
                      foregroundColor: user1,
                      side: const BorderSide(color: user1),
                    ),
                    child: const Text(
                      'Đăng nhập',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignUpScreen(),
                        ),
                      );
                    },
                    style: OutlinedButton.styleFrom(
                      fixedSize: const Size(double.infinity, 40),
                      elevation: 0,
                      shape: const RoundedRectangleBorder(),
                      foregroundColor: userTints8,
                      backgroundColor: user1.withOpacity(0.7),
                    ),
                    child: const Text(
                      'Đăng ký',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
