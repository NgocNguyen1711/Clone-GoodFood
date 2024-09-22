import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../common/api.dart';
import '../common/storage.dart';
import '../core/app_config.dart';
import '../core/app_constants.dart';
import '../models/user/user_model.dart';

class AuthenticationServices {
  final Dio _dio = Api().dio;
  final FlutterSecureStorage _storage = Storage().storage;

  Future<UserModel?>? signIn({
    required String userEmail,
    required String password,
  }) async {
    try {
      final deviceToken = await FirebaseMessaging.instance.getToken();
      if (deviceToken == null) return null;
      final response = await _dio.get(
        '/NguoiDung/SignIn',
        data: {
          'username': userEmail,
          'password': password,
          'role': AppConfig.instance.env.envType.index,
          'deviceToken': deviceToken,
        },
      );
      if (response.statusCode == 200) {
        final userData = response.data;
        if (userData == null) {
          return null;
        }
        final userModel = UserModel.fromJson(userData);
        await _storage.write(key: 'token', value: userModel.token);
        return userModel;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }

  Future<bool> signUp({
    required String userEmail,
    required String password,
  }) async {
    try {
      final response = await _dio.post(
        '/NguoiDung/SignUp',
        data: {
          'username': userEmail,
          'password': password,
          'role': AppConfig.instance.env.envType.index,
        },
      );
      if (response.statusCode == 200) {
        return true;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return false;
  }

  Future<bool> isLoggedIn() async {
    try {
      final token = await _storage.read(key: 'token');
      final response = await _dio.get(
        '$baseUrl/NguoiDung/IsLoggedIn',
        options: Options(
          headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer $token",
          },
        ),
      );
      if (response.statusCode == 200) {
        return response.data;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return false;
  }

  Future signOut() async {
    try {
      final deviceToken = await FirebaseMessaging.instance.getToken();
      final token = await _storage.read(key: 'token');
      final response = await _dio.put(
        '/NguoiDung/SignOut',
        queryParameters: {'deviceToken': deviceToken},
        options: Options(
          headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer $token",
          },
        ),
      );
      if (response.statusCode == 200) {
        await _storage.delete(key: 'token');
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<bool> changePassword(
      String currentPassword, String newPassword) async {
    try {
      final token = await _storage.read(key: 'token');
      final response = await _dio.post(
        '$baseUrl/NguoiDung/ChangePassword',
        data: {
          'currentPassword': currentPassword,
          'newPassword': newPassword,
        },
        options: Options(
          headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer $token",
          },
        ),
      );
      if (response.statusCode == 200) {
        return response.data;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return false;
  }
}
