import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:rigow/core/extentions/app_extentions.dart';
import 'package:rigow/core/fonts/app_text.dart';
import 'package:rigow/features/authentication/presentation/widgets/authentication_appbar.dart';
import 'package:rigow/features/authentication/presentation/widgets/get_started_end_body.dart';
import 'package:rigow/features/authentication/presentation/widgets/user_registar_part/signup_part/sign_with_buttons.dart';
import 'package:rigow/l10n/app_localizations.dart';

class GetStartedPage extends StatefulWidget {
  final String role;
  const GetStartedPage({super.key, required this.role});

  @override
  State<GetStartedPage> createState() => _GetStartedPageState();
}

class _GetStartedPageState extends State<GetStartedPage> {
  String? _currentRole;
  @override
  void initState() {
    _currentRole = widget.role;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AuthenticationAppbar(
        title: AppLocalizations.of(context)!.signUp,
        automaticallyImplyLeading: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 111,
                  height: 33,
                  child: Image.asset(
                    'assets/images/rigow.png',
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 24),
                Text(
                  AppLocalizations.of(context)!.welcometoRigow,
                  style: AppTexts.title,
                ),
                const SizedBox(height: 10),
                Text(
                  AppLocalizations.of(context)!.chooseTheWay,
                  style: AppTexts.regular,
                ),
                const SizedBox(height: 24),
                SignWithButtonsWidget(
                  role: _currentRole ?? '',
                ),
                const SizedBox(height: 24),
                Padding(
                  padding: const EdgeInsets.only(right: 50),
                  child: RichText(
                    text: TextSpan(
                      style: AppTexts.small,
                      children: [
                        TextSpan(
                          text: AppLocalizations.of(context)!.agreeToOur,
                        ),
                        const TextSpan(
                          text: ' ',
                        ),
                        TextSpan(
                          text: AppLocalizations.of(context)!.termsOfServices,
                          style: const TextStyle(
                            decoration: TextDecoration.underline,
                            fontWeight: FontWeight.w500,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              launchURL('https://www.rigow.com/terms');
                            },
                        ),
                        const TextSpan(
                          text: ' ',
                        ),
                        TextSpan(
                          text: AppLocalizations.of(context)!.and,
                        ),
                        const TextSpan(
                          text: ' ',
                        ),
                        TextSpan(
                          text: AppLocalizations.of(context)!.privacyPolicy,
                          style: const TextStyle(
                            decoration: TextDecoration.underline,
                            fontWeight: FontWeight.w500,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              launchURL('https://www.rigow.com/privacy');
                            },
                        ),
                        const TextSpan(
                          text: '.',
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 84,
                ),
                GetStartedEndBody(
                  initialRole: widget.role,
                  getCurrentRole: (currentRole) {
                    setState(() {
                      _currentRole = currentRole;
                    });
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
