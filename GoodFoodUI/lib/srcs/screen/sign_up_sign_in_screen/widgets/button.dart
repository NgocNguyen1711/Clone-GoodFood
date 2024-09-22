import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:good_food/srcs/common/widgets/goodfood_button.dart';

import '../../../providers/authentication_provider.dart';
import '../../../providers/nguoidung_provider.dart';
import '../../../providers/user_provider.dart';
import '../../choose_tags_screen/choose_tags_screen.dart';
import '../../user/home/user_home.dart';
import '../sign_in_screen.dart';

class Button extends ConsumerWidget {
  final bool isSignUpScreen;
  final String text;

  const Button(this.isSignUpScreen, this.text, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.only(top: 100),
      child: GoodfoodPrimaryButton(
        onPressed: () async {
          var formKey = isSignUpScreen
              ? ref.watch(formKeySignUp)
              : ref.watch(formKeySignIn);
          if (formKey.currentState!.validate()) {
            if (isSignUpScreen) {
              final signInResult =
                  await ref.read(authenticationProvider).signUp(
                        userEmail: ref.watch(signUpEmail).text.trim(),
                        password: ref.watch(signUpPassword).text.trim(),
                      );
              if (signInResult) {
                if (context.mounted) {
                  Navigator.of(context)
                      .pushReplacementNamed(SignInScreen.route);
                }
              }
            } else {
              final user = await ref.read(authenticationProvider).signIn(
                    userEmail: ref.watch(signInPhone).text.trim(),
                    password: ref.watch(signInPassword).text.trim(),
                  );
              ref.read(userProvider.notifier).setUser(user);
              ref.read(userStateProvider.notifier).getUser();
              if (ref.watch(userProvider) != null) {
                if (context.mounted) {
                  final user = ref.watch(userProvider);
                  if (user!.setTag) {
                    Navigator.of(context)
                        .pushReplacementNamed(UserHomeScreen.route);
                  } else {
                    Navigator.of(context)
                        .pushReplacementNamed(ChooseTagsScreen.route);
                  }
                }
              }
            }
          }
        },
        child: Text(
          text,
          style: const TextStyle(
            // color: user1,
            fontSize: 17,
            fontFamily: 'OpenSans',
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
