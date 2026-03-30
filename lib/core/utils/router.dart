import 'package:go_router/go_router.dart';
import 'package:job_board/features/auth/presentation/pages/login/login_page.dart';
import 'package:job_board/features/auth/presentation/pages/register/register_page.dart';
import 'package:job_board/features/home/presentation/pages/home_page.dart';

final router = GoRouter(
  initialLocation: "/",
  // redirect: (context, state) {
  //   final isLoggedIn = context.read<AuthBloc>().state is AuthLoginSuccess;
  //
  //   if (!isLoggedIn && state.matchedLocation != '/login') {
  //     return '/login';
  //   }
  //
  //   if (isLoggedIn && state.matchedLocation == '/login') {
  //     return '/home';
  //   }
  //
  //   return null;
  // },
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
      path: "/home",
      name: "home",
      builder: (context, state) {
        return HomePage();
      },
    ),
  ],
);
