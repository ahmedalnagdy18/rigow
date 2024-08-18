import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rigow/features/authentication/presentation/cubits/lang_cubit/lang_cubit.dart';
import 'package:rigow/features/authentication/presentation/cubits/lang_cubit/lang_state.dart';
import 'package:rigow/features/onboarding/screens/splash_screen.dart';
import 'package:rigow/l10n/app_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
            home: const SplashScreen(),
          );
        },
      ),
    );
  }
}
