import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:good_food/srcs/common/api.dart';

import '../common/storage.dart';

class ImageServices {
  final _dio = Api().dio;
  final _storage = Storage().storage;

  Future<int> uploadImage(String imagePath, int type) async {
    try {
      final token = await _storage.read(key: 'token');
      var image = await MultipartFile.fromFile(imagePath);
      final data = FormData.fromMap({
        'Type': type,
        'Image': image,
      });
      final response = await _dio.post(
        '/Image/Upload',
        data: data,
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );
      if (response.statusCode == 200) {
        return response.data;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return 0;
  }
}
