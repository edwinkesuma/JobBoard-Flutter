import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/constants/app_color.dart';
import '../../../../../core/widgets/gradient_button.dart';
import '../../../../../core/widgets/job_board_text_field.dart';

class SmallRegisterPage extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final Function(String) onRoleChanged;
  final Widget roles;
  final void Function() onPressed;

  const SmallRegisterPage({
    super.key,
    required this.nameController,
    required this.emailController,
    required this.passwordController,
    required this.onRoleChanged,
    required this.roles,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Sign up.',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 50),
          ),
          const SizedBox(height: 30),
          JobBoardTextField(hintText: 'Name', controller: nameController),
          const SizedBox(height: 15),
          roles,
          const SizedBox(height: 15),
          JobBoardTextField(hintText: 'Email', controller: emailController),
          const SizedBox(height: 15),
          JobBoardTextField(
            hintText: 'Password',
            controller: passwordController,
          ),
          const SizedBox(height: 20),
          GradientButton(onPressed: onPressed, label: "Sign Up"),
          const SizedBox(height: 20),
          RichText(
            text: TextSpan(
              text: "Already have an account?",
              children: [
                TextSpan(
                  text: " Login",
                  style: TextStyle(color: AppColor.gradient2),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      context.goNamed("login");
                    },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
