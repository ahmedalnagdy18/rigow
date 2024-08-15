import 'package:flutter/material.dart';

import 'package:rigow/features/authentication/presentation/widgets/dont_have_acc_part.dart';

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
          const DontHaveAccPart(
            blackText: 'Already have an account? ',
            redText: 'Log in',
          ),
        ],
      ),
    );
  }
}
