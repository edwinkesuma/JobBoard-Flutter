import 'package:job_board/core/utils/typedef.dart';
import 'package:job_board/features/auth/domain/entities/auth_entity.dart';

abstract class AuthRepository {
  ResultFuture<String> register({
    required String name,
    required String email,
    required String password,
    required String role,
  });

  ResultFuture<AuthEntity> login({
    required String email,
    required String password,
  });
}
