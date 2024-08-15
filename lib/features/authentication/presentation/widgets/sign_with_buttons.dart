import 'package:flutter/material.dart';
import 'package:rigow/core/colors/app_colors.dart';
import 'package:rigow/core/common/buttons.dart';
import 'package:rigow/features/authentication/presentation/screens/main_google_signup.dart';
import 'package:rigow/features/authentication/presentation/screens/main_signup.dart';

class SignWithButtonsWidget extends StatelessWidget {
  const SignWithButtonsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SocialAuthenticationButton(
          image: 'assets/images/email.png',
          color: AppColors.lightGrey,
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const MainSignUpPage()));
          },
          text: 'Sign up by Email',
          textColor: Colors.black,
        ),
        const SizedBox(height: 8),
        SocialAuthenticationButton(
          image: 'assets/images/google.png',
          color: AppColors.grey,
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const MainGoogleSignUpPage()));
          },
          text: 'Continue with Google',
          textColor: Colors.black,
        ),
        const SizedBox(height: 8),
        SocialAuthenticationButton(
          image: 'assets/images/facebook.png',
          color: AppColors.facebook,
          onPressed: () {},
          text: 'Continue with Facebook',
          textColor: Colors.white,
        ),
        const SizedBox(height: 8),
        SocialAuthenticationButton(
          image: 'assets/images/apple.png',
          color: Colors.black,
          onPressed: () {},
          text: 'Continue with Apple',
          textColor: Colors.white,
        ),
      ],
    );
  }
}
