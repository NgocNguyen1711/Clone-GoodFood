import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:good_food/srcs/models/user/user_model.dart';

part 'chat_model.freezed.dart';
part 'chat_model.g.dart';

@freezed
class ChatModel with _$ChatModel {
  const factory ChatModel({
    required int id,
    required DateTime thoiGian,
    required int conversationId,
    required int senderId,
    required String message,
    required bool isRead,
    UserModel? sender,
  }) = _ChatModel;

  factory ChatModel.fromJson(Map<String, dynamic> json) =>
      _$ChatModelFromJson(json);
}
