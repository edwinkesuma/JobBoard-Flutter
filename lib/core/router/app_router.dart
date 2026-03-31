import 'dart:developer';

import 'package:go_router/go_router.dart';
import 'package:job_board/core/router/gorouter_refresh_stream.dart';
import 'package:job_board/features/auth/presentation/pages/login/login_page.dart';
import 'package:job_board/features/auth/presentation/pages/register/register_page.dart';
import 'package:job_board/features/home/presentation/pages/home_page.dart';
import 'package:job_board/features/job/presentation/pages/job_page.dart';

import '../../features/auth/presentation/bloc/auth_bloc.dart';

class AppRouter {
  final AuthBloc authBloc;

  AppRouter(this.authBloc);

  late final GoRouter router = GoRouter(
    initialLocation: "/",
    refreshListenable: GoRouterRefreshStream(authBloc.stream),
    redirect: (context, state) {
      final authState = authBloc.state;
      final isLoggedIn = authState is AuthLoginSuccess;

      log('redirect called');
      log('location: ${state.matchedLocation}');
      log('authState: $authState');

      final isInAuthPage =
          state.matchedLocation == '/login' ||
          state.matchedLocation == '/register';

      if (!isLoggedIn && !isInAuthPage) {
        return '/login';
      }

      if (isLoggedIn && isInAuthPage) {
        final user = authState.user;

        if (user.role == "COMPANY") {
          return '/company/jobs';
        }

        return '/';
      }

      return null;
    },
    routes: [
      // GoRoute(path: "/", name: "splashScreen", builder: (context, state) => const SplashScreen(),)
      GoRoute(
        path: "/register",
        name: "register",
        builder: (context, state) {
          return RegisterPage();
        },
      ),
      GoRoute(
        path: "/login",
        name: "login",
        builder: (context, state) {
          return LoginPage();
        },
      ),
      GoRoute(
        path: "/",
        name: "home",
        builder: (context, state) {
          return HomePage();
        },
      ),
      GoRoute(
        path: "/company/jobs",
        name: "jobs",
        builder: (context, state) {
          return JobPage();
        },
      ),
    ],
  );
}
