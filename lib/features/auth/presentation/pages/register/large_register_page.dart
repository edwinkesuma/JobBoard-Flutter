import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:job_board/core/constants/app_dimensions.dart';
import 'package:job_board/core/widgets/job_board_text_field.dart';
import 'package:job_board/features/auth/presentation/widgets/gradient_border_container.dart';
import 'package:lottie/lottie.dart';

import '../../../../../core/constants/app_color.dart';
import '../../../../../core/widgets/gradient_button.dart';

class LargeRegisterPage extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final Function(String) onRoleChanged;
  final Widget roles;
  final void Function() onPressed;

  const LargeRegisterPage({
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
      child: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: AppDimensions.desktopWidth),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Sign up.',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 50),
              ),
              const SizedBox(height: 30),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    Expanded(
                      child: Center(
                        child: ConstrainedBox(
                          constraints: BoxConstraints(maxWidth: 300),
                          child: Lottie.asset(
                            'assets/auth/auth_person.json',
                            repeat: true,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: ConstrainedBox(
                          constraints: const BoxConstraints(maxWidth: 450),
                          child: GradientBorderContainer(
                            padding: const EdgeInsets.all(
                              3,
                            ), // ketebalan border
                            borderRadius: BorderRadius.circular(16),
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 30,
                                vertical: 40,
                              ),
                              decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.surface,
                                // border: Border.all(color: AppColor.borderColor, width: 2),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Column(
                                children: [
                                  JobBoardTextField(
                                    hintText: 'Name',
                                    controller: nameController,
                                  ),
                                  const SizedBox(height: 15),
                                  roles,
                                  const SizedBox(height: 15),
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
                                  GradientButton(
                                    onPressed: onPressed,
                                    label: "Sign Up",
                                  ),
                                  const SizedBox(height: 20),
                                  RichText(
                                    text: TextSpan(
                                      text: "Already have an account?",
                                      children: [
                                        TextSpan(
                                          text: " Login",
                                          style: TextStyle(
                                            color: AppColor.gradient2,
                                          ),
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
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
