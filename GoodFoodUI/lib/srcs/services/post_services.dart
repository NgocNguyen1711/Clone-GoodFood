import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:good_food/srcs/core/app_constants.dart';
import 'package:good_food/srcs/services/image_services.dart';

import '../common/api.dart';
import '../common/storage.dart';
import '../models/comment/comment_model.dart';
import '../models/post_detail/post_detail_model.dart';
import '../models/post_overview/post_overview_model.dart';
import '../models/restaurant_review/restaurant_review_model.dart';

class PostServices {
  final FlutterSecureStorage _storage = Storage().storage;
  final Dio _dio = Api().dio;

  Future<List<PostOverviewModel>> getPostByUserId(int userId) async {
    try {
      final token = await _storage.read(key: 'token');
      Response response = await _dio.get(
        '/BaiViet/User/$userId',
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
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

  Future<List<PostOverviewModel>> getPostOverviews() async {
    try {
      final token = await _storage.read(key: 'token');
      Response response = await _dio.request(
        '/BaiViet/Overview',
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
          method: 'GET',
          responseType: ResponseType.json,
        ),
      );
      if (response.statusCode == 200) {
        return response.data.map<PostOverviewModel>((e) {
          return PostOverviewModel.fromJson(e);
        }).toList();
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return [];
  }

  Future<PostDetailModel?> getPostDetail(int postId) async {
    try {
      final token = await _storage.read(key: 'token');
      Response response = await _dio.get('/BaiViet/Detail/$postId',
          options: Options(headers: {'Authorization': 'Bearer $token'}));
      if (response.statusCode == 200) {
        return PostDetailModel.fromJson(response.data);
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }

  Future addLike(int postId) async {
    try {
      final token = await _storage.read(key: 'token');
      await _dio.post(
        '/BaiViet/Like/$postId',
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future removeLike(int postId) async {
    try {
      final token = await _storage.read(key: 'token');
      await _dio.post(
        '/BaiViet/Unlike/$postId',
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<List<CommentModel>> getCommentByPostId(int postId) async {
    try {
      final token = await _storage.read(key: 'token');
      Response response = await _dio.get(
        '/BinhLuan/$postId',
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );
      if (response.statusCode == 200) {
        return response.data
            .map<CommentModel>((e) => CommentModel.fromJson(e))
            .toList();
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return [];
  }

  Future<CommentModel?> addComment(String comment, int postId) async {
    try {
      final token = await _storage.read(key: 'token');
      Response response = await _dio.post(
        '/BinhLuan/Add/$postId',
        queryParameters: {
          'comment': comment,
        },
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );
      if (response.statusCode == 200) {
        return CommentModel.fromJson(response.data);
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }

  Future deleteComment(int commentId) async {
    try {
      final token = await _storage.read(key: 'token');
      await _dio.delete(
        '/BinhLuan/Delete/$commentId',
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<int> addNewPost(RestaurantReview restaurantReview) async {
    try {
      final token = await _storage.read(key: 'token');
      final dishes = List<Map<String, Object>>.empty(growable: true);
      for (var dish in restaurantReview.dishes) {
        var imageId = await ImageServices()
            .uploadImage(dish.image!.path, ImageType.dish.index);
        dishes.add({
          'id': dish.id,
          'review': dish.review,
          'imageId': imageId,
        });
      }
      final data = {
        'restaurantId': restaurantReview.id,
        'title': restaurantReview.title,
        'review': restaurantReview.review,
        'imageId': await ImageServices()
            .uploadImage(restaurantReview.image!.path, ImageType.post.index),
        'hygiene': restaurantReview.hygiene,
        'taste': restaurantReview.taste,
        'space': restaurantReview.space,
        'price': restaurantReview.price,
        'service': restaurantReview.service,
        'dishes': dishes,
      };
      final response = await _dio.post(
        '/BaiViet/Add',
        data: data,
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
}

final postProvider = Provider<PostServices>(
  (ref) => PostServices(),
);
