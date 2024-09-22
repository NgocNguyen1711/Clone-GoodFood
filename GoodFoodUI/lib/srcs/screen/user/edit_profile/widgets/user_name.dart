import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/app_constants.dart';
import '../../../../providers/edit_user_provider.dart';

class UserName extends StatelessWidget {
  const UserName({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: defaultPadding / 2),
          child: TextFormField(
            initialValue: ref.watch(userModelProvider).hoVaTen,
            onSaved: (newValue) {
              ref
                  .read(userModelProvider.notifier)
                  .updateState(hoVaTen: newValue);
            },
            validator: (value) {
              return value == null || value.isEmpty
                  ? "Họ và tên không được để trống"
                  : null;
            },
            decoration: const InputDecoration(
              label: Text('Họ và tên'),
            ),
            keyboardType: TextInputType.name,
          ),
        );
      },
    );
  }
}
