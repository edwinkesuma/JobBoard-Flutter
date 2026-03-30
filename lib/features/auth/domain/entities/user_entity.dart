import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  const UserEntity({
    required this.userId,
    required this.name,
    required this.email,
    required this.role,
    required this.createdAt,
  });

  final int userId;
  final String name;
  final String email;
  final String role;
  final DateTime? createdAt;

  @override
  List<Object?> get props => [userId, name, email, role, createdAt];
}
