// onboarding_screen.dart

import 'package:flutter/material.dart';
import 'package:rigow/core/common/buttons.dart';
import 'package:rigow/core/extentions/app_extentions.dart';
import 'package:rigow/core/fonts/app_text.dart';
import 'package:rigow/features/authentication/presentation/screens/get_started_page.dart';
import 'package:rigow/features/onboarding/widgets/dots_widget.dart';
import 'package:rigow/features/onboarding/widgets/onboarding_widget.dart';
import 'package:rigow/l10n/app_localizations.dart';

class OnboardingScreen extends StatefulWidget {
  final String role;
  const OnboardingScreen({super.key, required this.role});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController pageController = PageController();
  int currentPage = 0;

  @override
  void initState() {
    currentPage = pageController.initialPage;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool isArabic = Localizations.localeOf(context).languageCode == 'ar';
    final onboardingList = widget.role == 'Expert'
        ? createExpertOnboardingList(context)
        : createUserOnboardingList(context);

    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: PageView.builder(
                  physics: const ClampingScrollPhysics(),
                  controller: pageController,
                  onPageChanged: (value) {
                    setState(() {
                      currentPage = value;
                    });
                  },
                  itemCount: onboardingList.length,
                  itemBuilder: (_, i) {
                    return OnboardingBody(
                      image: onboardingList[i].image,
                      title: onboardingList[i].title,
                      position: i,
                    );
                  },
                ),
              ),
            ],
          ),
          Stack(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: appHight(context, 0.1), horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        onboardingList[currentPage].title,
                        textAlign: TextAlign.center,
                        style: AppTexts.subTitle,
                      ),
                    ),
                    const SizedBox(height: 46),
                    DotsWidget(
                      dotsCount: onboardingList.length,
                      position: currentPage,
                    ),
                    const SizedBox(height: 32),
                    ColoredButtonWidget(
                        text: currentPage == 2
                            ? widget.role == 'Expert'
                                ? AppLocalizations.of(context)!
                                    .continueAsAnExpert
                                : AppLocalizations.of(context)!.getStarted
                            : AppLocalizations.of(context)!.next,
                        onPressed: () {
                          if (currentPage == 2) {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => GetStartedPage(
                                role: widget.role,
                              ),
                            ));
                          } else {
                            pageController.nextPage(
                                duration: const Duration(milliseconds: 400),
                                curve: Curves.decelerate);
                          }
                        },
                        grideantColors: const [Colors.white, Colors.white],
                        textColor: Colors.black),
                    const SizedBox(height: 28),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => GetStartedPage(
                                  role: widget.role,
                                )));
                      },
                      child: Text(
                        currentPage == 2
                            ? widget.role == 'Expert'
                                ? AppLocalizations.of(context)!.continueAsAnUser
                                : AppLocalizations.of(context)!
                                    .continueAsAnExpert
                            : AppLocalizations.of(context)!.skip,
                        style: AppTexts.medium.copyWith(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
              SafeArea(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  alignment: isArabic ? Alignment.topLeft : Alignment.topRight,
                  child: const ArabicButton(),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class OnboardingBody extends StatelessWidget {
  const OnboardingBody({
    super.key,
    required this.position,
    required this.image,
    required this.title,
  });

  final String image;
  final String title;
  final int position;

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Image.asset(
        image,
        fit: BoxFit.cover,
      ),
    );
  }
}
