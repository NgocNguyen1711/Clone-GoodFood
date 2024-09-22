import 'package:flutter/material.dart';
import 'package:good_food/srcs/screen/user/profile/user_profile.dart';
import 'package:intl/intl.dart';

import '/srcs/core/color_scheme.dart';

class PostUserInfo extends StatelessWidget {
  const PostUserInfo({
    required ImageProvider avatar,
    required String username,
    required DateTime time,
    required this.isOverview,
    required this.userId,
    super.key,
  })  : _avatar = avatar,
        _username = username,
        _time = time;

  final ImageProvider _avatar;
  final String _username;
  final int userId;
  final DateTime _time;
  final bool isOverview;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isOverview
          ? null
          : () {
              Navigator.of(context)
                  .pushNamed(UserProfileScreen.route, arguments: userId);
            },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5),
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 25,
              backgroundColor: Colors.amber[200],
              backgroundImage: _avatar,
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  textAlign: TextAlign.center,
                  _username.isEmpty ? 'user$userId' : _username,
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                ),
                Text(
                  DateFormat('dd-MM-yyyy hh:mm').format(_time),
                  style: const TextStyle(
                    fontSize: 16,
                    color: commonGrey,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
