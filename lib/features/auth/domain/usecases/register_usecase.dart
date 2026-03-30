import 'package:equatable/equatable.dart';

import '../../../../core/usecase/usecase.dart';
import '../../../../core/utils/typedef.dart';
import '../repositories/auth_repository.dart';

class RegisterUseCase extends UsecaseWithParams<String, RegisterParams> {
  const RegisterUseCase({required this.repository});

  final AuthRepository repository;

  @override
  ResultFuture<String> call(RegisterParams params) async {
    var response = await repository.register(
      name: params.name,
      email: params.email,
      password: params.password,
      role: params.role,
    );
    return response;
  }
}

class RegisterParams extends Equatable {
  final String name;
  final String email;
  final String password;
  final String role;

  const RegisterParams({
    required this.name,
    required this.email,
    required this.password,
    required this.role,
  });

  @override
  List<Object?> get props => [name, email, password, role];
}
