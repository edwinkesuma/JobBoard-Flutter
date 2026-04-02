import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/constants/app_color.dart';
import '../../../../../core/widgets/gradient_button.dart';
import '../../../../../core/widgets/job_board_text_field.dart';

class SmallLoginPage extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final void Function() onPressed;

  const SmallLoginPage({
    super.key,
    required this.emailController,
    required this.passwordController,
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
            'Sign in.',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 50),
          ),
          const SizedBox(height: 30),
          JobBoardTextField(
            label: "Email",
            hintText: "test@mail.com",
            controller: emailController,
          ),
          const SizedBox(height: 15),
          JobBoardTextField(
            label: "Password",
            hintText: '********',
            controller: passwordController,
          ),
          const SizedBox(height: 20),
          GradientButton(onPressed: onPressed, label: "Sign In"),
          const SizedBox(height: 20),
          RichText(
            text: TextSpan(
              text: "Don't have an account yet?",
              children: [
                TextSpan(
                  text: " Login",
                  style: TextStyle(color: AppColor.gradient2),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      context.goNamed("register");
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
