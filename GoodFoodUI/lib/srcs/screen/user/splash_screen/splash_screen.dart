import 'package:flutter/material.dart';
import 'package:good_food/srcs/core/app_assets.dart';
import 'package:good_food/srcs/screen/user/home/user_home.dart';
import '../../../core/color_scheme.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    startAnimation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Image(
                image: AssetImage(tLogo),
              ),
            ],
          ),
          const SizedBox(
            height: 50,
          ),
          const Text(
            'Good Food for Good Moment',
            style: TextStyle(
              color: user1,
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }

  Future startAnimation() async {
    await Future.delayed(const Duration(milliseconds: 5000));
    if (context.mounted) {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const UserHomeScreen()));
    }
  }
}
