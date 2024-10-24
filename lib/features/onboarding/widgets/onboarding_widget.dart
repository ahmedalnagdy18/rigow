// onboarding_model.dart

import 'package:flutter/material.dart';
import 'package:rigow/core/colors/app_colors.dart';
import 'package:rigow/l10n/app_localizations.dart';

class Onboarding {
  final String image;
  final String title;
  final List<Color> colors;

  Onboarding({required this.image, required this.title, required this.colors});
}

List<Onboarding> createUserOnboardingList(BuildContext context) {
  bool isArabic = Localizations.localeOf(context).languageCode == 'ar';
  return [
    Onboarding(
      image:
          isArabic ? "assets/images/ar1.png" : "assets/images/onboarding1.png",
      title: AppLocalizations.of(context)!.onboarding1,
      colors: AppColors.onbording1,
    ),
    Onboarding(
      image:
          isArabic ? "assets/images/ar2.png" : "assets/images/onboarding2.png",
      title: AppLocalizations.of(context)!.onboarding2,
      colors: AppColors.onbording2,
    ),
    Onboarding(
      image:
          isArabic ? "assets/images/ar3.png" : "assets/images/onboarding3.png",
      title: AppLocalizations.of(context)!.onboarding3,
      colors: AppColors.onbording3,
    ),
  ];
}

List<Onboarding> createExpertOnboardingList(BuildContext context) {
  bool isArabic = Localizations.localeOf(context).languageCode == 'ar';
  return [
    Onboarding(
      image: isArabic
          ? "assets/images/arexonboarding1.png"
          : "assets/images/exonboarding1.png",
      title: AppLocalizations.of(context)!.exonboarding1,
      colors: AppColors.onbording1,
    ),
    Onboarding(
      image: isArabic
          ? "assets/images/arexonboarding2.png"
          : "assets/images/exonboarding2.png",
      title: AppLocalizations.of(context)!.exonboarding2,
      colors: AppColors.onbording2,
    ),
    Onboarding(
      image:
          isArabic ? "assets/images/ar3.png" : "assets/images/onboarding3.png",
      title: AppLocalizations.of(context)!.onboarding3,
      colors: AppColors.onbording3,
    ),
  ];
}
