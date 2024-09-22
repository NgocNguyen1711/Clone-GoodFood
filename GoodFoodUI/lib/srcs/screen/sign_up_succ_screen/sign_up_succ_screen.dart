import 'package:flutter/material.dart';
import '../../core/app_assets.dart';
import '../../core/app_constants.dart';
import '../choose_tags_screen/choose_tags_screen.dart';

class SignUpSuccScreen extends StatelessWidget {
  const SignUpSuccScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.fromLTRB(0, 100, 0, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Image(
              fit: BoxFit.contain,
              // width: double.infinity,
              image: AssetImage(
                tSignUpSucc,
              ),
            ),
            const Text(
              'Đăng ký thành công!',
              style: TextStyle(
                fontFamily: 'OpenSans',
                fontSize: 28,
                fontWeight: FontWeight.w500,
                color: Color.fromRGBO(205, 160, 39, 1),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ChooseTagsScreen()),
                  );
                },
                child: const Text(
                  'Bắt đầu',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
