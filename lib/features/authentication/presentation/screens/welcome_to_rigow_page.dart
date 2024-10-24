import 'package:flutter/material.dart';
import 'package:rigow/core/colors/app_colors.dart';
import 'package:rigow/core/common/buttons.dart';
import 'package:rigow/core/extentions/app_extentions.dart';
import 'package:rigow/core/fonts/app_text.dart';
import 'package:rigow/features/home/screens/the_main_page.dart';
import 'package:rigow/l10n/app_localizations.dart';

class WelcomeToRigowPage extends StatelessWidget {
  final String firstName;
  final String role;
  final String imageOfprofile;

  const WelcomeToRigowPage(
      {super.key,
      required this.firstName,
      required this.role,
      required this.imageOfprofile});

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
                          text: firstName,
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
                    child: CircleAvatar(
                        backgroundColor: Colors.white,
                        backgroundImage: NetworkImage(
                          addBaseUrls(imageOfprofile),
                        )),
                  ),
                  const SizedBox(height: 32),
                  role == 'Expert'
                      ? Text(
                          AppLocalizations.of(context)!.yourRequestSuccessfully,
                          style: AppTexts.midTitle
                              .copyWith(fontWeight: FontWeight.w600),
                        )
                      : const SizedBox(),
                  SizedBox(height: role == 'Expert' ? 16 : 0),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      role == 'Expert'
                          ? AppLocalizations.of(context)!
                              .expertWelcomeDescreption
                          : AppLocalizations.of(context)!.welcomeDescreption,
                      textAlign: TextAlign.center,
                      style: AppTexts.miniRegular,
                    ),
                  ),
                  const SizedBox(height: 24),
                  ColoredButtonWidget(
                      text: AppLocalizations.of(context)!.next,
                      onPressed: () {
                        Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                            builder: (context) => const TheMainHomePage(),
                          ),
                          (Route<dynamic> route) => false,
                        );
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
