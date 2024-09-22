import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/app_assets.dart';
import '../../../../core/app_constants.dart';
import '../../../../core/color_scheme.dart';
import '../../../../providers/edit_user_provider.dart';

class UserImage extends StatelessWidget {
  const UserImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) => Padding(
        padding: const EdgeInsets.symmetric(vertical: defaultPadding / 2),
        child: GestureDetector(
          onTap: () async {
            final XFile? file =
                await ImagePicker().pickImage(source: ImageSource.gallery);
            if (file != null) {
              ref
                  .read(userModelProvider.notifier)
                  .updateState(imagePath: file.path);
            }
          },
          child: Column(
            children: [
              CircleAvatar(
                radius: 80,
                backgroundColor: commonLightGrey,
                backgroundImage: ref.watch(userModelProvider).imagePath != null
                    ? FileImage(
                        File(
                          ref.watch(userModelProvider).imagePath!,
                        ),
                      )
                    : ref.watch(userModelProvider).idHinhAnh != null &&
                            ref.watch(userModelProvider).idHinhAnh != 0
                        ? NetworkImage(
                            '$baseUrl/Image/${ref.watch(userModelProvider).idHinhAnh}',
                          ) as ImageProvider
                        : const AssetImage(tLogoDefault),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text('Cập nhật hình ảnh')
            ],
          ),
        ),
      ),
    );
  }
}
