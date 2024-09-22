import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:good_food/srcs/common/storage.dart';
import 'package:good_food/srcs/models/dish/dish_model.dart';

import '../common/api.dart';

class DishServices {
  final FlutterSecureStorage _storage = Storage().storage;
  final Dio _dio = Api().dio;

  Future<List<DishModel>> getDishByRestaurantId(int restaurantId) async {
    try {
      final token = await _storage.read(key: 'token');
      final response = await _dio.get(
        '/MonAn/$restaurantId',
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
        ),
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
