import 'package:flutter/material.dart';
import 'package:mobkit_dashed_border/mobkit_dashed_border.dart';
import 'package:rigow/core/colors/app_colors.dart';
import 'package:rigow/core/common/textfield.dart';
import 'package:rigow/core/fonts/app_text.dart';
import 'package:rigow/l10n/app_localizations.dart';

class SetExpertAccountPage extends StatelessWidget {
  const SetExpertAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    bool isRtl = Localizations.localeOf(context).languageCode == 'ar';
    return Scaffold(
      backgroundColor: AppColors.grey,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(AppLocalizations.of(context)!.setYourExpertAccount,
              style: AppTexts.title),
          const SizedBox(height: 8),
          Text(AppLocalizations.of(context)!.confirmYourQualifications,
              style: AppTexts.miniRegular),
          const SizedBox(height: 32),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8), topRight: Radius.circular(8))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Experience',
                  style: AppTexts.title.copyWith(fontSize: 18),
                ),
                const SizedBox(height: 35),
                Row(
                  children: [
                    const Expanded(
                        child: Text('Specialty', style: AppTexts.regular)),
                    Text(
                      AppLocalizations.of(context)!.tapToSet,
                      style: AppTexts.miniRegular.copyWith(
                        color: AppColors.clickedTextfieldBorder,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Icon(
                        !isRtl ? Icons.arrow_forward_ios : Icons.arrow_back_ios,
                        color: Colors.red,
                        size: 16),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 4),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 14),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Expanded(
                          child: Text('Faculty', style: AppTexts.regular)),
                      Text(
                        AppLocalizations.of(context)!.tapToSet,
                        style: AppTexts.miniRegular.copyWith(
                          color: AppColors.clickedTextfieldBorder,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Icon(
                          !isRtl
                              ? Icons.arrow_forward_ios
                              : Icons.arrow_back_ios,
                          color: Colors.red,
                          size: 16),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                const TextFieldWidget(
                  obscureText: false,
                  hintText: 'Type your university name',
                )
              ],
            ),
          ),
          const SizedBox(height: 4),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'University degree',
                  style: AppTexts.regular,
                ),
                const SizedBox(height: 18),
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: DashedBorder.all(
                      dashLength: 4,
                      width: 1,
                      color: Colors.grey,
                    ),
                  ),
                  child: const Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('data'),
                      SizedBox(width: 10),
                      Text('data'),
                      Spacer(),
                      Text('data'),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
