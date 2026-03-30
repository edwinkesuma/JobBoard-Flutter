import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:job_board/core/utils/secure_storage_service.dart';
import 'package:job_board/features/auth/domain/usecases/login_usecase.dart';
import 'package:job_board/features/auth/domain/usecases/register_usecase.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final RegisterUseCase registerUseCase;
  final LoginUseCase loginUseCase;
  final SecureStorageService storageService;

  AuthBloc({
    required this.registerUseCase,
    required this.loginUseCase,
    required this.storageService,
  }) : super(AuthInitial()) {
    on<AuthRegisterRequested>(_onAuthRegisterRequested);
    on<AuthLoginRequested>(_onAuthLoginRequested);
  }

  void _onAuthRegisterRequested(
    AuthRegisterRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    log("registering...");
    try {
      final response = await registerUseCase(
        RegisterParams(
          name: event.name,
          email: event.email,
          password: event.password,
          role: event.role,
        ),
      );
      response.fold((l) => emit(AuthFailure(message: l.message)), (r) {
        emit(AuthRegisterSuccess(message: r));
      });
    } catch (e) {
      emit(AuthFailure(message: e.toString().replaceFirst("Exception: ", "")));
    }
  }

  void _onAuthLoginRequested(
    AuthLoginRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    final response = await loginUseCase(
      LoginParams(email: event.email, password: event.password),
    );
    response.fold((l) => emit(AuthFailure(message: l.message)), (r) {
      storageService.saveJwtToken(r.jwtToken);
      emit(AuthLoginSuccess(message: r.message));
    });
  }
}
