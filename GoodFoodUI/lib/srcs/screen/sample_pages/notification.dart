import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:good_food/srcs/common/widgets/drawer.dart';
import 'package:good_food/srcs/providers/authentication_provider.dart';
import 'package:good_food/srcs/screen/user/welcome_screen/welcome_screen.dart';

class LogoutScreen extends StatelessWidget {
  static String route = 'logout';
  const LogoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Notification')),
      drawer: const GoodFoodUserDrawer(),
      body: Center(
        child: Consumer(
          builder: (context, ref, child) {
            return ElevatedButton(
              onPressed: () {
                ref.read(authenticationProvider).signOut();
                Navigator.of(context).pushReplacementNamed(WelcomeScreen.route);
              },
              child: const Text('Sign Out'),
            );
          },
        ),
      ),
    );
  }
}
