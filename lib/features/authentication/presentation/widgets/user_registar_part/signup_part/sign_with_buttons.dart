import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:rigow/core/colors/app_colors.dart';
import 'package:rigow/core/common/buttons.dart';
import 'package:rigow/core/extentions/app_extentions.dart';
import 'package:rigow/core/shared_prefrances/shared_prefrance.dart';
import 'package:rigow/features/authentication/domain/entities/authentication_entities/check_social_provider_input.dart';
import 'package:rigow/features/authentication/domain/entities/authentication_entities/social_login_input.dart';
import 'package:rigow/features/authentication/domain/entities/authentication_entities/social_merge_input.dart';
import 'package:rigow/features/authentication/domain/model/check_provider_model.dart';
import 'package:rigow/features/authentication/presentation/cubits/check_social_login/check_social_login_cubit.dart';
import 'package:rigow/features/authentication/presentation/cubits/check_social_login/check_social_login_state.dart';
import 'package:rigow/features/authentication/presentation/screens/google_part/google_signup_page.dart';
import 'package:rigow/features/authentication/presentation/screens/user_registar_part/signup_part/main_signup.dart';
import 'package:rigow/features/authentication/presentation/widgets/user_registar_part/signup_part/apple_button.dart';
import 'package:rigow/features/timeline/screens/timeline_page.dart';
import 'package:rigow/injection_container.dart';
import 'package:rigow/l10n/app_localizations.dart';

class SignWithButtonsWidget extends StatelessWidget {
  const SignWithButtonsWidget({super.key, required this.role});
  final String role;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CheckSocialLoginCubit(
          checkSocialProviderUsecase: sl(),
          socialLoginUsecase: sl(),
          socialMergeUsecase: sl()),
      child: _SignWithButtonsWidget(
        role: role,
      ),
    );
  }
}

class _SignWithButtonsWidget extends StatefulWidget {
  final String role;
  const _SignWithButtonsWidget({required this.role});

  @override
  State<_SignWithButtonsWidget> createState() => _SignWithButtonsWidgetState();
}

class _SignWithButtonsWidgetState extends State<_SignWithButtonsWidget> {
  String? _email;
  String? _firstName;
  String? _lastName;
  String? _authToken;
  String? _providerId;
  CheckProviderEnum? registerEnum = CheckProviderEnum.register;
  CheckProviderEnum? mergeEnum = CheckProviderEnum.merge;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CheckSocialLoginCubit, CheckSocialLoginState>(
        listener: (context, state) {
      if (state is SucsessSocialLoginState) {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const TimelinePage(),
        ));
      } else if (state is SucsessCheckSocialState) {
        if (state.myData.actionRequired == "REGISTER") {
          //   print("=====  ${state.myData.actionRequired}");
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => GoogleSignupPage(
              role: widget.role,
              firstName: _firstName ?? "",
              lastName: _lastName ?? '',
              authToken: _authToken ?? "",
              email: _email ?? "",
              providerId: _providerId ?? "",
            ),
          ));
        } else if (state.myData.actionRequired == "MERGE") {
          //   print('hi MERGE');
          final token = state.myData.token;
          SharedPrefrance.instanc.setToken(key: 'token', token: token ?? '');
          _socialMerge(context);
        }
      } else if (state is ErrorCheckSocialState) {
        //   print("nooooooooo");
        //   print("___________::::: ${state.message.toString()}");
      } else if (state is SucsessSocialMergeState) {
        //   print('Sucsess Merge');
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const TimelinePage(),
        ));
      } else if (state is ErrorSocialMergeState) {
        //   print('Erorr Merge');
        //   print("====== ${state.message}");
      }
    }, builder: (context, state) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          //! email button
          SocialAuthenticationButton(
            image: 'assets/images/email.png',
            color: AppColors.lightGrey,
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => MainSignUpPage(
                        role: widget.role,
                      )));
            },
            text: AppLocalizations.of(context)!.signUpByEmail,
            textColor: Colors.black,
          ),
          const SizedBox(height: 8),
          //! google button
          BlocListener<CheckSocialLoginCubit, CheckSocialLoginState>(
            listener: (context, state) {
              if (state is ErrorSocialLoginState && _firstName != null) {
                _checkSocial(context);
                //     print('login field');
              }
            },
            child: SocialAuthenticationButton(
              image: 'assets/images/google.png',
              color: AppColors.grey,
              onPressed: () async {
                Future<void> handleSignIn() async {
                  const List<String> scopes = <String>[
                    'email',
                    'https://www.googleapis.com/auth/contacts.readonly',
                  ];

                  GoogleSignIn googleSignIn = GoogleSignIn(
                    scopes: scopes,
                    clientId:
                        '906792168270-mg0u0g97voavth782mjghvoqe5mq0b5p.apps.googleusercontent.com',
                  );

                  try {
                    GoogleSignInAccount? googleUser =
                        await googleSignIn.signIn();
                    final idToken =
                        (await googleUser?.authentication)?.idToken ?? "";
                    //  print("===idToken1====== ${idToken.substring(0, 300)}");

                    //    print("===idToken2====== ${idToken.substring(300)}");
                    final providerId = googleUser?.id;
                    //    print("===providerId====== $providerId");

                    if (googleUser != null) {
                      GoogleSignInAuthentication googleAuth =
                          await googleUser.authentication;

                      final OAuthCredential credential =
                          GoogleAuthProvider.credential(
                        accessToken: googleAuth.accessToken,
                        idToken: googleAuth.idToken,
                      );

                      UserCredential userCredential = await FirebaseAuth
                          .instance
                          .signInWithCredential(credential);

                      User? user = userCredential.user;
                      if (user != null) {
                        String? fullName = user.displayName;
                        _email = user.email;
                        _firstName =
                            fullName != null ? fullName.split(' ')[0] : '';
                        _lastName =
                            fullName != null ? fullName.split(' ')[1] : '';
                        _authToken = idToken;
                        _providerId = providerId;
                      }
                    }
                  } catch (error) {
                    'error';
                  }
                  _socialLogin(context);
                }

                handleSignIn();

                // _checkSocial(context);

                //      print("======  $firstName1");
                //     print("====== $lastName1");
                //      print(authToken1);
                //      print(providerId1);
              },
              text: AppLocalizations.of(context)!.continuewithGoogle,
              textColor: Colors.black,
            ),
          ),
          const SizedBox(height: 8),
          //! facebook button
          SocialAuthenticationButton(
            image: 'assets/images/facebook.png',
            color: AppColors.facebook,
            onPressed: () {
              showErrorToastMessage(
                  message: "Can't sign with facebook right now !");
            },
            text: AppLocalizations.of(context)!.continueWithFacebook,
            textColor: Colors.white,
          ),
          SizedBox(height: Platform.isIOS ? 8 : 0),
          //! apple button
          Platform.isIOS ? const AppleButton() : const SizedBox(),
        ],
      );
    });
  }

  _checkSocial(BuildContext context) {
    BlocProvider.of<CheckSocialLoginCubit>(context).checkSocialFunc(
        input: CheckSocialProviderInput(
      authToken: CheckProviderAuth(authToken: _authToken ?? ""),
      email: _email ?? "",
      provider: CheckProviderSocialEnum.google,
      providerId: _providerId ?? "",
    ));
  }

  void _socialLogin(BuildContext context) {
    SocialUserRoleEnum userRoleEnum;
    SocialDeviceEnum deviceType;

    if (widget.role == 'Expert') {
      userRoleEnum = SocialUserRoleEnum.expert;
    } else if (widget.role == 'User') {
      userRoleEnum = SocialUserRoleEnum.user;
    } else {
      userRoleEnum = SocialUserRoleEnum.admin;
    }
    if (Platform.isAndroid) {
      deviceType = SocialDeviceEnum.android;
    } else if (Platform.isIOS) {
      deviceType = SocialDeviceEnum.ios;
    } else {
      deviceType = SocialDeviceEnum.desktop;
    }
    BlocProvider.of<CheckSocialLoginCubit>(context).socialLogin(
        input: SocialLoginInput(
      role: userRoleEnum,
      loginDetails: SocialLoginDetailsInput("", deviceType),
      provider: SocialProviderEnum.google,
      providerId: _providerId ?? "",
    ));
  }

  _socialMerge(BuildContext context) {
    SocialMergeDeviceEnum deviceType;
    if (Platform.isAndroid) {
      deviceType = SocialMergeDeviceEnum.android;
    } else if (Platform.isIOS) {
      deviceType = SocialMergeDeviceEnum.ios;
    } else {
      deviceType = SocialMergeDeviceEnum.desktop;
    }
    BlocProvider.of<CheckSocialLoginCubit>(context).socialMerge(
        input: SocialMergeInput(
      loginDetails: SocialMergeDetailsInput("", deviceType),
      authToken: SocialMergeAuth(authToken: _authToken ?? ""),
      email: _email ?? "",
      provider: SocialMergeEnum.google,
      providerId: _providerId ?? "",
    ));
  }
}
