import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rigow/core/common/custom_widgets/app_asset_image.dart';
import 'package:rigow/core/shared_prefrances/shared_prefrance.dart';
import 'package:rigow/features/authentication/presentation/cubits/lang_cubit/lang_cubit.dart';
import 'package:rigow/features/authentication/presentation/cubits/lang_cubit/lang_state.dart';
import 'package:rigow/features/authentication/presentation/screens/expert_registar_part/expert_main_complete.dart';
import 'package:rigow/features/onboarding/screens/splash_screen.dart';
import 'package:rigow/injection_container.dart';
import 'package:rigow/l10n/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefrance.instanc
      .initialization(sharedPreferences: await SharedPreferences.getInstance());

  await init();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void didChangeDependencies() {
    precacheImage(AssetImage(AppAssetImage.splash), context);
    precacheImage(AssetImage(AppAssetImage.splashAr), context);
    precacheImage(AssetImage(AppAssetImage.welcome), context);
    precacheImage(AssetImage(AppAssetImage.welcomeAr), context);
    precacheImage(AssetImage(AppAssetImage.onboarding1), context);
    precacheImage(AssetImage(AppAssetImage.onboarding2), context);
    precacheImage(AssetImage(AppAssetImage.onboarding3), context);
    precacheImage(AssetImage(AppAssetImage.onboardingAr1), context);
    precacheImage(AssetImage(AppAssetImage.onboardingAr2), context);
    precacheImage(AssetImage(AppAssetImage.onboardingAr3), context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LocaleCubit()..getSavedLanguage(),
      child: BlocBuilder<LocaleCubit, ChangeLocaleState>(
        builder: (context, state) {
          return MaterialApp(
            locale: state.locale,
            debugShowCheckedModeBanner: false,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            home: const ExpertMainComplete(
              firstName: 'nagdy',
              lastName: 'ahmed',
              role: 'EXPERT',
            ),
            // const SplashScreen(),
          );
        },
      ),
    );
  }
}
