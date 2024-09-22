import 'package:flutter/material.dart';

import '../../../../core/app_assets.dart';
import '../../../../core/app_constants.dart';
import '../../../../core/color_scheme.dart';
import '../../../../models/user/user_model.dart';

class UserAvatar extends StatelessWidget {
  const UserAvatar({
    super.key,
    required this.user,
  });

  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: defaultPadding / 2),
      child: CircleAvatar(
        radius: 80,
        backgroundColor: commonLightGrey,
        backgroundImage: user.idHinhAnh != null && user.idHinhAnh != 0
            ? NetworkImage(
                '$baseUrl/Image/${user.idHinhAnh}',
              ) as ImageProvider
            : const AssetImage(tLogoDefault),
      ),
    );
  }
}
