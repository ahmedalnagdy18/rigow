import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rigow/core/colors/app_colors.dart';
import 'package:rigow/core/common/buttons.dart';
import 'package:rigow/core/extentions/app_extentions.dart';
import 'package:rigow/core/fonts/app_text.dart';
import 'package:rigow/features/authentication/domain/entities/authentication_entities/logout_input.dart';
import 'package:rigow/features/authentication/presentation/cubits/logout/logout_cubit.dart';
import 'package:rigow/features/authentication/presentation/cubits/logout/logout_state.dart';
import 'package:rigow/features/onboarding/screens/welcome_page.dart';
import 'package:rigow/injection_container.dart';
import 'package:rigow/l10n/app_localizations.dart';

class LogoutAlertDailog extends StatelessWidget {
  const LogoutAlertDailog({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LogoutCubit(logoutUsecase: sl()),
      child: const _LogoutAlertDailog(),
    );
  }
}

class _LogoutAlertDailog extends StatefulWidget {
  const _LogoutAlertDailog();

  @override
  State<_LogoutAlertDailog> createState() => _LogoutAlertDailogState();
}

class _LogoutAlertDailogState extends State<_LogoutAlertDailog> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LogoutCubit, LogoutState>(
      listener: (context, state) {
        if (state is ErrorLogoutState) {
          showErrorToastMessage(message: state.message);
        }
        if (state is SucsessLogoutState) {
          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (context) => const WelcomePage(),
            ),
            (Route<dynamic> route) => false,
          );
        }
      },
      builder: (context, state) {
        return Center(
          child: ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 1,
            itemBuilder: (context, index) {
              return SizedBox(
                width: double.infinity,
                child: AlertDialog(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  content: SizedBox(
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/rigow.png',
                          scale: 3,
                        ),
                        const SizedBox(height: 16),
                        Text(AppLocalizations.of(context)!.logoutMessage,
                            style: AppTexts.midTitle
                                .copyWith(fontWeight: FontWeight.w600)),
                        const SizedBox(height: 24),
                        Row(
                          children: [
                            Expanded(
                              child: ColoredButtonWidget(
                                grideantColors: AppColors.mainRed,
                                onPressed: () {
                                  _registerButton(context);
                                },
                                text: "Yes",
                                textColor: Colors.white,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: ColoredButtonWidget(
                                grideantColors: AppColors.mainRed,
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                text: "No",
                                textColor: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }

  void _registerButton(BuildContext context) {
    LogutDeviceEnum deviceType;

    if (Platform.isAndroid) {
      deviceType = LogutDeviceEnum.android;
    } else if (Platform.isIOS) {
      deviceType = LogutDeviceEnum.ios;
    } else {
      deviceType = LogutDeviceEnum.desktop;
    }
    final input = LogoutInput(deviceType: deviceType);
    BlocProvider.of<LogoutCubit>(context).logoutFromAcc(input);
  }
}
