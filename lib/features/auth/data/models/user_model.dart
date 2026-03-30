import 'package:job_board/features/auth/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel({
    required super.createdAt,
    required super.email,
    required super.name,
    required super.role,
    required super.userId,
  });

  UserModel copyWith({
    DateTime? createdAt,
    String? email,
    String? name,
    String? role,
    int? userId,
  }) {
    return UserModel(
      createdAt: createdAt ?? this.createdAt,
      email: email ?? this.email,
      name: name ?? this.name,
      role: role ?? this.role,
      userId: userId ?? this.userId,
    );
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      createdAt: json['createdAt'] != null
          ? DateTime.parse(json['createdAt'])
          : null,
      email: json["email"],
      name: json["name"],
      role: json["role"],
      userId: json["userId"],
    );
  }

  Map<String, dynamic> toJson() => {
    "createdAt": createdAt,
    "email": email,
    "name": name,
    "role": role,
    "userId": userId,
  };

  @override
  List<Object?> get props => [createdAt, email, name, role, userId];
}
