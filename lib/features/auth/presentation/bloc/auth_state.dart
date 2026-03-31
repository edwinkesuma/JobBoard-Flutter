part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthLoginSuccess extends AuthState {
  final String message;
  final UserEntity user;

  AuthLoginSuccess({required this.message, required this.user});
}

final class AuthRegisterSuccess extends AuthState {
  final String message;

  AuthRegisterSuccess({required this.message});
}

final class AuthFailure extends AuthState {
  final String message;

  AuthFailure({required this.message});
}

final class AuthLoading extends AuthState {}
