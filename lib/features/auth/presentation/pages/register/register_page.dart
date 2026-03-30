import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:job_board/core/utils/responsive_helper.dart';
import 'package:job_board/features/auth/presentation/pages/register/small_register_page.dart';

import '../../bloc/auth_bloc.dart';
import '../../widgets/role_button.dart';
import 'large_register_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  String selectedRole = "JOB_SEEKER";

  @override
  void dispose() {
    // TODO: implement dispose
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void onRoleChanged(String role) {
    setState(() {
      selectedRole = role;
    });
  }

  void onRegister() {
    context.read<AuthBloc>().add(
      AuthRegisterRequested(
        name: nameController.text,
        email: emailController.text,
        password: passwordController.text,
        role: selectedRole,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget roles = ConstrainedBox(
      constraints: BoxConstraints(maxWidth: 400),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: RoleButton(
              label: "Job Seeker",
              value: "JOB_SEEKER",
              selectedRole: selectedRole,
              onRoleChanged: onRoleChanged,
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: RoleButton(
              label: "Company",
              value: "COMPANY",
              selectedRole: selectedRole,
              onRoleChanged: onRoleChanged,
            ),
          ),
        ],
      ),
    );
    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(
        builder: (context, state) {
          return ResponsiveHelper.isSmallScreen(context)
              ? SmallRegisterPage(
                  nameController: nameController,
                  emailController: emailController,
                  passwordController: passwordController,
                  onRoleChanged: onRoleChanged,
                  roles: roles,
                  onPressed: onRegister,
                )
              : LargeRegisterPage(
                  nameController: nameController,
                  emailController: emailController,
                  passwordController: passwordController,
                  onRoleChanged: onRoleChanged,
                  roles: roles,
                  onPressed: onRegister,
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
          if (state is AuthRegisterSuccess) {
            context.goNamed("login");
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: Colors.green,
              ),
            );
          }
        },
      ),
    );
  }
}
