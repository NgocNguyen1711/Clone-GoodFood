import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:good_food/srcs/common/storage.dart';
import 'package:good_food/srcs/models/notification/notification_model.dart';

import '../common/api.dart';

class NotificationServices {
  final Dio dio = Api().dio;
  final FlutterSecureStorage storage = Storage().storage;

  Future<List<NotificationModel>> getNotification() async {
    try {
      final token = await storage.read(key: 'token');
      Response response = await dio.get(
        '/ThongBao/All',
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
        ),
      );
      if (response.statusCode == 200) {
        return response.data
            .map<NotificationModel>((e) => NotificationModel.fromJson(e))
            .toList();
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return [];
  }

  Future<int> markAsRead(int notificationId) async {
    try {
      final token = await storage.read(key: 'token');
      Response response = await dio.put(
        '/ThongBao/MarkAsRead/$notificationId',
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
        ),
      );
      if (response.statusCode == 200) {
        return response.data;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return 0;
  }

  Future<int> markAsUnRead(int notificationId) async {
    try {
      final token = await storage.read(key: 'token');
      Response response = await dio.put(
        '/ThongBao/MarkAsUnRead/$notificationId',
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
        ),
      );
      if (response.statusCode == 200) {
        return response.data;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return 0;
  }

  Future<void> markAllAsRead() async {
    try {
      final token = await storage.read(key: 'token');
      await dio.put(
        '/ThongBao/MarkAllAsRead/',
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
        ),
      );
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}

final notificationServicesProvider = Provider((ref) => NotificationServices());
