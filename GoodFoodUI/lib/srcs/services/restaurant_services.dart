import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:good_food/srcs/common/api.dart';
import 'package:good_food/srcs/common/storage.dart';
import 'package:good_food/srcs/models/google_location/location_model.dart';
import 'package:good_food/srcs/models/restaurant/restaurant_model.dart';
import 'package:good_food/srcs/models/restaurant/restaurant_type_model.dart';
import 'package:location/location.dart';

import '../core/app_constants.dart';

class RestaurantServices {
  final Dio _dio = Api().dio;
  final FlutterSecureStorage _storage = Storage().storage;

  Future<List<LocationModel>> reverseGeocoding(LocationData location) async {
    if (location.latitude == null || location.longitude == null) {
      return [];
    }
    String latlng = '${location.latitude},${location.longitude}';
    Uri uri = Uri.https(
      'rsapi.goong.io',
      'Geocode',
      {
        'latlng': latlng,
        'api_key': goongApiKey,
      },
    );
    try {
      final response = await Dio().getUri(uri);
      if (response.statusCode == 200) {
        List<LocationModel> list = [];
        for (var address in response.data["results"]) {
          list.add(LocationModel.fromJsonReverseGeocoding(address));
        }
        return list;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return [];
  }

  Future<List<LocationModel>> fetchGooglePlaces(String input) async {
    if (input.isEmpty) {
      return [];
    }
    Uri uri = Uri.https(
      'rsapi.goong.io',
      'Place/AutoComplete',
      {
        "input": input,
        "api_key": goongApiKey,
      },
    );
    try {
      final response = await Dio().getUri(uri);
      if (response.statusCode == 200) {
        List<LocationModel> list = [];
        for (var prediction in response.data["predictions"]) {
          list.add(LocationModel.fromJson(prediction));
        }
        return list;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return [];
  }

  Future<List<RestaurantTypeModel>> fetchAllRestaurantType() async {
    try {
      List<RestaurantTypeModel> restaurantTypes = [];
      final response = await _dio.request(
        '/TheLoai/All',
        options: Options(method: 'GET', responseType: ResponseType.json),
      );
      if (response.statusCode == 200) {
        for (var type in response.data) {
          restaurantTypes.add(RestaurantTypeModel.fromJson(type));
        }
      }
      return restaurantTypes;
    } catch (e) {
      debugPrint(e.toString());
    }
    return [];
  }

  Future<void> addNewRestaurant(RestaurantModel restaurant) async {
    try {
      final data = FormData.fromMap({
        "TenQuanAn": restaurant.tenQuanAn,
        "ThoiGianHoatDong": '${restaurant.gioMoCua} - ${restaurant.gioDongCua}',
        "SoDienThoai": restaurant.soDienThoai,
        "HinhAnh": await MultipartFile.fromFile(restaurant.imagePath!),
        "DiaChi": restaurant.diaChi,
        "PlaceId": restaurant.placeId,
        "IdNguoiSoHuu": 1,
        "TheLoai": restaurant.theLoai.map((e) => e.id).toList(),
      });
      await _dio.post('/QuanAn/Add', data: data);
    } catch (e) {
      rethrow;
    }
  }

  Future<List<RestaurantModel>> getRestaurantByUserId(int userId) async {
    try {
      List<RestaurantModel> restaurants = [];
      final response = await _dio.get('/QuanAn/User/${userId.toString()}');
      if (response.statusCode == 200) {
        for (var restaurant in response.data) {
          restaurants.add(RestaurantModel.fromJson(restaurant));
        }
        return restaurants;
      }
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
    return [];
  }

  Future<RestaurantModel> getRestaurantById(int id) async {
    try {
      final response = await _dio.get('/QuanAn/$id');
      final restaurant = RestaurantModel.fromJson(response.data);
      return restaurant;
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  Future<List<RestaurantModel>> searchRestaurant(String searchString) async {
    try {
      final token = await _storage.read(key: 'token');
      Response response = await _dio.get(
        '/QuanAn',
        queryParameters: {
          'searchString': searchString,
        },
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
          },
        ),
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
}

final restaurantProvider = Provider((ref) => RestaurantServices());
