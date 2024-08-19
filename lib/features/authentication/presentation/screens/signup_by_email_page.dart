import 'package:flutter/material.dart';
import 'package:rigow/features/authentication/presentation/screens/login_page.dart';

import 'package:rigow/features/authentication/presentation/widgets/dont_have_acc_part.dart';

import 'package:rigow/features/authentication/presentation/widgets/signup_with_email_body.dart';
import 'package:rigow/l10n/app_localizations.dart';

class SignupByEmailPage extends StatelessWidget {
  const SignupByEmailPage({super.key, required this.onPressed});
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
            padding: const EdgeInsets.only(bottom: 10, top: 10),
            child: DontHaveAccPart(
              redTextOnTap: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => const LoginPage()));
              },
              blackText: AppLocalizations.of(context)!.alreadyHaveAnAccount,
              redText: AppLocalizations.of(context)!.logIn,
            ),
          ),
        ],
      ),
    );
  }
}
