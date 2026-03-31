import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:job_board/core/network/dio_client.dart';
import 'package:job_board/core/router/app_router.dart';
import 'package:job_board/core/utils/secure_storage_service.dart';
import 'package:job_board/features/auth/data/datasources/remote/auth_remote_datasource.dart';
import 'package:job_board/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:job_board/features/auth/domain/repositories/auth_repository.dart';
import 'package:job_board/features/auth/domain/usecases/login_usecase.dart';
import 'package:job_board/features/auth/domain/usecases/register_usecase.dart';
import 'package:job_board/features/auth/presentation/bloc/auth_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  final Dio dio = DioClient.createDio();

  //============================================================= Authentication
  sl.registerLazySingleton<SecureStorageService>(() => SecureStorageService());
  sl.registerLazySingleton<AppRouter>(() => AppRouter(sl()));

  sl.registerLazySingleton<Dio>(() => dio);
  sl.registerLazySingleton<AuthRemoteDatasource>(
    () => AuthRemoteDatasourceImpl(dio: sl()),
  );
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(remoteDatasource: sl()),
  );
  sl.registerLazySingleton<RegisterUseCase>(
    () => RegisterUseCase(repository: sl()),
  );
  sl.registerLazySingleton<LoginUseCase>(() => LoginUseCase(repository: sl()));
  sl.registerLazySingleton<AuthBloc>(
    () => AuthBloc(
      registerUseCase: sl(),
      loginUseCase: sl(),
      storageService: sl(),
    ),
  );
}
