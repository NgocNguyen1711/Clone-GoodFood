import 'package:flutter/material.dart';

import '../../../../core/app_constants.dart';
import '../../../../models/user/user_model.dart';

class UserName extends StatelessWidget {
  const UserName({
    super.key,
    required this.user,
  });

  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: defaultPadding / 2,
      ),
      child: Text(
        user.hoVaTen ?? 'user${user.id}',
        style: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
