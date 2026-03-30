import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:job_board/core/network/api_endpoints.dart';
import 'package:job_board/features/auth/data/models/auth_model.dart';

abstract class AuthRemoteDatasource {
  Future<String> registerAccount({
    required String name,
    required String email,
    required String password,
    String role = "JOB_SEEKER",
  });

  Future<AuthModel> loginAccount({
    required String email,
    required String password,
  });
}

class AuthRemoteDatasourceImpl implements AuthRemoteDatasource {
  final Dio dio;

  AuthRemoteDatasourceImpl({required this.dio});

  @override
  Future<String> registerAccount({
    required String name,
    required String email,
    required String password,
    String role = "JOB_SEEKER",
  }) async {
    Map<String, dynamic> body = {
      "name": name,
      "email": email,
      "password": password,
      "role": role,
    };

    try {
      final response = await dio.post(ApiEndpoints.register, data: body);
      log("response ${response}");
      return "${response.data}";
    } on DioException catch (e) {
      final data = e.response?.data;
      if (data is Map<String, dynamic>) {
        throw Exception(data["message"] ?? "Register failed");
      }

      if (data is String) {
        throw Exception(data);
      }

      throw Exception("Register failed");
    }
  }

  @override
  Future<AuthModel> loginAccount({
    required String email,
    required String password,
  }) async {
    Map<String, dynamic> body = {"email": email, "password": password};

    try {
      final response = await dio.post(ApiEndpoints.login, data: body);
      return AuthModel.fromJson(response.data);
    } on DioException catch (e) {
      throw Exception(e.response?.data["message"] ?? "Login Failed");
    }
  }
}
