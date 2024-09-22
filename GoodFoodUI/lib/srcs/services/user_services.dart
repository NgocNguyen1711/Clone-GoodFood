import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:good_food/srcs/common/storage.dart';
import 'package:good_food/srcs/core/app_constants.dart';
import 'package:good_food/srcs/services/image_services.dart';

import '../common/api.dart';
import '../models/user/user_model.dart';
import '../models/user_statistics/user_statistics.dart';

class UserServices {
  final Dio _dio = Api().dio;
  final FlutterSecureStorage _storage = Storage().storage;

  Future<bool> followUser(int userId) async {
    try {
      final token = await _storage.read(key: 'token');
      Response response = await _dio.post(
        '/NguoiDung/Follow/$userId',
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
    return false;
  }

  Future<bool> unfollowUser(int userId) async {
    try {
      final token = await _storage.read(key: 'token');
      Response response = await _dio.post(
        '/NguoiDung/Unfollow/$userId',
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
    return false;
  }

  Future<bool> isFollowing(int userId) async {
    try {
      final token = await _storage.read(key: 'token');
      Response response = await _dio.get(
        '/NguoiDung/IsFollowing/$userId',
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
    return false;
  }

  Future<UserStatistics?> getUserStatistics(int userId) async {
    try {
      final token = await _storage.read(key: 'token');
      Response response = await _dio.get(
        '/NguoiDung/Statistics/$userId',
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
        ),
      );
      if (response.statusCode == 200) {
        return UserStatistics.fromJson(response.data);
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }

  Future<UserModel?> getUserById(int userId) async {
    try {
      final token = await _storage.read(key: 'token');
      Response response = await _dio.get(
        '/NguoiDung/$userId',
        options: Options(
          headers: {
            'Authorization': "Bearer $token",
          },
        ),
      );
      if (response.statusCode == 200) {
        return UserModel.fromJson(response.data);
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }

  Future<UserModel?> getUser() async {
    try {
      final token = await _storage.read(key: 'token');
      Response response = await _dio.get(
        '/NguoiDung',
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
          },
        ),
      );
      if (response.statusCode == 200) {
        return UserModel.fromJson(response.data);
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }

  Future setUserTags(List<int> tags) async {
    try {
      final token = await _storage.read(key: 'token');
      await _dio.post(
        '/NguoiDung/SetUserTags',
        data: [...tags],
        options: Options(
          contentType: 'application/json',
          headers: {
            "Authorization": "Bearer $token",
          },
        ),
      );
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<bool> updateUser(UserModel userModel) async {
    try {
      final token = await _storage.read(key: 'token');
      if (userModel.imagePath != null) {
        userModel = userModel.copyWith(
          idHinhAnh: await ImageServices().uploadImage(
            userModel.imagePath!,
            ImageType.avatar.index,
          ),
        );
      }
      final resposne = await _dio.put(
        '/NguoiDung/Update',
        data: userModel,
        options: Options(
          contentType: 'application/json',
          headers: {
            "Authorization": "Bearer $token",
          },
        ),
      );
      if (resposne.statusCode == 200) {
        return resposne.data;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return false;
  }
}

final userProvider = Provider((ref) => UserServices());
