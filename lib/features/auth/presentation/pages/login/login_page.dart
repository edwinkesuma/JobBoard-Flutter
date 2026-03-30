import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:job_board/core/utils/responsive_helper.dart';
import 'package:job_board/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:job_board/features/auth/presentation/pages/login/small_login_page.dart';

import 'large_login_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void onLogin() {
    context.read<AuthBloc>().add(
      AuthLoginRequested(
        email: emailController.text,
        password: passwordController.text,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(
        builder: (context, state) {
          return ResponsiveHelper.isSmallScreen(context)
              ? SmallLoginPage(
                  emailController: emailController,
                  passwordController: passwordController,
                  onPressed: onLogin,
                )
              : LargeLoginPage(
                  emailController: emailController,
                  passwordController: passwordController,
                  onPressed: onLogin,
                );
        },
        listener: (context, state) {
          if (state is AuthFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: Colors.red,
              ),
            );
          }
          if (state is AuthLoginSuccess) {
            context.goNamed("home");
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  state.message == "OK" ? "Login success." : "Login failed",
                ),
                backgroundColor: Colors.green,
              ),
            );
          }
        },
      ),
    );
  }
}
