import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rigow/core/colors/app_colors.dart';
import 'package:rigow/core/common/buttons.dart';
import 'package:rigow/core/common/textfield.dart';
import 'package:rigow/core/common/textfield_phone.dart';
import 'package:rigow/core/extentions/app_extentions.dart';
import 'package:rigow/core/fonts/app_text.dart';
import 'package:rigow/features/authentication/domain/entities/authentication_entities/social_register_input.dart';
import 'package:rigow/features/authentication/presentation/cubits/social_register_cubit/social_register_cubit.dart';
import 'package:rigow/features/authentication/presentation/cubits/social_register_cubit/social_register_state.dart';
import 'package:rigow/features/authentication/presentation/screens/expert_registar_part/expert_main_complete.dart';
import 'package:rigow/features/authentication/presentation/screens/user_registar_part/compelete_profile_part/main_complete_profile.dart';
import 'package:rigow/features/authentication/presentation/widgets/authentication_appbar.dart';
import 'package:rigow/injection_container.dart';
import 'package:rigow/l10n/app_localizations.dart';

class GoogleSignupPage extends StatelessWidget {
  const GoogleSignupPage(
      {super.key,
      required this.firstName,
      required this.lastName,
      required this.role,
      required this.email,
      required this.authToken,
      required this.providerId});
  final String firstName;
  final String lastName;
  final String role;
  final String email;
  final String authToken;
  final String providerId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SocialRegisterCubit(socialRegisterUsecase: sl()),
      child: _GoogleSignupPage(
        firstName: firstName,
        lastName: lastName,
        role: role,
        email: email,
        authToken: authToken,
        providerId: providerId,
      ),
    );
  }
}

class _GoogleSignupPage extends StatefulWidget {
  const _GoogleSignupPage(
      {required this.firstName,
      required this.lastName,
      required this.role,
      required this.email,
      required this.authToken,
      required this.providerId});
  final String firstName;
  final String lastName;
  final String role;
  final String email;
  final String authToken;
  final String providerId;

  @override
  State<_GoogleSignupPage> createState() => _GoogleSignupPageState();
}

class _GoogleSignupPageState extends State<_GoogleSignupPage> {
  final TextEditingController _phoneNumber = TextEditingController();

  bool isObscuretext = true;
  bool _isButtonEnabled = false;
  String currentCountryCode = '+20';

  @override
  void dispose() {
    _phoneNumber.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialRegisterCubit, SocialRegisterState>(
      listener: (context, state) {
        if (state is ErrorSocialRegisterState) {
          showErrorToastMessage(message: state.message);
        } else if (state is SucsessSocialRegisterState) {
          widget.role == 'Expert'
              ? Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ExpertMainComplete(
                        firstName: widget.firstName,
                        lastName: widget.lastName,
                        role: widget.role,
                      )))
              : Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => MainCompleteYourProfilePage(
                        firstName: widget.firstName,
                        lastName: widget.lastName,
                        role: widget.role,
                      )));
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AuthenticationAppbar(
            automaticallyImplyLeading: true,
            title: AppLocalizations.of(context)!.signUp,
          ),
          body: Form(
            autovalidateMode: AutovalidateMode.always,
            onChanged: _isEnabled,
            child: SafeArea(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(AppLocalizations.of(context)!.signupWithGoogle,
                        style: AppTexts.title),
                    Text(
                      AppLocalizations.of(context)!.completeYourAccount,
                      style: AppTexts.miniRegular,
                    ),
                    const SizedBox(height: 24),
                    Row(
                      children: [
                        Expanded(
                          child: TextFieldWidget(
                            readOnly: true,
                            hintText: widget.firstName,
                            obscureText: false,
                            hintTextColor: Colors.black,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: TextFieldWidget(
                            readOnly: true,
                            hintText: widget.lastName,
                            obscureText: false,
                            hintTextColor: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 32),
                    Phonetextfield(
                      initialCountryCode: 'EG',
                      onCountryChanged: (country) {
                        currentCountryCode = '+${country.dialCode}';
                      },
                      validator: (value) => _phoneNumber.text.isNotEmpty
                          ? null
                          : "Please enter your Mobile number",
                      controller: _phoneNumber,
                    ),
                    const SizedBox(height: 24),
                    ColoredButtonWidget(
                      grideantColors: !_isButtonEnabled
                          ? [AppColors.darkGrey, AppColors.darkGrey]
                          : AppColors.mainRed,
                      onPressed: _isButtonEnabled
                          ? () {
                              _socialRegisterButton(context);
                            }
                          : null,
                      text: state is LoadingSocialRegisterState
                          ? AppLocalizations.of(context)!.loading
                          : AppLocalizations.of(context)!.next,
                      textColor: Colors.white,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void _socialRegisterButton(BuildContext context) {
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
    final input = SocialRegisterInput(
      firstName: widget.firstName,
      lastName: widget.lastName,
      phone: currentCountryCode + _phoneNumber.text,
      email: widget.email,
      authToken: ProviderAuth(authToken: widget.authToken),
      provider: ProviderEnum.google,
      providerId: widget.providerId,
      loginDetails: LoginDetailsInput("", deviceType),
      role: userRoleEnum,
    );
    BlocProvider.of<SocialRegisterCubit>(context)
        .socialRegisterFunc(input: input);
  }

  void _isEnabled() {
    if (_phoneNumber.text.isNotEmpty) {
      _isButtonEnabled = true;
      setState(() {});
    } else {
      _isButtonEnabled = false;
      setState(() {});
    }
    setState(() {});
  }
}
