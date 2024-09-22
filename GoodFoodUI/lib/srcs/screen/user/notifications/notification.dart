import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:good_food/srcs/common/widgets/drawer.dart';
import 'package:good_food/srcs/core/color_scheme.dart';
import 'package:good_food/srcs/services/notification_service.dart';

import '../../../core/app_constants.dart';
import 'Widgets/notification_item.dart';

class NotificationScreen extends ConsumerWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Scaffold(
        drawer: const GoodFoodUserDrawer(),
        appBar: AppBar(
          title: const Text('Thông báo'),
          actions: [
            IconButton(
              onPressed: () {
                ref.read(notificationServicesProvider).markAllAsRead();
                ref.refresh(notificationServicesProvider).getNotification();
              },
              icon: const Icon(Icons.mark_email_read_outlined),
            )
          ],
        ),
        body: FutureBuilder(
          future: ref.watch(notificationServicesProvider).getNotification(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                reverse: false,
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) => Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: defaultPadding),
                  decoration: BoxDecoration(
                    color: snapshot.data![index].daDoc
                        ? null
                        : userTints7.withOpacity(0.3),
                  ),
                  child: NotificationItem(
                    notification: snapshot.data![index],
                  ),
                ),
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
