import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:good_food/srcs/common/widgets/drawer.dart';
import 'package:good_food/srcs/core/app_assets.dart';
import 'package:good_food/srcs/core/app_constants.dart';
import 'package:good_food/srcs/models/user/user_model.dart';
import 'package:good_food/srcs/providers/nguoidung_provider.dart';
import 'package:good_food/srcs/screen/user/chats/chat.dart';
import 'package:good_food/srcs/services/message_services.dart';

class ConversationScreen extends ConsumerWidget {
  const ConversationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Scaffold(
        drawer: const GoodFoodUserDrawer(),
        appBar: AppBar(
          title: const Text('Trò chuyện'),
        ),
        body: FutureBuilder(
          future: ref.watch(messageServiceProvider).getConversation(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data != null) {
                final conversations = snapshot.data!;
                final currentUser = ref.watch(userStateProvider);
                return ListView.builder(
                  itemCount: conversations.length,
                  itemBuilder: (context, index) {
                    UserModel? partner =
                        conversations[index].user1Id == currentUser?.id
                            ? conversations[index].user2
                            : conversations[index].user1;
                    return conversations[index].chats.isNotEmpty
                        ? ListTile(
                            onTap: () {
                              Navigator.of(context).pushNamed(ChatScreen.route,
                                  arguments: conversations[index].id);
                            },
                            leading: Image(
                              image: partner?.idHinhAnh == null ||
                                      partner?.idHinhAnh == 0
                                  ? const AssetImage(tLogoDefault)
                                  : NetworkImage(
                                      '$baseUrl/Image/${partner?.idHinhAnh}',
                                    ) as ImageProvider,
                            ),
                            title: Text(
                              partner?.hoVaTen ?? 'user${partner?.id}',
                              style: !conversations[index].chats[0].isRead &&
                                      conversations[index].chats[0].senderId !=
                                          currentUser?.id
                                  ? const TextStyle(fontWeight: FontWeight.bold)
                                  : null,
                            ),
                            subtitle: Text(
                              conversations[index].chats[0].message,
                              style: !conversations[index].chats[0].isRead &&
                                      conversations[index].chats[0].senderId !=
                                          currentUser?.id
                                  ? const TextStyle(fontWeight: FontWeight.bold)
                                  : null,
                            ),
                          )
                        : const SizedBox.shrink();
                  },
                );
              }
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
