import 'package:dio/dio.dart';

import '../core/app_constants.dart';

class Api {
  final dio = createDio();
  Api._internal();
  static final _singleton = Api._internal();
  factory Api() => _singleton;

  static Dio createDio() {
    var dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        // connectTimeout: const Duration(seconds: 15),
        // sendTimeout: const Duration(seconds: 5),
        // receiveTimeout: const Duration(seconds: 5),
      ),
    );
    return dio;
  }
}
