import 'package:flutter/material.dart';
import 'package:rigow/core/colors/app_colors.dart';
import 'package:rigow/core/common/buttons.dart';
import 'package:rigow/core/fonts/app_text.dart';
import 'package:rigow/l10n/app_localizations.dart';

class WelcomeToRigowPage extends StatelessWidget {
  const WelcomeToRigowPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    width: 111,
                    height: 33,
                    child: Image.asset(
                      'assets/images/rigow.png',
                      fit: BoxFit.fill,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RedText(
                          text: AppLocalizations.of(context)!.welcome,
                          gradient: LinearGradient(colors: AppColors.mainRed)),
                      const SizedBox(width: 4),
                      RedText(
                          text: 'Ahmed',
                          gradient: LinearGradient(colors: AppColors.mainRed)),
                    ],
                  ),
                  const SizedBox(height: 32),
                  Container(
                    width: 101,
                    height: 101,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                    child: const CircleAvatar(
                      backgroundImage: AssetImage('assets/images/man.png'),
                    ),
                  ),
                  const SizedBox(height: 32),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      AppLocalizations.of(context)!.welcomeDescreption,
                      textAlign: TextAlign.center,
                      style: AppTexts.miniRegular,
                    ),
                  ),
                  const SizedBox(height: 24),
                  ColoredButtonWidget(
                      text: AppLocalizations.of(context)!.next,
                      onPressed: () {
                        // Navigator.of(context).push(MaterialPageRoute(
                        //     builder: (context) => const WelcomeToRigowPage()));
                      },
                      grideantColors: AppColors.mainRed,
                      textColor: Colors.white),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
