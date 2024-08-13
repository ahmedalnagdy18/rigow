import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:rigow/core/fonts/app_text.dart';
import 'package:rigow/features/authentication/presentation/widgets/authentication_appbar.dart';
import 'package:rigow/features/authentication/presentation/widgets/get_started_end_body.dart';
import 'package:rigow/features/authentication/presentation/widgets/sign_with_buttons.dart';

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const AuthenticationAppbar(
        title: 'Sign up',
        automaticallyImplyLeading: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 111,
                  height: 33,
                  child: Image.asset(
                    'assets/images/rigow.png',
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 24),
                const Text(
                  'Welcome to Rigow',
                  style: AppTexts.title,
                ),
                const SizedBox(height: 10),
                const Padding(
                  padding: EdgeInsets.only(right: 16),
                  child: Text(
                    'Choose the way you prefer to create your account',
                    style: AppTexts.regular,
                  ),
                ),
                const SizedBox(height: 24),
                const SignWithButtonsWidget(),
                const SizedBox(height: 24),
                Padding(
                  padding: const EdgeInsets.only(right: 50),
                  child: RichText(
                    text: TextSpan(
                      style: AppTexts.small,
                      children: [
                        const TextSpan(
                          text: 'By continuing, you agree to our ',
                        ),
                        TextSpan(
                          text: 'Terms of services ',
                          style: const TextStyle(
                            decoration: TextDecoration.underline,
                            fontWeight: FontWeight.w500,
                          ),
                          recognizer: TapGestureRecognizer()..onTap = () {},
                        ),
                        const TextSpan(
                          text: 'and ',
                        ),
                        TextSpan(
                          text: 'Privacy policy',
                          style: const TextStyle(
                            decoration: TextDecoration.underline,
                            fontWeight: FontWeight.w500,
                          ),
                          recognizer: TapGestureRecognizer()..onTap = () {},
                        ),
                        const TextSpan(
                          text: '.',
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 84,
                ),
                const GetStartedEndBody(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
