import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/app_constants.dart';
import '../../../../providers/edit_user_provider.dart';

class UserGender extends StatelessWidget {
  const UserGender({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) => Padding(
        padding: const EdgeInsets.symmetric(vertical: defaultPadding / 2),
        child: DropdownButtonFormField(
          hint: const Text('Giới tính'),
          value: ref.watch(userModelProvider).gioiTinh,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Giới tính không được để trống';
            }
            return null;
          },
          items: const [
            DropdownMenuItem(
              value: 'M',
              child: Text('Nam'),
            ),
            DropdownMenuItem(
              value: 'F',
              child: Text('Nữ'),
            ),
            DropdownMenuItem(
              value: 'O',
              child: Text('Khác'),
            )
          ],
          onChanged: (newValue) {
            ref
                .read(userModelProvider.notifier)
                .updateState(gioiTinh: newValue);
          },
          onSaved: (newValue) {
            ref
                .read(userModelProvider.notifier)
                .updateState(gioiTinh: newValue);
          },
        ),
      ),
    );
  }
}
