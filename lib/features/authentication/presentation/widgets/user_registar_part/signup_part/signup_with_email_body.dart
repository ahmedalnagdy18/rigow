import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rigow/core/colors/app_colors.dart';
import 'package:rigow/core/common/buttons.dart';
import 'package:rigow/core/common/textfield.dart';
import 'package:rigow/core/common/textfield_phone.dart';
import 'package:rigow/core/fonts/app_text.dart';
import 'package:rigow/features/authentication/domain/entities/register_part_entity/signup_part_entity/register_input.dart';
import 'package:rigow/features/authentication/domain/entities/send_email_verification.dart';
import 'package:rigow/features/authentication/presentation/cubits/register_cubit/register_cubit.dart';
import 'package:rigow/features/authentication/presentation/cubits/register_cubit/register_state.dart';
import 'package:rigow/l10n/app_localizations.dart';

class SignupWithEmailBody extends StatefulWidget {
  const SignupWithEmailBody(
      {super.key, required this.controller, required this.onNextTap});
  final PageController controller;
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

  String _currentCountryCode = '+20';
  bool isObscuretext = true;
  bool _isButtonEnabled = false;

  @override
  void dispose() {
    _email.dispose();
    _phoneNumber.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: AutovalidateMode.always,
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
                    FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z]')),
                  ],
                  maxLength: 15,
                  counterText: '',
                  mycontroller: _firstName,
                  hintText: AppLocalizations.of(context)!.firstName,
                  obscureText: false,
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
                ),
              ),
            ],
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
                    .sendEmailVerificationCode(SendEmailVerificationCodeEntity(
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
                  onPressed: () {
                    if (_isButtonEnabled) {
                      _registerButton(context);
                    }
                  },
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
  }

  void _registerButton(BuildContext context) {
    final input = RegisterInput(
      firstName: _firstName.text,
      lastName: _lastName.text,
      phone: _currentCountryCode + _phoneNumber.text,
      email: _email.text,
      password: _password.text,
      loginDetails: LoginDetailsInput("", DeviceEnum.android),
      role: UserRoleEnum.user,
    );

    BlocProvider.of<RegisterCubit>(context).registerFuc(input: input);
  }

  void _isEnabled() {
    bool isEmailValid = EmailValidator.validate(_email.text);
    if (isEmailValid &&
        _firstName.text.isNotEmpty &&
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
