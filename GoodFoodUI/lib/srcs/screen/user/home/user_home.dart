import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:good_food/srcs/screen/user/chats/chat.dart';

import '../../../common/widgets/drawer.dart';
import '../../../providers/page_index_provider.dart';
import '../../../services/message_services.dart';
import '../../../services/notification_service.dart';
import '../conversations/conversation.dart';
import '../new_post/select_restaurant_screen.dart';
import '../notifications/notification.dart';
import '../post_overview/post_overview_screen.dart';
import '../search/search.dart';
import 'widgets/bottom_navbar.dart';

final pageBucket = PageStorageBucket();

class UserHomeScreen extends ConsumerStatefulWidget {
  static const String route = '/main';
  const UserHomeScreen({super.key});

  @override
  ConsumerState<UserHomeScreen> createState() => _MainState();
}

class _MainState extends ConsumerState<UserHomeScreen> {
  @override
  void initState() {
    super.initState();
    setupInteractMessage();
  }

  Future<void> setupInteractMessage() async {
    RemoteMessage? initialMessage =
        await FirebaseMessaging.instance.getInitialMessage();
    if (initialMessage != null) {
      handleOnMessageOpenedApp(initialMessage);
    }
    FirebaseMessaging.onMessage.listen(handleOnMessage);
    FirebaseMessaging.onMessageOpenedApp.listen(handleOnMessageOpenedApp);
  }

  Future<void> handleOnMessage(RemoteMessage message) async {
    await ref.refresh(notificationServicesProvider).getNotification();
    await ref.refresh(messageServiceProvider).getConversation();
  }

  Future<void> handleOnMessageOpenedApp(RemoteMessage message) async {
    await ref.refresh(notificationServicesProvider).getNotification();
    await ref.refresh(messageServiceProvider).getConversation();
    if (message.data.containsKey('type')) {
      if (message.data['type'] == 'Chat') {
        debugPrint(message.data.toString());
        await ref.watch(messageServiceProvider).getConversation();

        if (context.mounted) {
          Navigator.of(context).pushNamed(
            ChatScreen.route,
            arguments: int.parse(message.data['conversationId']),
          );
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      const PostOverviewScreen(),
      const SearchScreen(),
      const SelectRestaurant(),
      const NotificationScreen(),
      const ConversationScreen(),
    ];
    return SafeArea(
      bottom: false,
      child: Scaffold(
        extendBody: true,
        body: PageStorage(
          bucket: pageBucket,
          child: pages[ref.watch(pageIndexProvider)],
        ),
        drawer: const GoodFoodUserDrawer(),
        bottomNavigationBar: BottomNavbar(
          ref: ref,
        ),
      ),
    );
  }
}
