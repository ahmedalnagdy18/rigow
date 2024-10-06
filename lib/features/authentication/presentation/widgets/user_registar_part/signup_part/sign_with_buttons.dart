import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:rigow/core/colors/app_colors.dart';
import 'package:rigow/core/common/buttons.dart';
import 'package:rigow/features/authentication/presentation/screens/google_part/google_signup_page.dart';
import 'package:rigow/features/authentication/presentation/screens/user_registar_part/signup_part/main_signup.dart';
import 'package:rigow/l10n/app_localizations.dart';

class SignWithButtonsWidget extends StatelessWidget {
  final String role;
  const SignWithButtonsWidget({super.key, required this.role});

  @override
  Widget build(BuildContext context) {
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
                      role: role,
                    )));
          },
          text: AppLocalizations.of(context)!.signUpByEmail,
          textColor: Colors.black,
        ),
        const SizedBox(height: 8),
        // google button
        SocialAuthenticationButton(
          image: 'assets/images/google.png',
          color: AppColors.grey,
          onPressed: () {
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
                GoogleSignInAccount? googleUser = await googleSignIn.signIn();

                if (googleUser != null) {
                  GoogleSignInAuthentication googleAuth =
                      await googleUser.authentication;

                  final OAuthCredential credential =
                      GoogleAuthProvider.credential(
                    accessToken: googleAuth.accessToken,
                    idToken: googleAuth.idToken,
                  );

                  UserCredential userCredential = await FirebaseAuth.instance
                      .signInWithCredential(credential);

                  User? user = userCredential.user;
                  if (user != null) {
                    String? fullName = user.displayName;
                    String firstName =
                        fullName != null ? fullName.split(' ')[0] : '';
                    String lastName =
                        fullName != null ? fullName.split(' ')[1] : '';

                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => GoogleSignupPage(
                        role: role,
                        firstName: firstName,
                        lastName: lastName,
                      ),
                    ));
                  }
                }
              } catch (error) {
                'error';
              }
            }

            handleSignIn();
          },
          text: AppLocalizations.of(context)!.continuewithGoogle,
          textColor: Colors.black,
        ),
        const SizedBox(height: 8),
        // facebook button
        SocialAuthenticationButton(
          image: 'assets/images/facebook.png',
          color: AppColors.facebook,
          onPressed: () {},
          text: AppLocalizations.of(context)!.continueWithFacebook,
          textColor: Colors.white,
        ),
        SizedBox(height: Platform.isIOS ? 8 : 0),
        // apple button
        Platform.isIOS
            ? SocialAuthenticationButton(
                image: 'assets/images/apple.png',
                color: Colors.black,
                onPressed: () {},
                text: AppLocalizations.of(context)!.continueWithApple,
                textColor: Colors.white,
              )
            : const SizedBox(),
      ],
    );
  }
}
