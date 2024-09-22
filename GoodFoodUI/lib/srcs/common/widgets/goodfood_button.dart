import 'package:flutter/material.dart';
import '../../core/color_scheme.dart';
import '../../screen/sign_up_sign_in_screen/sign_in_screen.dart';

class GoodfoodPrimaryButton extends StatelessWidget {
  const GoodfoodPrimaryButton({
    Key? key,
    required this.child,
    required this.onPressed,
  }) : super(key: key);
  final VoidCallback onPressed;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          textStyle: const MaterialStatePropertyAll(
            TextStyle(
              fontSize: 20,
            ),
          ),
          minimumSize: const MaterialStatePropertyAll(
            Size(double.infinity, 50),
          ),
          elevation: MaterialStateProperty.all(0.0),
          foregroundColor: const MaterialStatePropertyAll(
            commonDark,
          ),
          backgroundColor: MaterialStatePropertyAll(
            userTints4.withOpacity(0.7),
          ),
        ),
        child: child);
  }
}

class GoodfoodSecondaryButton extends StatelessWidget {
  const GoodfoodSecondaryButton({
    Key? key,
    required this.child,
    required this.onPressed,
  }) : super(key: key);
  final VoidCallback onPressed;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        textStyle: const MaterialStatePropertyAll(
          TextStyle(
            fontSize: 20,
          ),
        ),
        minimumSize: const MaterialStatePropertyAll(
          Size(double.infinity, 50),
        ),
        elevation: MaterialStateProperty.all(0.0),
        foregroundColor: const MaterialStatePropertyAll(
          commonDark,
        ),
        backgroundColor: const MaterialStatePropertyAll(
          commonLightGrey,
        ),
      ),
      child: child,
    );
  }
}

class GoodfoodOutlinedButton extends StatelessWidget {
  const GoodfoodOutlinedButton({
    super.key,
    required this.child,
    required this.onPressed,
  });
  final VoidCallback onPressed;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: const ButtonStyle(),
      onPressed: onPressed,
      child: child,
    );
  }
}

class OutlinedButton1 extends StatelessWidget {
  const OutlinedButton1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {
        Navigator.pop(context);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const SignInScreen()),
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
    );
  }
}
