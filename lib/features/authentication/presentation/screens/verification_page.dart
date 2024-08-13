import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rigow/core/colors/app_colors.dart';
import 'package:rigow/core/fonts/app_text.dart';
import 'package:rigow/features/authentication/presentation/screens/main_complete_profile.dart';
import 'package:rigow/features/authentication/presentation/widgets/otp_widget.dart';

class VerificationPage extends StatefulWidget {
  const VerificationPage({super.key, required this.onTap});
  final Function() onTap;

  @override
  State<VerificationPage> createState() => _VerificationPageState();
}

class _VerificationPageState extends State<VerificationPage> {
  final TextEditingController _otpCode = TextEditingController();
  late Timer _timer;
  int _start = 120;
  bool _isTimerEnded = false;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_start > 0) {
          _start--;
        } else {
          _isTimerEnded = true;
          _timer.cancel();
        }
      });
    });
  }

  void resetTimer() {
    setState(() {
      _start = 120;
      _isTimerEnded = false;
    });
    startTimer();
  }

  String getTimerText() {
    int minutes = _start ~/ 60;
    int seconds = _start % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  @override
  void dispose() {
    _timer.cancel();
    _otpCode.dispose();
    super.dispose();
  }

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
            style: AppTexts.title,
          ),
          const SizedBox(height: 8),
          const Text('Enter the 4-digit verification code sent to your email ',
              style: AppTexts.miniRegular),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text('“ahmed34@gmail.com“', style: AppTexts.medium),
              InkWell(
                onTap: widget.onTap,
                child: RedText(
                    text: ' Change',
                    gradient: LinearGradient(colors: AppColors.mainRed)),
              )
            ],
          ),
          const SizedBox(height: 24),
          OtpWidget(
            controller: _otpCode,
            onCompleted: (p0) {
              succsess();
            },
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Text(
                _isTimerEnded
                    ? 'Didn’t receive any code yet?'
                    : 'Resend code in',
                style: AppTexts.miniRegular,
              ),
              const SizedBox(width: 8),
              InkWell(
                onTap: _isTimerEnded ? resetTimer : null,
                child: RedText(
                  text: _isTimerEnded ? 'Resend code' : getTimerText(),
                  gradient: LinearGradient(
                      colors: _isTimerEnded
                          ? AppColors.mainRed
                          : [Colors.black, Colors.black]),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void succsess() {
    if (_otpCode.text.isNotEmpty) {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => const MainCompleteYourProfilePage()));
    }
  }
}
