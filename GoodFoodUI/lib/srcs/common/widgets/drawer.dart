import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:good_food/srcs/core/app_assets.dart';
import 'package:good_food/srcs/core/app_constants.dart';
import 'package:good_food/srcs/providers/nguoidung_provider.dart';
import 'package:good_food/srcs/screen/user/bookmark/bookmark.dart';
import 'package:good_food/srcs/screen/user/profile/user_profile.dart';
import 'package:good_food/srcs/screen/user/setting/setting.dart';

import '../../core/color_scheme.dart';

class GoodFoodUserDrawer extends StatelessWidget {
  const GoodFoodUserDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          Consumer(builder: (context, ref, child) {
            final userData = ref.watch(userStateProvider);
            return DrawerHeader(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                // mainAxisSize: MainAxisSize.min,
                children: [
                  CircleAvatar(
                    backgroundColor: commonLightGrey,
                    radius: 50,
                    backgroundImage:
                        userData?.idHinhAnh != 0 && userData?.idHinhAnh != null
                            ? NetworkImage(
                                '$baseUrl/Image/${userData?.idHinhAnh}',
                              ) as ImageProvider
                            : const AssetImage(tLogoDefault),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    userData?.hoVaTen != null
                        ? userData!.hoVaTen!.isNotEmpty
                            ? userData.hoVaTen!
                            : 'user${userData.id}'
                        : 'user${userData?.id}',
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            );
          }),
          Consumer(
            builder: (context, ref, child) => ListTile(
              onTap: () async {
                Navigator.of(context).pushNamed(
                  UserProfileScreen.route,
                  arguments: ref.watch(userStateProvider)?.id,
                );
              },
              leading: const Icon(Icons.person),
              title: const Text('Hồ sơ'),
            ),
          ),
          Consumer(
            builder: (context, ref, child) => ListTile(
              onTap: () {
                Navigator.of(context).pushNamed(BookMarkScreen.route);
              },
              leading: const Icon(Icons.bookmark),
              title: const Text('Danh sách yêu thích'),
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.of(context).pushNamed(SettingScreen.route);
            },
            leading: const Icon(Icons.settings),
            title: const Text('Cài đặt'),
          ),
        ],
      ),
    );
  }
}
