import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rigow/core/colors/app_colors.dart';
import 'package:rigow/features/authentication/presentation/screens/new_password_page.dart';
import 'package:rigow/features/authentication/presentation/widgets/reset_password_appbar.dart';
import 'package:rigow/features/authentication/presentation/widgets/vervication_body.dart';

class ResetPasswordVerifcation extends StatefulWidget {
  const ResetPasswordVerifcation({super.key});

  @override
  State<ResetPasswordVerifcation> createState() =>
      _ResetPasswordVerifcationState();
}

class _ResetPasswordVerifcationState extends State<ResetPasswordVerifcation> {
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
      appBar: const ResetPasswordAppbar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: Column(
          children: [
            VervicationBody(
              whatVerify: 'email address',
              blackText: _isTimerEnded
                  ? 'Didn’t receive any code yet?'
                  : 'Resend code in',
              colors: _isTimerEnded
                  ? AppColors.mainRed
                  : [Colors.black, Colors.black],
              controller: _otpCode,
              onCompleted: (p0) {
                succsess();
              },
              changeOnTap: () {},
              redText: _isTimerEnded ? 'Resend code' : getTimerText(),
              resendOnTap: () {
                if (_isTimerEnded) {
                  resetTimer();
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  void succsess() {
    if (_otpCode.text.isNotEmpty) {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const NewPasswordPage()));
    }
  }
}
