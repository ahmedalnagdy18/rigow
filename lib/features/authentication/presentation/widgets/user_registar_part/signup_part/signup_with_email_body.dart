import 'dart:io';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rigow/core/colors/app_colors.dart';
import 'package:rigow/core/common/buttons.dart';
import 'package:rigow/core/common/textfield.dart';
import 'package:rigow/core/common/textfield_phone.dart';
import 'package:rigow/core/fonts/app_text.dart';
import 'package:rigow/features/authentication/domain/entities/authentication_entities/register_input.dart';
import 'package:rigow/features/authentication/domain/entities/authentication_entities/send_email_verification.dart';
import 'package:rigow/features/authentication/presentation/cubits/register_cubit/register_cubit.dart';
import 'package:rigow/features/authentication/presentation/cubits/register_cubit/register_state.dart';
import 'package:rigow/l10n/app_localizations.dart';

class SignupWithEmailBody extends StatefulWidget {
  const SignupWithEmailBody(
      {super.key,
      required this.controller,
      required this.onNextTap,
      required this.role});
  final PageController controller;
  final String role;
  final Function(String email) onNextTap;

  @override
  State<SignupWithEmailBody> createState() => _SignupWithEmailBodyState();
}

class _SignupWithEmailBodyState extends State<SignupWithEmailBody> {
  final _email = TextEditingController();
  final _phoneNumber = TextEditingController();
  final _password = TextEditingController();
  final _firstName = TextEditingController();
  final _lastName = TextEditingController();

  final _firstNameFocusNode = FocusNode();
  final _lastNameFocusNode = FocusNode();

  final _formKey = GlobalKey<FormState>();

  String _currentCountryCode = '+20';
  bool isObscuretext = true;
  bool _isButtonEnabled = false;
  bool _showValidationError = false;
  @override
  void initState() {
    super.initState();

    _firstNameFocusNode.addListener(() {
      if (_firstNameFocusNode.hasFocus) {
        setState(() {
          _showValidationError = false;
        });
      }
    });

    _lastNameFocusNode.addListener(() {
      if (_lastNameFocusNode.hasFocus) {
        setState(() {
          _showValidationError = false;
        });
      }
    });
  }

  @override
  void dispose() {
    _email.dispose();
    _phoneNumber.dispose();
    _password.dispose();
    _firstNameFocusNode.dispose();
    _lastNameFocusNode.dispose();
    super.dispose();
  }

  RegExp regex =
      RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return Form(
        //   autovalidateMode: AutovalidateMode.onUserInteraction,
        key: _formKey,
        onChanged: _isEnabled,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(AppLocalizations.of(context)!.signUpWithEmail,
                style: AppTexts.title),
            Text(
              AppLocalizations.of(context)!.enterTheRequiredInformation,
              style: AppTexts.miniRegular,
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: TextFieldWidget(
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z]'))
                    ],
                    maxLength: 15,
                    counterText: '',
                    mycontroller: _firstName,
                    hintText: AppLocalizations.of(context)!.firstName,
                    obscureText: false,
                    focusNode: _firstNameFocusNode,
                    autofocus: true,
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: TextFieldWidget(
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z]')),
                    ],
                    maxLength: 15,
                    counterText: '',
                    mycontroller: _lastName,
                    hintText: AppLocalizations.of(context)!.lastName,
                    obscureText: false,
                    focusNode: _lastNameFocusNode,
                    autofocus: true,
                  ),
                ),
              ],
            ),
            if (_showValidationError &&
                (_firstName.text.length < 2 || _lastName.text.length < 2))
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Text(
                  "${AppLocalizations.of(context)?.firstNameValidator} and ${AppLocalizations.of(context)?.lastName}",
                  style: TextStyle(
                    color: AppColors.errorColor,
                    fontSize: 12,
                  ),
                ),
              ),
            const SizedBox(height: 32),
            Phonetextfield(
              initialCountryCode: 'EG',
              onCountryChanged: (country) {
                _currentCountryCode = '+${country.dialCode}';
              },
              validator: (value) => _phoneNumber.text.isNotEmpty
                  ? null
                  : "Please enter your Mobile number",
              controller: _phoneNumber,
            ),
            const SizedBox(height: 16),
            TextFieldWidget(
              inputFormatters: [
                FilteringTextInputFormatter.deny(RegExp(r'\s')),
              ],
              keyboardType: TextInputType.emailAddress,
              validator: (value) => EmailValidator.validate(value!)
                  ? null
                  : AppLocalizations.of(context)!.emailValidator,
              mycontroller: _email,
              hintText: AppLocalizations.of(context)!.emailAddress,
              obscureText: false,
            ),
            const SizedBox(height: 16),
            TextFieldWidget(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your password';
                } else if (value.length < 8) {
                  return AppLocalizations.of(context)!.passwordValidator;
                } else if (!regex.hasMatch(value)) {
                  return 'password must contain Capital and symbols';
                }
                return null;
              },
              inputFormatters: [
                FilteringTextInputFormatter.deny(RegExp(r'\s')),
              ],
              mycontroller: _password,
              suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    isObscuretext = !isObscuretext;
                  });
                },
                child: Icon(
                  size: 20,
                  isObscuretext ? Icons.visibility_off : Icons.visibility,
                ),
              ),
              hintText: AppLocalizations.of(context)!.password,
              obscureText: isObscuretext,
            ),
            const SizedBox(height: 24),
            BlocListener<RegisterCubit, RegisterState>(
              listener: (context, state) {
                if (state is SucsessRegsisterState) {
                  BlocProvider.of<RegisterCubit>(context)
                      .sendEmailVerificationCode(SendEmailVerificationCodeInput(
                    email: _email.text,
                    useCase: 'EMAIL_VERIFICATION',
                  ));
                }
                if (state is SucsessEmailVerificationCodeState) {
                  widget.onNextTap(_email.text);
                }
              },
              child: BlocBuilder<RegisterCubit, RegisterState>(
                builder: (context, state) {
                  return ColoredButtonWidget(
                    grideantColors: !_isButtonEnabled
                        ? [AppColors.darkGrey, AppColors.darkGrey]
                        : AppColors.mainRed,
                    onPressed: _isButtonEnabled
                        ? () {
                            if (_formKey.currentState!.validate()) {
                              if (_firstName.text.length < 2 ||
                                  _lastName.text.length < 2) {
                                setState(() {
                                  _showValidationError = true;
                                });
                              } else {
                                _registerButton(context);
                              }
                            }
                          }
                        : null,
                    text: state is LoadingRegsisterState
                        ? AppLocalizations.of(context)!.loading
                        : AppLocalizations.of(context)!.next,
                    textColor: Colors.white,
                  );
                },
              ),
            ),
          ],
        ),
      );
    });
  }

  void _registerButton(BuildContext context) {
    UserRoleEnum userRoleEnum;
    DeviceEnum deviceType;
    if (widget.role == 'Expert') {
      userRoleEnum = UserRoleEnum.expert;
    } else if (widget.role == 'User') {
      userRoleEnum = UserRoleEnum.user;
    } else {
      userRoleEnum = UserRoleEnum.admin;
    }
    //-----------------------
    if (Platform.isAndroid) {
      deviceType = DeviceEnum.android;
    } else if (Platform.isIOS) {
      deviceType = DeviceEnum.ios;
    } else {
      deviceType = DeviceEnum.desktop;
    }
    final input = RegisterInput(
      firstName: _firstName.text,
      lastName: _lastName.text,
      phone: _currentCountryCode + _phoneNumber.text,
      email: _email.text,
      password: _password.text,
      loginDetails: LoginDetailsInput("", deviceType),
      role: userRoleEnum,

      //UserRoleEnum.user,
    );
    BlocProvider.of<RegisterCubit>(context).registerFuc(input: input);
  }

  void _isEnabled() {
    if (_firstName.text.isNotEmpty &&
        _lastName.text.isNotEmpty &&
        _email.text.isNotEmpty &&
        _password.text.isNotEmpty &&
        _phoneNumber.text.isNotEmpty) {
      _isButtonEnabled = true;
    } else {
      _isButtonEnabled = false;
    }
    setState(() {});
  }
}
