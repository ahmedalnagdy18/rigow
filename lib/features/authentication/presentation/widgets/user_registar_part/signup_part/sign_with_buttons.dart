import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:rigow/core/colors/app_colors.dart';
import 'package:rigow/core/common/buttons.dart';
import 'package:rigow/core/extentions/app_extentions.dart';
import 'package:rigow/features/authentication/presentation/screens/google_part/google_signup_page.dart';
import 'package:rigow/features/authentication/presentation/screens/user_registar_part/signup_part/main_signup.dart';
import 'package:rigow/l10n/app_localizations.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:http/http.dart' as http;

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

                  UserCredential userCredential = await FirebaseAuth.instance
                      .signInWithCredential(credential);

                  User? user = userCredential.user;
                  if (user != null) {
                    String? email = user.email;
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
                        authToken: idToken,
                        email: email ?? "",
                        providerId: providerId ?? "",
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
                      print('Successfully signed in with Apple.');
                    } else {
                      print('Failed to sign in with Apple.');
                    }
                  } catch (e) {
                    print('Apple Sign-In Error: $e');
                    showErrorToastMessage(message: "Apple Sign-In failed");
                  }
                },
                text: AppLocalizations.of(context)!.continueWithApple,
                textColor: Colors.white,
              )
            : const SizedBox(),
      ],
    );
  }
}
