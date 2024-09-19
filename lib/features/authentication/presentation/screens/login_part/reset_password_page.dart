import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rigow/core/colors/app_colors.dart';
import 'package:rigow/core/common/buttons.dart';
import 'package:rigow/core/common/textfield.dart';
import 'package:rigow/core/extentions/app_extentions.dart';
import 'package:rigow/core/fonts/app_text.dart';
import 'package:rigow/features/authentication/domain/entities/authentication_entities/forget_pass_input.dart';
import 'package:rigow/features/authentication/domain/entities/authentication_entities/send_email_verification.dart';
import 'package:rigow/features/authentication/presentation/cubits/forget_password/forget_pass_cubit.dart';
import 'package:rigow/features/authentication/presentation/cubits/forget_password/forget_pass_state.dart';
import 'package:rigow/features/authentication/presentation/screens/login_part/reset_password_verifcation.dart';
import 'package:rigow/features/authentication/presentation/widgets/login_part/reset_password_appbar.dart';
import 'package:rigow/injection_container.dart';
import 'package:rigow/l10n/app_localizations.dart';

class ResetPasswordPage extends StatelessWidget {
  const ResetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ForgetPassCubit(
          forgetPassUsecase: sl(), sendEmailVerificationCodeUsecase: sl()),
      child: const _ResetPasswordPage(),
    );
  }
}

class _ResetPasswordPage extends StatefulWidget {
  const _ResetPasswordPage();

  @override
  State<_ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<_ResetPasswordPage> {
  final TextEditingController _email = TextEditingController();
  bool _isButtonEnabled = false;

  @override
  void dispose() {
    _email.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ForgetPassCubit, ForgetPassState>(
        listener: (context, state) {
      if (state is ErrorForgetPass) {
        showErrorToastMessage(message: state.message);
      }
    }, builder: (context, state) {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: const ResetPasswordAppbar(),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          child: Form(
            autovalidateMode: AutovalidateMode.always,
            onChanged: _isEnabled,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(AppLocalizations.of(context)!.resetYourPassword,
                    style: AppTexts.title),
                const SizedBox(height: 8),
                Text(
                  AppLocalizations.of(context)!.resetExplian,
                  style: AppTexts.regular,
                ),
                const SizedBox(height: 16),
                TextFieldWidget(
                  inputFormatters: [
                    FilteringTextInputFormatter.deny(RegExp(r'\s')),
                  ],
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) => EmailValidator.validate(value!)
                      ? null
                      : AppLocalizations.of(context)!.errorEmail,
                  mycontroller: _email,
                  hintText: AppLocalizations.of(context)!.emailAddress,
                  obscureText: false,
                ),
                const SizedBox(height: 24),
                BlocListener<ForgetPassCubit, ForgetPassState>(
                  listener: (context, state) {
                    if (state is SucsessEmailVerificationCodeState) {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => ResetPasswordVerifcation(
                                email: _email.text,
                              )));
                    }
                  },
                  child: ColoredButtonWidget(
                    grideantColors: !_isButtonEnabled
                        ? [AppColors.darkGrey, AppColors.darkGrey]
                        : AppColors.mainRed,
                    onPressed: () {
                      if (_isButtonEnabled) {
                        _nextButton(context);
                      }
                    },
                    text: state is LoadingEmailVerificationCodeState
                        ? AppLocalizations.of(context)!.loading
                        : AppLocalizations.of(context)!.next,
                    textColor: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }

  void _nextButton(BuildContext context) {
    BlocProvider.of<ForgetPassCubit>(context).forget(ForgetPassInput(
      email: _email.text,
    ));
    BlocProvider.of<ForgetPassCubit>(context)
        .sendEmailVerificationCode(SendEmailVerificationCodeInput(
      email: _email.text,
      useCase: 'PASSWORD_RESET',
    ));
  }

  void _isEnabled() {
    bool isEmailValid = EmailValidator.validate(_email.text);
    if (isEmailValid && _email.text.isNotEmpty) {
      _isButtonEnabled = true;
      setState(() {});
    } else {
      _isButtonEnabled = false;
      setState(() {});
    }
    setState(() {});
  }
}
