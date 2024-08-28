import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rigow/core/colors/app_colors.dart';
import 'package:rigow/features/authentication/domain/entities/verify_forget_password_entity.dart';
import 'package:rigow/features/authentication/presentation/cubits/verify_forget_pass_cubit/verify_forget_cubit.dart';
import 'package:rigow/features/authentication/presentation/cubits/verify_forget_pass_cubit/verify_forget_state.dart';
import 'package:rigow/features/authentication/presentation/screens/login_part/new_password_page.dart';
import 'package:rigow/features/authentication/presentation/widgets/reset_password_appbar.dart';
import 'package:rigow/features/authentication/presentation/widgets/vervication_body.dart';
import 'package:rigow/injection_container.dart';
import 'package:rigow/l10n/app_localizations.dart';

class ResetPasswordVerifcation extends StatelessWidget {
  const ResetPasswordVerifcation({super.key, required this.email});
  final String email;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => VerifyForgetCubit(verifyForgetPasswordUsecase: sl()),
      child: _ResetPasswordVerifcation(email: email),
    );
  }
}

class _ResetPasswordVerifcation extends StatefulWidget {
  const _ResetPasswordVerifcation({required this.email});
  final String email;

  @override
  State<_ResetPasswordVerifcation> createState() =>
      _ResetPasswordVerifcationState();
}

class _ResetPasswordVerifcationState extends State<_ResetPasswordVerifcation> {
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
    return BlocConsumer<VerifyForgetCubit, VerifyForgetState>(
      listener: (context, state) {
        if (state is ErrorVerifyForgetState) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.red,
            content: Text(state.message.toString()),
            action: SnackBarAction(
              label: 'Undo',
              textColor: Colors.white,
              onPressed: () {},
            ),
          ));
        } else if (state is SucsessVerifyForgetState) {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => NewPasswordPage(
                    email: widget.email,
                    otpCode: _otpCode.text,
                  )));
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: const ResetPasswordAppbar(),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            child: Column(
              children: [
                VervicationBody(
                  color: state is ErrorVerifyForgetState
                      ? Colors.red
                      : Colors.green,
                  whatVerify: AppLocalizations.of(context)!.emailAddress,
                  blackText: _isTimerEnded
                      ? AppLocalizations.of(context)!.didnotReceiveAnyCodeYet
                      : AppLocalizations.of(context)!.resendCodeIn,
                  colors: _isTimerEnded
                      ? AppColors.mainRed
                      : [Colors.black, Colors.black],
                  controller: _otpCode,
                  onCompleted: (p0) {
                    succsess();
                  },
                  changeOnTap: () {},
                  redText: _isTimerEnded
                      ? AppLocalizations.of(context)!.resendCode
                      : getTimerText(),
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
      },
    );
  }

  void succsess() {
    if (_otpCode.text.isNotEmpty) {
      BlocProvider.of<VerifyForgetCubit>(context)
          .verifyForgetPassword(VerifyForgetPasswordEntity(
        email: widget.email,
        verificationCode: _otpCode.text,
      ));
    }
  }
}
