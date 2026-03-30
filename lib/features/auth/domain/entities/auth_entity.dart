import 'package:equatable/equatable.dart';
import 'package:job_board/features/auth/domain/entities/user_entity.dart';

class AuthEntity extends Equatable {
  const AuthEntity({
    required this.message,
    required this.user,
    required this.jwtToken,
  });

  final String message;
  final UserEntity user;
  final String jwtToken;

  @override
  List<Object?> get props => [message, user, jwtToken];
}
