import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/constants/app_color.dart';
import '../../../../../core/constants/app_dimensions.dart';
import '../../../../../core/widgets/gradient_button.dart';
import '../../../../../core/widgets/job_board_text_field.dart';
import '../../widgets/gradient_border_container.dart';

class LargeLoginPage extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final void Function() onPressed;

  const LargeLoginPage({
    super.key,
    required this.emailController,
    required this.passwordController,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: AppDimensions.desktopWidth),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Sign in.',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 50),
              ),
              const SizedBox(height: 30),
              GradientBorderContainer(
                padding: const EdgeInsets.all(3), // ketebalan border
                borderRadius: BorderRadius.circular(16),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 40),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surface,
                    // border: Border.all(color: AppColor.borderColor, width: 2),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    children: [
                      JobBoardTextField(
                        hintText: 'Email',
                        controller: emailController,
                      ),
                      const SizedBox(height: 15),
                      JobBoardTextField(
                        hintText: 'Password',
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
                              text: " Register",
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
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
