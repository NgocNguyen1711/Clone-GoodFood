import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:good_food/srcs/screen/user/post_detail/post_detail_screen.dart';
import 'package:good_food/srcs/screen/user/profile/user_profile.dart';
import 'package:intl/intl.dart';

import '../../../../core/app_constants.dart';
import '../../../../models/notification/notification_model.dart';
import '../../../../services/notification_service.dart';

Widget buildNotificationIcon(int notificationType) {
  switch (notificationType) {
    case 0:
      return const Icon(Icons.favorite_rounded);
    case 1:
      return const Icon(Icons.comment_rounded);
    case 2:
      return const Icon(Icons.people_alt_rounded);
    case 3:
      return const Icon(Icons.reviews);
  }
  return const Icon(Icons.notifications);
}

class NotificationItem extends ConsumerWidget {
  const NotificationItem({
    super.key,
    required this.notification,
  });
  final NotificationModel notification;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      onTap: () async {
        await ref
            .watch(notificationServicesProvider)
            .markAsRead(notification.id);
        await ref.refresh(notificationServicesProvider).getNotification();
        if (notification.loaiThongBao == 0) {
          if (context.mounted) {
            Navigator.of(context).pushNamed(PostDetailScreen.route,
                arguments: notification.postId);
          }
        }
        if (notification.loaiThongBao == 1) {
          if (context.mounted) {
            Navigator.of(context).pushNamed(PostDetailScreen.route,
                arguments: notification.postId);
          }
        }
        if (notification.loaiThongBao == 2) {
          if (context.mounted) {
            Navigator.of(context).pushNamed(UserProfileScreen.route,
                arguments: notification.userId);
          }
        }
        if (notification.loaiThongBao == 3) {}
      },
      leading: buildNotificationIcon(notification.loaiThongBao),
      title: Text(notification.noiDung),
      subtitle: Text(
        DateFormat('dd-MM-yyyy').format(notification.thoiGian),
      ),
      trailing: IconButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  !notification.daDoc
                      ? TextButton(
                          onPressed: () async {
                            await ref
                                .watch(notificationServicesProvider)
                                .markAsRead(notification.id);
                            await ref
                                .refresh(notificationServicesProvider)
                                .getNotification();
                            if (context.mounted) {
                              Navigator.of(context).pop();
                            }
                          },
                          child: const Align(
                            alignment: Alignment.centerLeft,
                            child: Text('Đánh dấu là đã đọc'),
                          ),
                        )
                      : TextButton(
                          onPressed: () async {
                            await ref
                                .watch(notificationServicesProvider)
                                .markAsUnRead(notification.id);
                            await ref
                                .refresh(notificationServicesProvider)
                                .getNotification();
                            if (context.mounted) {
                              Navigator.of(context).pop();
                            }
                          },
                          child: const Align(
                            alignment: Alignment.centerLeft,
                            child: Text('Đánh dấu là chưa đọc'),
                          ),
                        )
                ],
              ),
            ),
          );
        },
        icon: const Icon(Icons.more_horiz),
      ),
    );
  }
}
