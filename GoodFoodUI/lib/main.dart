import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'srcs/common/environment.dart';
import 'srcs/core/app_routes.dart';
import 'srcs/core/app_theme.dart';
import 'srcs/providers/authentication_provider.dart';
import 'srcs/providers/nguoidung_provider.dart';
import 'srcs/screen/restaurant_owner/restaurants_screen/restaurants_screen.dart';
import 'srcs/screen/user/home/user_home.dart';
import 'srcs/screen/user/welcome_screen/welcome_screen.dart';

class GoodFood extends ConsumerWidget {
  const GoodFood({super.key, required this.envType});

  final EnvType envType;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: appTheme,
      home: FutureBuilder(
        future: ref.watch(authenticationProvider).isLoggedIn(),
        builder: (context, snapshot) {
          if (snapshot.data != null) {
            if (snapshot.data!) {
              return FutureBuilder(
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    if (snapshot.data != null) {
                      return envType == EnvType.user
                          ? const UserHomeScreen()
                          : const ROMain();
                    }
                  }
                  return const Scaffold(
                    body: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                },
                future: ref.read(userStateProvider.notifier).getUser(),
              );
            }
            return const WelcomeScreen();
          }
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        },
      ),
      routes: appRoutes,
    );
  }
}

class ROMain extends StatelessWidget {
  const ROMain({super.key});

  @override
  Widget build(BuildContext context) {
    return const RestaurantsScreen();
  }
}
