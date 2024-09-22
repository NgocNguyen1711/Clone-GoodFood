import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:good_food/srcs/models/chat/chat_model.dart';
import 'package:good_food/srcs/models/user/user_model.dart';

part 'conversation_model.freezed.dart';
part 'conversation_model.g.dart';

@freezed
class ConversationModel with _$ConversationModel {
  const factory ConversationModel({
    required int id,
    required int user1Id,
    required int user2Id,
    required List<ChatModel> chats,
    UserModel? user1,
    UserModel? user2,
  }) = _ConversationModel;

  factory ConversationModel.fromJson(Map<String, dynamic> json) =>
      _$ConversationModelFromJson(json);
}
