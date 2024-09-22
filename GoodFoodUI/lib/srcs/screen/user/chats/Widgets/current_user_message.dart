import 'package:flutter/material.dart';

import '../../../../core/app_assets.dart';
import '../../../../core/app_constants.dart';
import '../../../../core/color_scheme.dart';
import '../../../../models/chat/chat_model.dart';

class CurrentUserMessage extends StatelessWidget {
  const CurrentUserMessage({
    super.key,
    required this.chat,
  });

  final ChatModel chat;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: defaultPadding / 2,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const SizedBox(
            width: 50,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: defaultPadding,
                    vertical: defaultPadding / 2,
                  ),
                  decoration: BoxDecoration(
                    color: commonLightGrey,
                    borderRadius: BorderRadius.circular(defaultPadding / 2),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        chat.message,
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: CircleAvatar(
              backgroundColor: commonLightGrey,
              backgroundImage:
                  chat.sender?.idHinhAnh != null && chat.sender?.idHinhAnh != 0
                      ? NetworkImage(
                          '$baseUrl/Image/${chat.sender?.idHinhAnh}',
                        ) as ImageProvider
                      : const AssetImage(tLogoDefault),
            ),
          ),
        ],
      ),
    );
  }
}
