import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../../core/app_constants.dart';
import '../../../../providers/edit_user_provider.dart';

class UserDOB extends StatelessWidget {
  UserDOB({
    super.key,
  });
  final controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      controller.text = ref.watch(userModelProvider).ngaySinh == null
          ? ''
          : DateFormat('dd-MM-yyyy')
              .format(ref.watch(userModelProvider).ngaySinh!);
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: defaultPadding / 2),
        child: TextFormField(
          onTap: () async {
            FocusScope.of(context).requestFocus(FocusNode());
            final date = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(1900),
              lastDate: DateTime.now(),
            );
            ref.read(userModelProvider.notifier).updateState(ngaySinh: date);
            controller.text = ref.watch(userModelProvider).ngaySinh == null
                ? ''
                : DateFormat('dd-MM-yyyy')
                    .format(ref.watch(userModelProvider).ngaySinh!);
          },
          controller: controller,
          keyboardType: TextInputType.none,
          showCursor: false,
          validator: (value) {
            if (controller.text.isEmpty) return 'Ngày sinh không được để trống';
            if (value == null) return 'Ngày sinh không được để trống';
            return null;
          },
          decoration: const InputDecoration(label: Text('Ngày sinh')),
          onSaved: (newValue) {
            ref
                .read(userModelProvider.notifier)
                .updateState(ngaySinh: ref.watch(userModelProvider).ngaySinh);
          },
        ),
      );
    });
  }
}
