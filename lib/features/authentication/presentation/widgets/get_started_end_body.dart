import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:rigow/core/common/buttons.dart';

class GetStartedEndBody extends StatelessWidget {
  const GetStartedEndBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RichText(
            text: TextSpan(
                style: const TextStyle(fontSize: 14, color: Colors.black),
                children: [
              const TextSpan(
                text: 'Already have an account? ',
              ),
              TextSpan(
                text: 'Log in',
                style: const TextStyle(
                  color: Colors.red,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
                recognizer: TapGestureRecognizer()..onTap = () {},
              ),
            ])),
        const SizedBox(height: 24),
        TranceparentButtonWidget(
          borderColor: Colors.red,
          onPressed: () {},
          text: 'Continue as an expert',
          textColor: Colors.red,
        ),
        const SizedBox(height: 24),
        const Text(
          'Explore as a guest',
          style: TextStyle(
            fontSize: 14,
            color: Colors.red,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
