import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rigow/core/colors/app_colors.dart';
import 'package:rigow/core/common/buttons.dart';
import 'package:rigow/core/common/success_alert_dailog.dart';
import 'package:rigow/core/common/textfield.dart';
import 'package:rigow/core/fonts/app_text.dart';
import 'package:rigow/features/authentication/presentation/widgets/reset_password_appbar.dart';
import 'package:rigow/l10n/app_localizations.dart';

class NewPasswordPage extends StatefulWidget {
  const NewPasswordPage({super.key});

  @override
  State<NewPasswordPage> createState() => _NewPasswordPageState();
}

class _NewPasswordPageState extends State<NewPasswordPage> {
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
                    isObscuretext2 ? Icons.visibility_off : Icons.visibility,
                  ),
                ),
                hintText: AppLocalizations.of(context)!.reTypeNewPassword,
                obscureText: isObscuretext2,
              ),
              const SizedBox(height: 24),
              ValueListenableBuilder(
                valueListenable: _buttonValueNotifier,
                builder: (context, value, child) {
                  return ColoredButtonWidget(
                    grideantColors: !value
                        ? [AppColors.darkGrey, AppColors.darkGrey]
                        : AppColors.mainRed,
                    onPressed: value
                        ? () {
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
                            //
                          }
                        : null,
                    text: AppLocalizations.of(context)!.resetPassword,
                    textColor: Colors.white,
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
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