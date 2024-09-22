import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:good_food/srcs/core/app_constants.dart';

import 'widgets/user_dob.dart';
import 'widgets/user_email.dart';
import 'widgets/user_gender.dart';
import 'widgets/user_image.dart';
import 'widgets/user_name.dart';
import 'widgets/user_phone_number.dart';
import 'widgets/user_save_button.dart';

class EditUserProfileScreen extends StatelessWidget {
  static const route = 'user/edit-profile';
  const EditUserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Profile'),
      ),
      body: Consumer(builder: (context, ref, child) {
        return GestureDetector(
          onTap: () {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const UserImage(),
                    const UserName(),
                    UserDOB(),
                    const UserPhoneNumber(),
                    const UserEmail(),
                    const UserGender(),
                    EditUserSaveButton(formKey: formKey)
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
