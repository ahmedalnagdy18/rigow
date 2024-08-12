import 'package:flutter/material.dart';
import 'package:rigow/core/common/buttons.dart';
import 'package:rigow/core/extentions/app_extentions.dart';
import 'package:rigow/features/onboarding/screens/onboarding_page.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

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
                        text: 'Next',
                        textColor: Colors.black,
                      ),
                      const SizedBox(height: 16),
                      TranceparentButtonWidget(
                        onPressed: () {},
                        text: 'Continue as an expert',
                        textColor: Colors.white,
                        borderColor: Colors.white,
                      ),
                      const SizedBox(height: 16),
                      InkWell(
                        onTap: () {
                          // Navigator.of(context).push(MaterialPageRoute(
                          //     builder: (context) => const Navbar()));
                        },
                        child: const Text(
                          "Explore the app",
                          style: TextStyle(
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
