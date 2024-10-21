import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:rigow/core/common/buttons.dart';
import 'package:rigow/core/extentions/app_extentions.dart';
import 'package:rigow/l10n/app_localizations.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:http/http.dart' as http;

class AppleButton extends StatelessWidget {
  const AppleButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SocialAuthenticationButton(
      image: 'assets/images/apple.png',
      color: Colors.black,
      onPressed: () async {
        try {
          final credential = await SignInWithApple.getAppleIDCredential(
            scopes: [
              AppleIDAuthorizationScopes.email,
              AppleIDAuthorizationScopes.fullName,
            ],
            webAuthenticationOptions: WebAuthenticationOptions(
              clientId:
                  kIsWeb ? 'com.example.webclient' : 'com.example.mobileclient',
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
              'useBundleId': !kIsWeb && (Platform.isIOS || Platform.isMacOS)
                  ? 'true'
                  : 'false',
              if (credential.state != null) 'state': credential.state!,
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
    );
  }
}
