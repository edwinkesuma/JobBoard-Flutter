import 'package:dartz/dartz.dart';
import 'package:job_board/core/errors/failure.dart';
import 'package:job_board/core/utils/typedef.dart';
import 'package:job_board/features/auth/data/datasources/remote/auth_remote_datasource.dart';
import 'package:job_board/features/auth/data/models/auth_model.dart';
import 'package:job_board/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDatasource remoteDatasource;

  AuthRepositoryImpl({required this.remoteDatasource});

  @override
  ResultFuture<String> register({
    required String name,
    required String email,
    required String password,
    required String role,
  }) async {
    return await _register(() {
      return remoteDatasource.registerAccount(
        name: name,
        email: email,
        password: password,
        role: role,
      );
    });
  }

  ResultFuture<String> _register(Future<String> Function() register) async {
    // try {
    final remote = await register();
    return right(remote);
    // } catch (e) {
    //   return left(
    //     const GeneralFailure(message: "Something went wrong", statusCode: 0),
    //   );
    // }
  }

  @override
  ResultFuture<AuthModel> login({
    required String email,
    required String password,
  }) async {
    return await _login(() {
      return remoteDatasource.loginAccount(email: email, password: password);
    });
  }

  ResultFuture<AuthModel> _login(Future<AuthModel> Function() login) async {
    try {
      final remote = await login();
      return right(remote);
    } catch (e) {
      return left(
        const GeneralFailure(message: "Something went wrong", statusCode: 0),
      );
    }
  }
}
