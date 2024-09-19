import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rigow/core/colors/app_colors.dart';
import 'package:rigow/core/extentions/app_extentions.dart';
import 'package:rigow/features/authentication/domain/entities/authentication_entities/send_email_verification.dart';
import 'package:rigow/features/authentication/domain/entities/authentication_entities/verify_user_input.dart';
import 'package:rigow/features/authentication/presentation/cubits/verify_email_verification/send_email_verif_cubit.dart';
import 'package:rigow/features/authentication/presentation/cubits/verify_email_verification/send_email_verif_state.dart';
import 'package:rigow/features/authentication/presentation/screens/expert_registar_part/expert_main_complete.dart';
import 'package:rigow/features/authentication/presentation/screens/user_registar_part/compelete_profile_part/main_complete_profile.dart';
import 'package:rigow/features/authentication/presentation/widgets/vervication_body.dart';
import 'package:rigow/injection_container.dart';

class VerificationPage extends StatelessWidget {
  const VerificationPage(
      {super.key,
      required this.onTap,
      required this.email,
      required this.role});
  final Function() onTap;
  final String email;
  final String role;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => VerifyUserCubit(
          verifyUserUsecase: sl(), sendEmailVerificationCodeUsecase: sl()),
      child: _VerificationPage(onTap: onTap, email: email, role: role),
    );
  }
}

class _VerificationPage extends StatefulWidget {
  const _VerificationPage(
      {required this.onTap, required this.email, required this.role});
  final Function() onTap;
  final String email;
  final String role;

  @override
  State<_VerificationPage> createState() => _VerificationPageState();
}

class _VerificationPageState extends State<_VerificationPage> {
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
    return BlocConsumer<VerifyUserCubit, VerifyUserState>(
      listener: (context, state) {
        if (state is ErrorVerifyUserState) {
          showErrorToastMessage(message: state.message);
        } else if (state is SucsessVerifyUserState) {
          widget.role == 'Expert'
              ? Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => ExpertMainComplete(
                        role: widget.role,
                        firstName: state.dataForComplete.firstName,
                        lastName: state.dataForComplete.lastName,
                      )))
              : Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => MainCompleteYourProfilePage(
                        role: widget.role,
                        firstName: state.dataForComplete.firstName,
                        lastName: state.dataForComplete.lastName,
                      )));
        }
      },
      builder: (context, state) {
        return Scaffold(
            backgroundColor: Colors.white,
            body: VervicationBody(
              emailText: widget.email,
              color: state is ErrorVerifyUserState ? Colors.red : Colors.green,
              whatVerify: 'account',
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
              changeOnTap: widget.onTap,
              redText: _isTimerEnded ? 'Resend code' : getTimerText(),
              resendOnTap: () {
                if (_isTimerEnded) {
                  sendCodeAgian();
                  resetTimer();
                }
              },
            ));
      },
    );
  }

  void sendCodeAgian() {
    BlocProvider.of<VerifyUserCubit>(context)
        .sendEmailVerificationCode(SendEmailVerificationCodeInput(
      email: widget.email,
      useCase: 'EMAIL_VERIFICATION',
    ));
  }

  void succsess() {
    if (_otpCode.text.isNotEmpty) {
      BlocProvider.of<VerifyUserCubit>(context).verifyUser(VerifyUserInput(
        email: widget.email,
        verificationCode: _otpCode.text,
        useCase: 'EMAIL_VERIFICATION',
      ));
    }
  }
}
