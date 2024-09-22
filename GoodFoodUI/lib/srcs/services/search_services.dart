import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:good_food/srcs/common/storage.dart';
import 'package:good_food/srcs/models/dish/dish_model.dart';
import 'package:good_food/srcs/models/post_overview/post_overview_model.dart';
import 'package:good_food/srcs/models/restaurant/restaurant_model.dart';
import 'package:good_food/srcs/models/user/user_model.dart';

import '../common/api.dart';

class SearchServices {
  final Dio dio = Api().dio;
  final FlutterSecureStorage storage = Storage().storage;

  Future<List<PostOverviewModel>> SearchPost(String keyword) async {
    if (keyword.isEmpty) return [];
    try {
      final token = await storage.read(key: 'token');
      Response response = await dio.get(
        '/BaiViet/Search',
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
        ),
        queryParameters: {'keyword': keyword},
      );
      if (response.statusCode == 200) {
        return response.data
            .map<PostOverviewModel>((e) => PostOverviewModel.fromJson(e))
            .toList();
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return [];
  }

  Future<List<UserModel>> SearchUser(String keyword) async {
    if (keyword.isEmpty) return [];
    try {
      final token = await storage.read(key: 'token');
      Response response = await dio.get(
        '/NguoiDung/Search',
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
        ),
        queryParameters: {'keyword': keyword},
      );
      if (response.statusCode == 200) {
        return response.data
            .map<UserModel>((e) => UserModel.fromJson(e))
            .toList();
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return [];
  }

  Future<List<RestaurantModel>> SearchRestaurant(String keyword) async {
    if (keyword.isEmpty) return [];
    try {
      final token = await storage.read(key: 'token');
      Response response = await dio.get(
        '/QuanAn',
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
        ),
        queryParameters: {'searchString': keyword},
      );
      if (response.statusCode == 200) {
        return response.data
            .map<RestaurantModel>((e) => RestaurantModel.fromJson(e))
            .toList();
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return [];
  }

  Future<List<DishModel>> SearchDish(String keyword) async {
    if (keyword.isEmpty) return [];
    try {
      final token = await storage.read(key: 'token');
      Response response = await dio.get(
        '/MonAn/Search',
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
        ),
        queryParameters: {'keyword': keyword},
      );
      if (response.statusCode == 200) {
        return response.data
            .map<DishModel>((e) => DishModel.fromJson(e))
            .toList();
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return [];
  }
}

final searchServiceProvider = Provider((ref) => SearchServices());
