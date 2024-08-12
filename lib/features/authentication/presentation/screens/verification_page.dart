import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:rigow/features/authentication/presentation/widgets/otp_widget.dart';

class VerificationPage extends StatelessWidget {
  VerificationPage({super.key});
  final TextEditingController _otpCode = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Text(
            'Verify your account',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          RichText(
            text: TextSpan(
              style: const TextStyle(fontSize: 14, color: Colors.black),
              children: [
                const TextSpan(
                  text:
                      'Enter the 4-digit verification code sent to your email ',
                ),
                const TextSpan(
                  text: '“ahmed34@gmail.com“',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                TextSpan(
                  text: ' Change',
                  style: const TextStyle(
                    color: Colors.red,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                  recognizer: TapGestureRecognizer()..onTap = () {},
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          OtpWidget(
            controller: _otpCode,
          ),
          const SizedBox(height: 16),
          const Row(
            children: [
              Text(
                'Resend code in',
                style: TextStyle(fontSize: 14),
              ),
              SizedBox(width: 8),
              Text(
                '01:59',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
