import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:good_food/srcs/models/post_overview/post_overview_model.dart';
import 'package:good_food/srcs/models/user/user_model.dart';
import 'package:good_food/srcs/models/user_statistics/user_statistics.dart';
import 'package:good_food/srcs/providers/nguoidung_provider.dart';
import 'package:good_food/srcs/screen/user/edit_profile/edit_user_profile.dart';
import 'package:good_food/srcs/services/post_services.dart';
import 'package:good_food/srcs/services/user_services.dart';

import '../../../core/app_constants.dart';
import '../../../providers/edit_user_provider.dart';
import 'widgets/follow_button.dart';
import 'widgets/user_avatar.dart';
import 'widgets/user_name.dart';
import 'widgets/user_posts.dart';
import 'widgets/user_stt.dart';

class UserProfileScreen extends StatelessWidget {
  static const String route = 'user-profile';
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userId = ModalRoute.of(context)?.settings.arguments as int;
    return SafeArea(
        child: FutureBuilder(
      future: Future.wait([
        UserServices().getUserById(userId),
        UserServices().getUserStatistics(userId),
        UserServices().isFollowing(userId),
        PostServices().getPostByUserId(userId),
      ]),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data != null) {
            final user = snapshot.data![0] as UserModel;
            final userStatistics = snapshot.data![1] as UserStatistics;
            final isFollowing = snapshot.data![2] as bool;
            final List<PostOverviewModel> posts =
                snapshot.data![3] as List<PostOverviewModel>;
            return Consumer(
              builder: (context, ref, child) {
                final currentUser = ref.watch(userStateProvider);
                return Scaffold(
                  appBar: AppBar(
                    title: const Text('Hồ sơ'),
                    actions: [
                      PopupMenuButton(
                        onSelected: (value) async {
                          if (value == 0) {}
                          if (value == 1) {
                            final user = await ref
                                .watch(userModelProvider.notifier)
                                .getUser();
                            if (context.mounted) {
                              Navigator.of(context).pushNamed(
                                  EditUserProfileScreen.route,
                                  arguments: user);
                            }
                          }
                        },
                        itemBuilder: (context) => [
                          user.id != currentUser?.id
                              ? const PopupMenuItem(
                                  value: 0,
                                  child: Text('Báo cáo'),
                                )
                              : const PopupMenuItem(
                                  value: 1,
                                  child: Text('Chỉnh sửa thông tin'),
                                )
                        ],
                      )
                    ],
                  ),
                  body: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: defaultPadding),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          UserAvatar(user: user),
                          UserName(user: user),
                          FollowButton(
                            user: user,
                            currentUser: currentUser,
                            isFollowing: isFollowing,
                          ),
                          UserStt(userStatistics: userStatistics),
                          UserPosts(posts: posts)
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }
        }
        return const Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    ));
  }
}
