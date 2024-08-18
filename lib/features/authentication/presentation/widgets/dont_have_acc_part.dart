import 'package:flutter/material.dart';
import 'package:rigow/core/colors/app_colors.dart';
import 'package:rigow/core/fonts/app_text.dart';
import 'package:rigow/l10n/app_localizations.dart';

class DontHaveAccPart extends StatelessWidget {
  const DontHaveAccPart(
      {super.key,
      required this.blackText,
      required this.redText,
      required this.redTextOnTap});
  final String blackText;
  final String redText;
  final Function() redTextOnTap;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(blackText, style: AppTexts.miniRegular),
            const SizedBox(width: 4),
            InkWell(
              onTap: redTextOnTap,
              child: RedText(
                  text: redText,
                  gradient: LinearGradient(colors: AppColors.mainRed)),
            )
          ],
        ),
        const SizedBox(height: 24),
        RedText(
            text: AppLocalizations.of(context)!.exploreAsAguest,
            gradient: LinearGradient(
              colors: AppColors.mainRed,
            )),
      ],
    );
  }
}
