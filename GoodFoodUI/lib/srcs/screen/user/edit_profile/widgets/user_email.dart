import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/app_constants.dart';
import '../../../../providers/edit_user_provider.dart';

class UserEmail extends StatelessWidget {
  const UserEmail({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: defaultPadding / 2),
        child: TextFormField(
          initialValue: ref.watch(userModelProvider).email,
          onSaved: (newValue) {
            ref.read(userModelProvider.notifier).updateState(email: newValue);
          },
          validator: (value) {
            final emailRegExp =
                RegExp(r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+');

            if (value == null || value.isEmpty) {
              return 'Email không được để trống';
            }
            return emailRegExp.hasMatch(value)
                ? null
                : 'Định dạng email không hợp lệ';
          },
          decoration: const InputDecoration(
            label: Text('Email'),
          ),
          keyboardType: TextInputType.emailAddress,
        ),
      );
    });
  }
}
