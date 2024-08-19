// onboarding_model.dart

import 'package:flutter/material.dart';
import 'package:rigow/l10n/app_localizations.dart';

class Onboarding {
  final String image;
  final String title;

  Onboarding({required this.image, required this.title});
}

List<Onboarding> createOnboardingList(BuildContext context) {
  bool isArabic = Localizations.localeOf(context).languageCode == 'ar';
  return [
    Onboarding(
      image:
          isArabic ? "assets/images/ar1.png" : "assets/images/onboarding1.png",
      title: AppLocalizations.of(context)!.onboarding1,
    ),
    Onboarding(
      image:
          isArabic ? "assets/images/ar2.png" : "assets/images/onboarding2.png",
      title: AppLocalizations.of(context)!.onboarding2,
    ),
    Onboarding(
      image:
          isArabic ? "assets/images/ar3.png" : "assets/images/onboarding3.png",
      title: AppLocalizations.of(context)!.onboarding3,
    ),
  ];
}
