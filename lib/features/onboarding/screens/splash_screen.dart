import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rigow/features/onboarding/screens/welcome_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  ImageProvider welcome = const AssetImage('assets/images/welcome.png');
  ImageProvider welcomeAr = const AssetImage('assets/images/welcomeAr.png');
  ImageProvider onboarding1 = const AssetImage('assets/images/onboarding1.png');
  ImageProvider onboarding2 = const AssetImage('assets/images/onboarding2.png');
  ImageProvider onboarding3 = const AssetImage('assets/images/onboarding3.png');
  ImageProvider onboardingAr1 = const AssetImage('assets/images/ar1.png');
  ImageProvider onboardingAr2 = const AssetImage('assets/images/ar2.png');
  ImageProvider onboardingAr3 = const AssetImage('assets/images/ar3.png');
  @override
  void didChangeDependencies() {
    precacheImage(welcome, context, size: const Size(10000, 1000000));
    precacheImage(welcomeAr, context, size: const Size(10000, 1000000));
    precacheImage(onboarding1, context, size: const Size(10000, 1000000));
    precacheImage(onboarding2, context, size: const Size(10000, 1000000));
    precacheImage(onboarding3, context, size: const Size(10000, 1000000));
    precacheImage(onboardingAr1, context, size: const Size(10000, 1000000));
    precacheImage(onboardingAr2, context, size: const Size(10000, 1000000));
    precacheImage(onboardingAr3, context, size: const Size(10000, 1000000));
    super.didChangeDependencies();
  }

  void init() async {}

  @override
  void initState() {
    init();

    Timer(
      const Duration(seconds: 3),
      () => Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              const WelcomePage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = 0.0;
            const end = 1.0;
            const curve = Curves.easeInOut;

            var tween =
                Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
            var fadeAnimation = animation.drive(tween);

            return FadeTransition(
              opacity: fadeAnimation,
              child: child,
            );
          },
        ),
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool isArabic = Localizations.localeOf(context).languageCode == 'ar';
    return Scaffold(
      body: SizedBox.expand(
        child: Image.asset(
          isArabic ? "assets/images/splashAr.png" : 'assets/images/splash.png',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
