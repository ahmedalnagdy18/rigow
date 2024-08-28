import 'package:flutter/material.dart';
import 'package:rigow/core/colors/app_colors.dart';
import 'package:rigow/core/common/buttons.dart';
import 'package:rigow/features/authentication/presentation/screens/google_part/main_google_signup.dart';
import 'package:rigow/features/authentication/presentation/screens/user_registar_part/signup_part/main_signup.dart';
import 'package:rigow/l10n/app_localizations.dart';

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
          text: AppLocalizations.of(context)!.signUpByEmail,
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
          text: AppLocalizations.of(context)!.continuewithGoogle,
          textColor: Colors.black,
        ),
        const SizedBox(height: 8),
        SocialAuthenticationButton(
          image: 'assets/images/facebook.png',
          color: AppColors.facebook,
          onPressed: () {},
          text: AppLocalizations.of(context)!.continueWithFacebook,
          textColor: Colors.white,
        ),
        const SizedBox(height: 8),
        SocialAuthenticationButton(
          image: 'assets/images/apple.png',
          color: Colors.black,
          onPressed: () {},
          text: AppLocalizations.of(context)!.continueWithApple,
          textColor: Colors.white,
        ),
      ],
    );
  }
}
