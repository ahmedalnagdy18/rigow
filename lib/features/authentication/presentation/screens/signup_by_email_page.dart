import 'package:flutter/material.dart';
import 'package:rigow/core/colors/app_colors.dart';
import 'package:rigow/core/fonts/app_text.dart';

import 'package:rigow/features/authentication/presentation/widgets/signup_with_email_body.dart';

class SignupByEmailPage extends StatelessWidget {
  const SignupByEmailPage({super.key, required this.onPressed});
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SignupWithEmailBody(
                    onPressed: onPressed,
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Already have an account? ',
                        style: AppTexts.miniRegular),
                    RedText(
                        text: 'Log in',
                        gradient: LinearGradient(colors: AppColors.mainRed))
                  ],
                ),
                const SizedBox(height: 24),
                RedText(
                    text: 'Explore as a guest',
                    gradient: LinearGradient(
                      colors: AppColors.mainRed,
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
