import 'package:flutter/material.dart';
import 'package:rigow/core/colors/app_colors.dart';
import 'package:rigow/core/common/buttons.dart';
import 'package:rigow/core/fonts/app_text.dart';
import 'package:rigow/features/authentication/presentation/screens/login_part/login_page.dart';
import 'package:rigow/l10n/app_localizations.dart';

class GetStartedEndBody extends StatelessWidget {
  const GetStartedEndBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(AppLocalizations.of(context)!.alreadyHaveAnAccount,
                style: AppTexts.miniRegular),
            const SizedBox(width: 4),
            InkWell(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const LoginPage()));
              },
              child: RedText(
                  text: AppLocalizations.of(context)!.logIn,
                  gradient: LinearGradient(colors: AppColors.mainRed)),
            )
          ],
        ),
        const SizedBox(height: 24),
        TranceparentButtonWidget(
          borderColor: Colors.red,
          onPressed: () {},
          text: AppLocalizations.of(context)!.continueAsAnExpert,
          textColor: Colors.red,
        ),
        const SizedBox(height: 24),
        RedText(
            text: AppLocalizations.of(context)!.exploreAsAguest,
            gradient: LinearGradient(colors: AppColors.mainRed)),
      ],
    );
  }
}
