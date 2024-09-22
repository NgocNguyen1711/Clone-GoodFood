import 'package:flutter/material.dart';

import '../../../../core/app_constants.dart';
import '../../../../core/color_scheme.dart';
import '../../../../models/user_statistics/user_statistics.dart';

class UserStt extends StatelessWidget {
  const UserStt({
    super.key,
    required this.userStatistics,
  });

  final UserStatistics userStatistics;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: defaultPadding / 2),
      child: IntrinsicHeight(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(userStatistics.followed.toString()),
                const Text('Follower')
              ],
            ),
            const VerticalDivider(
              width: 40,
              indent: defaultPadding / 2,
              endIndent: defaultPadding / 2,
              color: commonDark,
              thickness: 1,
            ),
            Column(
              children: [
                Text(userStatistics.following.toString()),
                const Text('Đang follow')
              ],
            ),
            const VerticalDivider(
              width: 40,
              color: commonDark,
              indent: defaultPadding / 2,
              endIndent: defaultPadding / 2,
              thickness: 1,
            ),
            Column(
              children: [
                Text(userStatistics.postCount.toString()),
                const Text('Bài viết')
              ],
            )
          ],
        ),
      ),
    );
  }
}
