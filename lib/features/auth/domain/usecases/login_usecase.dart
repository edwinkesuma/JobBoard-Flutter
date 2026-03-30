import 'package:equatable/equatable.dart';
import 'package:job_board/features/auth/domain/entities/auth_entity.dart';

import '../../../../core/usecase/usecase.dart';
import '../../../../core/utils/typedef.dart';
import '../repositories/auth_repository.dart';

class LoginUseCase extends UsecaseWithParams<AuthEntity, LoginParams> {
  const LoginUseCase({required this.repository});

  final AuthRepository repository;

  @override
  ResultFuture<AuthEntity> call(LoginParams params) async {
    var response = await repository.login(
      email: params.email,
      password: params.password,
    );
    return response;
  }
}

class LoginParams extends Equatable {
  final String email;
  final String password;

  const LoginParams({required this.email, required this.password});

  @override
  List<Object?> get props => [email, password];
}
