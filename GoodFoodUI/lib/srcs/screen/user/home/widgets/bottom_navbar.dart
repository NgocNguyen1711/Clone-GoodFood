import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:good_food/srcs/providers/nguoidung_provider.dart';
import 'package:good_food/srcs/services/message_services.dart';

import '../../../../core/color_scheme.dart';
import '../../../../providers/page_index_provider.dart';
import '../../../../services/notification_service.dart';

class BottomNavbar extends StatelessWidget {
  const BottomNavbar({
    super.key,
    required this.ref,
  });

  final WidgetRef ref;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: ref.watch(pageIndexProvider),
      onTap: (value) =>
          ref.read(pageIndexProvider.notifier).changePageIndex(index: value),
      type: BottomNavigationBarType.fixed,
      elevation: 10,
      selectedItemColor: userTints3,
      unselectedItemColor: commonDark,
      showUnselectedLabels: false,
      // showSelectedLabels: false,
      items: [
        const BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
          label: 'Trang chủ',
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.search_rounded),
          label: 'Tìm kiếm',
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.add_circle_rounded),
          label: 'Bài viết',
        ),
        BottomNavigationBarItem(
          icon: Stack(
            children: [
              const Icon(Icons.notifications_outlined),
              FutureBuilder(
                future:
                    ref.watch(notificationServicesProvider).getNotification(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    if (snapshot.data!.any((element) => !element.daDoc)) {
                      return const Positioned(
                        top: 0.0,
                        right: 0.0,
                        child: Icon(
                          Icons.brightness_1,
                          size: 10,
                          color: Colors.red,
                        ),
                      );
                    }
                  }
                  return const SizedBox.shrink();
                },
              )
            ],
          ),
          label: 'Thông báo',
        ),
        BottomNavigationBarItem(
          icon: Stack(
            children: [
              const Icon(Icons.message_outlined),
              FutureBuilder(
                future: ref.watch(messageServiceProvider).getConversation(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final currentUser = ref.watch(userStateProvider);
                    if (snapshot.data!.any(
                      (element) => element.chats.any((element) =>
                          !element.isRead &&
                          element.senderId != currentUser?.id),
                    )) {
                      return const Positioned(
                        top: 0.0,
                        right: 0.0,
                        child: Icon(
                          Icons.brightness_1,
                          size: 10,
                          color: Colors.red,
                        ),
                      );
                    }
                  }
                  return const SizedBox.shrink();
                },
              )
            ],
          ),
          label: 'Tin nhắn',
        ),
      ],
    );
  }
}
