import 'dart:math';

import 'package:flutter/material.dart';
import 'package:good_food/srcs/core/color_scheme.dart';
import 'package:good_food/srcs/screen/user/chats/chat.dart';

import '../../../../models/user/user_model.dart';
import '../../../../services/user_services.dart';

class FollowButton extends StatefulWidget {
  const FollowButton({
    super.key,
    required this.user,
    required this.currentUser,
    required this.isFollowing,
  });

  final UserModel user;
  final UserModel? currentUser;
  final bool isFollowing;

  @override
  State<FollowButton> createState() => _FollowButtonState();
}

class _FollowButtonState extends State<FollowButton> {
  bool isFollowing = false;
  @override
  void initState() {
    isFollowing = widget.isFollowing;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: widget.user.id != widget.currentUser?.id
          ? isFollowing
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    OutlinedButton(
                      onPressed: () async {
                        await UserServices().unfollowUser(widget.user.id);
                        setState(() {
                          isFollowing = !isFollowing;
                        });
                      },
                      style: const ButtonStyle(
                        side: MaterialStatePropertyAll(
                          BorderSide(
                            color: commonDark,
                          ),
                        ),
                      ),
                      child: const Text(
                        'Hủy theo dõi',
                        style: TextStyle(color: commonDark),
                      ),
                    ),
                    const SizedBox(width: 5),
                    OutlinedButton(
                      style: const ButtonStyle(
                        foregroundColor: MaterialStatePropertyAll(commonDark),
                        side: MaterialStatePropertyAll(
                          BorderSide(
                            color: commonDark,
                          ),
                        ),
                      ),
                      onPressed: () {
                        final conversationStringId = min(widget.user.id,
                                    widget.currentUser?.id as int)
                                .toString() +
                            max(widget.user.id, widget.currentUser?.id as int)
                                .toString();
                        final conversationId = int.parse(conversationStringId);
                        Navigator.of(context).pushNamed(ChatScreen.route,
                            arguments: conversationId);
                      },
                      child: const Icon(Icons.chat_bubble_outline),
                    )
                  ],
                )
              : ElevatedButton(
                  onPressed: () async {
                    await UserServices().followUser(widget.user.id);
                    setState(() {
                      isFollowing = !isFollowing;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: commonDark,
                    elevation: 0,
                    fixedSize: const Size(110, 20),
                    backgroundColor: userTints4.withOpacity(0.7),
                  ),
                  child: const Text('Theo dõi'),
                )
          : Container(),
    );
  }
}
