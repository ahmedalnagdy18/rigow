import 'package:flutter/material.dart';
import 'package:rigow/core/common/buttons.dart';
import 'package:rigow/core/common/textfield.dart';
import 'package:rigow/core/common/textfield_phone.dart';

class SignupWithEmailBody extends StatelessWidget {
  const SignupWithEmailBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Text(
          'Sign up with Email',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        const Text(
          'Enter the required information',
          style: TextStyle(
            fontSize: 14,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 24),
        const Row(
          children: [
            Expanded(
              child: TextFieldWidget(
                hintText: 'First name',
                obscureText: false,
              ),
            ),
            SizedBox(width: 8),
            Expanded(
              child: TextFieldWidget(
                hintText: 'Last name',
                obscureText: false,
              ),
            ),
          ],
        ),
        const SizedBox(height: 32),
        const Phonetextfield(),
        const SizedBox(height: 16),
        const TextFieldWidget(
          hintText: 'Email address',
          obscureText: false,
        ),
        const SizedBox(height: 16),
        const TextFieldWidget(
          hintText: 'Password',
          obscureText: false,
        ),
        const SizedBox(height: 24),
        ColoredButtonWidget(
          grideantColors: const [Color(0xFFCCCCCC), Color(0xFFCCCCCC)],
          onPressed: () {},
          text: 'Next',
          textColor: Colors.white,
        ),
      ],
    );
  }
}
