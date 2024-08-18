import 'package:flutter/material.dart';
import 'package:rigow/core/common/buttons.dart';
import 'package:rigow/core/extentions/app_extentions.dart';
import 'package:rigow/features/onboarding/screens/onboarding_page.dart';
import 'package:rigow/l10n/app_localizations.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          SizedBox.expand(
            child: Image.asset(
              'assets/images/welcome.png',
              fit: BoxFit.cover,
            ),
          ),
          Stack(
            children: [
              SafeArea(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: appHight(context, 0.1), horizontal: 24),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ColoredButtonWidget(
                        grideantColors: const [Colors.white, Colors.white],
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const OnboardingScreen()));
                        },
                        text: AppLocalizations.of(context)!.next,
                        textColor: Colors.black,
                      ),
                      const SizedBox(height: 16),
                      TranceparentButtonWidget(
                        onPressed: () {},
                        text: AppLocalizations.of(context)!.continueAsAnExpert,
                        textColor: Colors.white,
                        borderColor: Colors.white,
                      ),
                      const SizedBox(height: 16),
                      InkWell(
                        onTap: () {
                          // Navigator.of(context).push(MaterialPageRoute(
                          //     builder: (context) => const Navbar()));
                        },
                        child: Text(
                          AppLocalizations.of(context)!.exploreTheApp,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SafeArea(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  alignment: Alignment.topRight,
                  child: const ArabicButton(),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
