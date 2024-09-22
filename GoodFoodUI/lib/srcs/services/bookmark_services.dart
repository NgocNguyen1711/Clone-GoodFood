import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:good_food/srcs/common/api.dart';
import 'package:good_food/srcs/common/storage.dart';
import 'package:good_food/srcs/models/user_bookmark/user_bookmark.dart';

class BookMarkServices {
  final Dio _dio = Api().dio;
  final FlutterSecureStorage _storage = Storage().storage;

  Future<UserBookmarkModel?> getBookmark() async {
    try {
      final token = await _storage.read(key: 'token');
      Response response = await _dio.get(
        '/DanhSachYeuThich/',
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
        ),
      );
      if (response.statusCode == 200) {
        return UserBookmarkModel.fromJson(response.data);
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }

  Future<UserBookmarkModel?> addPost(int postId) async {
    try {
      final token = await _storage.read(key: 'token');
      Response response = await _dio.post(
        '/DanhSachYeuThich/AddPost/$postId',
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
        ),
      );
      if (response.statusCode == 200) {
        return UserBookmarkModel.fromJson(response.data);
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }

  Future<UserBookmarkModel?> addRestaurant(int restaurantId) async {
    try {
      final token = await _storage.read(key: 'token');
      Response response = await _dio.post(
        '/DanhSachYeuThich/AddRestaurant/$restaurantId',
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
        ),
      );
      if (response.statusCode == 200) {
        return UserBookmarkModel.fromJson(response.data);
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }

  Future<UserBookmarkModel?> deleteRestaurant(int restaurantId) async {
    try {
      final token = await _storage.read(key: 'token');
      Response response = await _dio.delete(
        '/DanhSachYeuThich/DeleteRestaurant/$restaurantId',
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
        ),
      );
      if (response.statusCode == 200) {
        return UserBookmarkModel.fromJson(response.data);
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }

  Future<UserBookmarkModel?> deletePost(int postId) async {
    try {
      final token = await _storage.read(key: 'token');
      Response response = await _dio.delete(
        '/DanhSachYeuThich/DeletePost/$postId',
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
        ),
      );
      if (response.statusCode == 200) {
        return UserBookmarkModel.fromJson(response.data);
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }
}

final bookmarkProvider = Provider((ref) => BookMarkServices());
