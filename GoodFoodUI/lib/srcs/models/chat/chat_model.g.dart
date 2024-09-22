// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ChatModel _$$_ChatModelFromJson(Map<String, dynamic> json) => _$_ChatModel(
      id: json['id'] as int,
      thoiGian: DateTime.parse(json['thoiGian'] as String),
      conversationId: json['conversationId'] as int,
      senderId: json['senderId'] as int,
      message: json['message'] as String,
      isRead: json['isRead'] as bool,
      sender: json['sender'] == null
          ? null
          : UserModel.fromJson(json['sender'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_ChatModelToJson(_$_ChatModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'thoiGian': instance.thoiGian.toIso8601String(),
      'conversationId': instance.conversationId,
      'senderId': instance.senderId,
      'message': instance.message,
      'isRead': instance.isRead,
      'sender': instance.sender,
    };
