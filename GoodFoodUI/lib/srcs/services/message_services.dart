import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:good_food/srcs/common/api.dart';
import 'package:good_food/srcs/common/storage.dart';
import 'package:good_food/srcs/models/coversation/conversation_model.dart';

class MessageServices {
  final Dio dio = Api().dio;
  final FlutterSecureStorage storage = Storage().storage;

  Future<List<ConversationModel>> getConversation() async {
    try {
      final token = await storage.read(key: 'token');
      Response response = await dio.get(
        '/Chat/Conversation',
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
        ),
      );
      if (response.statusCode == 200) {
        return response.data
            .map<ConversationModel>((e) => ConversationModel.fromJson(e))
            .toList();
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return [];
  }

  Future<ConversationModel?> getSpecificConversation(int conversationId) async {
    try {
      final token = await storage.read(key: 'token');
      Response response = await dio.get(
        '/Chat/Conversation/$conversationId',
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );
      if (response.statusCode == 200) {
        return ConversationModel.fromJson(response.data);
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }

  Future<ConversationModel?> sendMessage(int receiverId, String message) async {
    try {
      final token = await storage.read(key: 'token');
      Response response = await dio.post(
        '/Chat/Send',
        data: {
          'message': message,
          'receiverId': receiverId,
        },
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );
      if (response.statusCode == 200) {
        return ConversationModel.fromJson(response.data);
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }

  Future<ConversationModel?> markAsRead(int conversationId) async {
    try {
      final token = await storage.read(key: 'token');
      Response response = await dio.put(
        '/MarkAsRead/$conversationId',
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );
      if (response.statusCode == 200) {
        return ConversationModel.fromJson(response.data);
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }
}

final messageServiceProvider = Provider((ref) => MessageServices());
