import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:rigow/core/colors/app_colors.dart';
import 'package:rigow/core/common/buttons.dart';
import 'package:rigow/core/extentions/app_extentions.dart';
import 'package:rigow/features/authentication/domain/entities/authentication_entities/social_login_input.dart';
import 'package:rigow/features/authentication/presentation/cubits/check_social_login/check_social_login_cubit.dart';
import 'package:rigow/features/authentication/presentation/cubits/check_social_login/check_social_login_state.dart';
import 'package:rigow/features/authentication/presentation/screens/google_part/google_signup_page.dart';
import 'package:rigow/features/authentication/presentation/screens/user_registar_part/signup_part/main_signup.dart';
import 'package:rigow/features/timeline/screens/timeline_page.dart';
import 'package:rigow/injection_container.dart';
import 'package:rigow/l10n/app_localizations.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:http/http.dart' as http;

class SignWithButtonsWidget extends StatelessWidget {
  const SignWithButtonsWidget({super.key, required this.role});
  final String role;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CheckSocialLoginCubit(
          checkSocialProviderUsecase: sl(), socialLoginUsecase: sl()),
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

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CheckSocialLoginCubit, CheckSocialLoginState>(
        listener: (context, state) {
      if (state is SucsessSocialLoginState) {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const TimelinePage(),
        ));
      }
    }, builder: (context, state) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // email button
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
          // google button
          BlocListener<CheckSocialLoginCubit, CheckSocialLoginState>(
            listener: (context, state) {
              if (state is ErrorSocialLoginState) {
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

                print(state);
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
          // facebook button
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
          // apple button
          Platform.isIOS
              ? SocialAuthenticationButton(
                  image: 'assets/images/apple.png',
                  color: Colors.black,
                  onPressed: () async {
                    try {
                      final credential =
                          await SignInWithApple.getAppleIDCredential(
                        scopes: [
                          AppleIDAuthorizationScopes.email,
                          AppleIDAuthorizationScopes.fullName,
                        ],
                        webAuthenticationOptions: WebAuthenticationOptions(
                          clientId: kIsWeb
                              ? 'com.example.webclient'
                              : 'com.example.mobileclient',
                          redirectUri: kIsWeb
                              ? Uri.parse('https://${Uri.base.host}/callback')
                              : Uri.parse(
                                  'https://your-server.com/callbacks/sign_in_with_apple'),
                        ),
                        nonce: 'example-nonce',
                        state: 'example-state',
                      );

                      final signInWithAppleEndpoint = Uri(
                        scheme: 'https',
                        host: 'your-server.com',
                        path: '/sign_in_with_apple',
                        queryParameters: <String, String>{
                          'code': credential.authorizationCode,
                          if (credential.givenName != null)
                            'firstName': credential.givenName!,
                          if (credential.familyName != null)
                            'lastName': credential.familyName!,
                          'useBundleId':
                              !kIsWeb && (Platform.isIOS || Platform.isMacOS)
                                  ? 'true'
                                  : 'false',
                          if (credential.state != null)
                            'state': credential.state!,
                        },
                      );

                      final response = await http.Client().post(
                        signInWithAppleEndpoint,
                      );

                      if (response.statusCode == 200) {
                        //   print('Successfully signed in with Apple.');
                      } else {
                        //   print('Failed to sign in with Apple.');
                      }
                    } catch (e) {
                      //    print('Apple Sign-In Error: $e');
                      showErrorToastMessage(message: "Apple Sign-In failed");
                    }
                  },
                  text: AppLocalizations.of(context)!.continueWithApple,
                  textColor: Colors.white,
                )
              : const SizedBox(),
        ],
      );
    });
  }

  // void _checkSocial(BuildContext context) {
  //   print(_providerId);
  //   BlocProvider.of<CheckSocialLoginCubit>(context).checkSocialFunc(
  //       input: CheckSocialProviderInput(
  //     authToken: CheckProviderAuth(authToken: _authToken ?? ""),
  //     email: _email ?? "",
  //     provider: CheckProviderEnum.google,
  //     providerId: _providerId ?? "",
  //   ));
  // }

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
}
