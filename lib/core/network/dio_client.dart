import 'package:dio/dio.dart';

import 'api_endpoints.dart';

class DioClient {
  static Dio createDio({String? token}) {
    final dio = Dio(
      BaseOptions(
        baseUrl: ApiEndpoints.baseUrl,
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
        headers: {'Content-Type': 'application/json'},
      ),
    );

    // dio.interceptors.add(AuthInterceptor(token: token));

    return dio;
  }
}
