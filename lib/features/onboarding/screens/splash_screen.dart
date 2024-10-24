import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rigow/core/colors/app_colors.dart';
import 'package:rigow/core/shared_prefrances/shared_prefrance.dart';
import 'package:rigow/features/authentication/domain/entities/authentication_entities/my_data_inputs.dart';
import 'package:rigow/features/authentication/presentation/cubits/my_data/my_data_cubit.dart';
import 'package:rigow/features/authentication/presentation/cubits/my_data/my_data_state.dart';
import 'package:rigow/features/authentication/presentation/screens/expert_registar_part/expert_main_complete.dart';
import 'package:rigow/features/authentication/presentation/screens/user_registar_part/compelete_profile_part/main_complete_profile.dart';
import 'package:rigow/features/home/screens/the_main_page.dart';
import 'package:rigow/features/onboarding/screens/welcome_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    context.read<MyDataCubit>().getUserDataInfo();
  }

  UserDataEntity? userDataEntity;
  @override
  Widget build(BuildContext context) {
    final token = SharedPrefrance.instanc.getToken('token');
    bool isArabic = Localizations.localeOf(context).languageCode == 'ar';

    return BlocConsumer<MyDataCubit, MyDataState>(
      listener: (context, state) {
        if (state is SucsessMyDataState) {
          timerr(token, state.myData);
        } else {
          timerr(token, userDataEntity);
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: AppColors.appBarRed,
          body: SizedBox.expand(
            child: Image.asset(
              isArabic
                  ? "assets/images/splashAr.png"
                  : 'assets/images/splash.png',
              fit: BoxFit.cover,
            ),
          ),
        );
      },
    );
  }

  void timerr(String? token, UserDataEntity? userData) {
    Timer(const Duration(seconds: 2), () {
      if (!mounted) return;
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            if (token == null || token == "") {
              return const WelcomePage();
            } else if (userData?.hasCompletedRegistration == true) {
              return const TheMainHomePage();
            } else if (userData?.role == "USER") {
              return MainCompleteYourProfilePage(
                firstName: userData?.firstName ?? "",
                lastName: userData?.lastName ?? "",
                role: "User",
              );
            } else if (userData?.role == "EXPERT") {
              return ExpertMainComplete(
                firstName: userData?.firstName ?? "",
                lastName: userData?.lastName ?? "",
                role: "Expert",
              );
            } else {
              return const WelcomePage();
            }
          },
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
      );
    });
  }
}
