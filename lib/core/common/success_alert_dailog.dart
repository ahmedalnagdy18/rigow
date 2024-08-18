import 'package:flutter/material.dart';
import 'package:rigow/core/colors/app_colors.dart';
import 'package:rigow/core/common/buttons.dart';
import 'package:rigow/core/fonts/app_text.dart';
import 'package:rigow/l10n/app_localizations.dart';

class SuccessAlertDailog extends StatelessWidget {
  const SuccessAlertDailog({super.key, required this.onPressed});
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: 1,
        itemBuilder: (context, index) {
          return SizedBox(
            width: double.infinity,
            child: AlertDialog(
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              content: SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/success.png',
                      scale: 3,
                    ),
                    const SizedBox(height: 16),
                    Text(AppLocalizations.of(context)!.success,
                        style: AppTexts.midTitle
                            .copyWith(fontWeight: FontWeight.w600)),
                    const SizedBox(height: 16),
                    Text(AppLocalizations.of(context)!.yourPasswordSuccessfully,
                        style: AppTexts.miniRegular),
                    const SizedBox(height: 24),
                    ColoredButtonWidget(
                      grideantColors: AppColors.mainRed,
                      onPressed: onPressed,
                      text: AppLocalizations.of(context)!.continuee,
                      textColor: Colors.white,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
