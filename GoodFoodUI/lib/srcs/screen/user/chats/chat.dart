import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:good_food/srcs/core/app_constants.dart';
import 'package:good_food/srcs/core/color_scheme.dart';
import 'package:good_food/srcs/providers/nguoidung_provider.dart';
import 'package:good_food/srcs/services/message_services.dart';

import 'Widgets/current_user_message.dart';
import 'Widgets/partner_user_message.dart';

class ChatScreen extends ConsumerWidget {
  static const String route = 'user/conversation/chat';
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final conversationId = ModalRoute.of(context)?.settings.arguments as int;
    final textController = TextEditingController();
    final scrollController = ScrollController();
    return SafeArea(
      child: FutureBuilder(
        future: ref
            .watch(messageServiceProvider)
            .getSpecificConversation(conversationId),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data != null) {
              final conversation = snapshot.data!;
              final currentUser = ref.watch(userStateProvider);
              final partnerUser = conversation.user1Id == currentUser?.id
                  ? conversation.user2
                  : conversation.user1;
              return Scaffold(
                appBar: AppBar(
                  leading: IconButton(
                    onPressed: () async {
                      await ref
                          .read(messageServiceProvider)
                          .markAsRead(conversationId);
                      await ref
                          .refresh(messageServiceProvider)
                          .getConversation();
                      if (context.mounted) {
                        Navigator.of(context).pop();
                      }
                    },
                    icon: const Icon(Icons.arrow_back),
                  ),
                  title: Text(
                    conversation.user1Id == currentUser?.id
                        ? conversation.user2?.hoVaTen ??
                            'user${conversation.user2Id}'
                        : conversation.user1?.hoVaTen ??
                            'user${conversation.user1Id}',
                  ),
                ),
                body: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: defaultPadding),
                  child: Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          controller: scrollController,
                          itemCount: conversation.chats.length,
                          reverse: true,
                          itemBuilder: (context, index) => conversation
                                      .chats.reversed
                                      .toList()[index]
                                      .sender
                                      ?.id ==
                                  currentUser?.id
                              ? CurrentUserMessage(
                                  chat: conversation.chats.reversed
                                      .toList()[index],
                                )
                              : PartnerUserMessage(
                                  chat: conversation.chats.reversed
                                      .toList()[index],
                                ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: defaultPadding / 2),
                        child: TextField(
                          controller: textController,
                          maxLines: null,
                          keyboardType: TextInputType.multiline,
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                              onPressed: () async {
                                FocusManager.instance.primaryFocus?.unfocus();
                                if (textController.text.isNotEmpty) {
                                  await ref
                                      .watch(messageServiceProvider)
                                      .sendMessage(
                                          partnerUser!.id, textController.text);
                                  await ref
                                      .refresh(messageServiceProvider)
                                      .getSpecificConversation(conversationId);
                                }
                                SchedulerBinding.instance
                                    .addPersistentFrameCallback((timeStamp) {
                                  if (scrollController.hasClients) {
                                    scrollController.animateTo(
                                      scrollController.position.maxScrollExtent,
                                      duration: const Duration(seconds: 1),
                                      curve: Curves.fastOutSlowIn,
                                    );
                                  }
                                });
                              },
                              icon: const Icon(
                                Icons.send,
                                color: userTints4,
                              ),
                            ),
                            hintText: 'Nhập tin nhắn...',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
