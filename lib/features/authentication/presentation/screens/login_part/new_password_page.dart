import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rigow/core/colors/app_colors.dart';
import 'package:rigow/core/common/buttons.dart';
import 'package:rigow/core/common/success_alert_dailog.dart';
import 'package:rigow/core/common/textfield.dart';
import 'package:rigow/core/extentions/app_extentions.dart';
import 'package:rigow/core/fonts/app_text.dart';
import 'package:rigow/features/authentication/domain/entities/authentication_entities/reset_password_input.dart';
import 'package:rigow/features/authentication/presentation/cubits/reset_password_cubit/reset_password_cubit.dart';
import 'package:rigow/features/authentication/presentation/cubits/reset_password_cubit/reset_password_state.dart';
import 'package:rigow/features/authentication/presentation/widgets/login_part/reset_password_appbar.dart';
import 'package:rigow/injection_container.dart';
import 'package:rigow/l10n/app_localizations.dart';

class NewPasswordPage extends StatelessWidget {
  const NewPasswordPage(
      {super.key, required this.email, required this.otpCode});
  final String email;
  final String otpCode;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ResetPasswordCubit(resetPasswordUsecase: sl()),
      child: _NewPasswordPage(email: email, otpCode: otpCode),
    );
  }
}

class _NewPasswordPage extends StatefulWidget {
  const _NewPasswordPage({required this.email, required this.otpCode});
  final String email;
  final String otpCode;
  @override
  State<_NewPasswordPage> createState() => _NewPasswordPageState();
}

class _NewPasswordPageState extends State<_NewPasswordPage> {
  Color _validationColor = Colors.red;
  Color _validationColor2 = Colors.red;
  final _passwordTextController = TextEditingController();
  final _newPassword = TextEditingController();
  bool isObscuretext = true;
  bool isObscuretext2 = true;
  final ValueNotifier<bool> _buttonValueNotifier = ValueNotifier<bool>(false);
  @override
  void dispose() {
    _passwordTextController.dispose();
    _newPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ResetPasswordCubit, ResetPasswordState>(
      listener: (context, state) {
        if (state is ErrorResetPasswordState) {
          showErrorToastMessage(message: state.message);
        }
      },
      builder: (context, state) {
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
                    AppLocalizations.of(context)!.confirmPasswordExplian,
                    style: AppTexts.regular,
                  ),
                  const SizedBox(height: 16),
                  TextFieldWidget(
                    errorStyle: TextStyle(color: _validationColor),
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(
                        RegExp(r'[a-zA-Z0-9!@#$%^&*(),.?":{}|<>]'),
                      ),
                      LengthLimitingTextInputFormatter(16),
                    ],
                    onChanged: (text) {
                      _isEnabled();
                      _updateValidationColor(text);
                    },
                    validator: (value) {
                      return _updateValidationColor(value ?? '');
                    },
                    mycontroller: _passwordTextController,
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          isObscuretext = !isObscuretext;
                        });
                      },
                      child: Icon(
                        color: AppColors.tapBorder,
                        size: 20,
                        isObscuretext ? Icons.visibility_off : Icons.visibility,
                      ),
                    ),
                    hintText: AppLocalizations.of(context)!.newPassword,
                    obscureText: isObscuretext,
                  ),
                  const SizedBox(height: 16),
                  TextFieldWidget(
                    errorStyle: TextStyle(color: _validationColor2),
                    onChanged: (text) {
                      _isEnabled();
                      _updateValidationColor2(text);
                    },
                    validator: (value) {
                      return _updateValidationColor2(value ?? "");
                    },
                    mycontroller: _newPassword,
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          isObscuretext2 = !isObscuretext2;
                        });
                      },
                      child: Icon(
                        color: AppColors.tapBorder,
                        size: 20,
                        isObscuretext2
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                    ),
                    hintText: AppLocalizations.of(context)!.reTypeNewPassword,
                    obscureText: isObscuretext2,
                  ),
                  const SizedBox(height: 24),
                  ValueListenableBuilder(
                    valueListenable: _buttonValueNotifier,
                    builder: (context, value, child) {
                      return BlocListener<ResetPasswordCubit,
                          ResetPasswordState>(
                        listener: (context, state) {
                          if (state is SucsessResetPasswordtate) {
                            showDialog(
                              barrierDismissible: false,
                              context: context,
                              builder: (context) {
                                return SuccessAlertDailog(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                    Navigator.of(context).pop();
                                  },
                                );
                              },
                            );
                          }
                        },
                        child: ColoredButtonWidget(
                          grideantColors: !value
                              ? [AppColors.darkGrey, AppColors.darkGrey]
                              : AppColors.mainRed,
                          onPressed: value
                              ? () {
                                  _resetPassword(context);
                                }
                              : null,
                          text: state is LoadingResetPasswordState
                              ? AppLocalizations.of(context)!.loading
                              : AppLocalizations.of(context)!.resetPassword,
                          textColor: Colors.white,
                        ),
                      );
                    },
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void _resetPassword(BuildContext context) {
    BlocProvider.of<ResetPasswordCubit>(context)
        .resetPassword(ResetPasswordInput(
      email: widget.email,
      code: widget.otpCode,
      newPassword: _newPassword.text,
    ));
  }

  String _updateValidationColor(String value) {
    if (!RegExp(r'(?=.*[A-Za-z])').hasMatch(value) ||
        !RegExp(r'(?=.*\d)').hasMatch(value) ||
        !RegExp(r'(?=.*[!@#$%^&*(),.?":{}|<>])').hasMatch(value)) {
      _validationColor = Colors.orange;
      return AppLocalizations.of(context)!.weak;
    }
    if (RegExp(r'(?=.*[A-Za-z])').hasMatch(value) &&
        RegExp(r'(?=.*\d)').hasMatch(value) &&
        RegExp(r'(?=.*[!@#$%^&*(),.?":{}|<>])').hasMatch(value)) {
      _validationColor = Colors.green;
      return AppLocalizations.of(context)!.strong;
    }
    return value;
  }

  String _updateValidationColor2(String value) {
    if (_passwordTextController.text == _newPassword.text &&
        _passwordTextController.text.isNotEmpty) {
      _validationColor2 = Colors.green;
      return AppLocalizations.of(context)!.matched;
    }
    if (_passwordTextController.text != _newPassword.text &&
        _passwordTextController.text.isNotEmpty) {
      _validationColor2 = AppColors.errorColor;
      return AppLocalizations.of(context)!.equal;
    }
    return '';
  }

  void _isEnabled() {
    if (_newPassword.text.isNotEmpty &&
        _passwordTextController.text.isNotEmpty &&
        _passwordTextController.text == _newPassword.text) {
      _buttonValueNotifier.value = true;
    } else {
      _buttonValueNotifier.value = false;
    }
    setState(() {});
  }
}
