import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:good_food/srcs/common/widgets/goodfood_button.dart';
import 'package:good_food/srcs/providers/edit_user_provider.dart';
import 'package:good_food/srcs/providers/nguoidung_provider.dart';

import '../../../../core/app_constants.dart';
import '../../../../services/user_services.dart';

class EditUserSaveButton extends StatelessWidget {
  const EditUserSaveButton({
    super.key,
    required this.formKey,
  });

  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) => Padding(
        padding: const EdgeInsets.symmetric(vertical: defaultPadding / 2),
        child: GoodfoodPrimaryButton(
          onPressed: () async {
            if (formKey.currentState!.validate()) {
              formKey.currentState!.save();
              await ref
                  .watch(userProvider)
                  .updateUser(ref.watch(userModelProvider));
              await ref.refresh(userStateProvider.notifier).getUser();
              if (context.mounted) {
                Navigator.of(context).pop();
              }
            }
          },
          child: const Text('Lưu'),
        ),
      ),
    );
  }
}
