import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/app_constants.dart';
import '../../../../providers/edit_user_provider.dart';

class UserPhoneNumber extends StatelessWidget {
  const UserPhoneNumber({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: defaultPadding / 2),
        child: TextFormField(
          initialValue: ref.watch(userModelProvider).soDienThoai,
          onSaved: (newValue) {
            ref
                .read(userModelProvider.notifier)
                .updateState(soDienThoai: newValue);
          },
          decoration: const InputDecoration(
            label: Text('Số điện thoại'),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Số điện thoại không được để trống';
            }
            if (value.length < 10 || value.length > 11) {
              return 'Định dạng số điện thoại không phù hợp';
            }
            return null;
          },
          keyboardType: TextInputType.phone,
        ),
      );
    });
  }
}
