import 'package:job_board/features/auth/data/models/user_model.dart';
import 'package:job_board/features/auth/domain/entities/auth_entity.dart';

class AuthModel extends AuthEntity {
  const AuthModel({
    required super.message,
    required super.user,
    required super.jwtToken,
  });

  AuthModel copyWith({String? message, UserModel? user, String? jwtToken}) {
    return AuthModel(
      message: message ?? this.message,
      user: user ?? this.user,
      jwtToken: jwtToken ?? this.jwtToken,
    );
  }

  factory AuthModel.fromJson(Map<String, dynamic> json) {
    return AuthModel(
      message: json["message"],
      user: UserModel.fromJson(json["user"]),
      jwtToken: json["jwtToken"],
    );
  }

  Map<String, dynamic> toJson() => {
    "message": message,
    "user": (user as UserModel).toJson(),
    "jwtToken": jwtToken,
  };

  @override
  List<Object?> get props => [message, user, jwtToken];
}
