import 'package:flutter/material.dart';
import 'package:rigow/core/colors/app_colors.dart';
import 'package:rigow/core/fonts/app_text.dart';
import 'package:rigow/features/authentication/presentation/widgets/otp_widget.dart';
import 'package:rigow/l10n/app_localizations.dart';

class VervicationBody extends StatelessWidget {
  const VervicationBody(
      {super.key,
      required this.controller,
      required this.onCompleted,
      required this.changeOnTap,
      required this.blackText,
      required this.redText,
      required this.colors,
      required this.resendOnTap,
      required this.whatVerify,
      this.color});
  final TextEditingController controller;
  final Function(String) onCompleted;
  final Function() changeOnTap;
  final String blackText;
  final String redText;
  final List<Color> colors;
  final Function() resendOnTap;
  final String whatVerify;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          '${AppLocalizations.of(context)!.verifyYour} $whatVerify ',
          style: AppTexts.title,
        ),
        const SizedBox(height: 8),
        Text(AppLocalizations.of(context)!.enterVerificationCodeSent,
            style: AppTexts.miniRegular),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text('“ahmed34@gmail.com“', style: AppTexts.medium),
            InkWell(
              onTap: changeOnTap,
              child: RedText(
                  text: AppLocalizations.of(context)!.change,
                  gradient: LinearGradient(colors: AppColors.mainRed)),
            )
          ],
        ),
        const SizedBox(height: 24),
        OtpWidget(
          color: color,
          controller: controller,
          onCompleted: onCompleted,
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Text(
              blackText,
              style: AppTexts.miniRegular,
            ),
            const SizedBox(width: 8),
            InkWell(
              onTap: resendOnTap,
              child: RedText(
                text: redText,
                gradient: LinearGradient(colors: colors),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
