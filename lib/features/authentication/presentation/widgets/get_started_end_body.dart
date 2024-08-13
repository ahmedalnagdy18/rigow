import 'package:flutter/material.dart';
import 'package:rigow/core/colors/app_colors.dart';
import 'package:rigow/core/common/buttons.dart';
import 'package:rigow/core/fonts/app_text.dart';

class GetStartedEndBody extends StatelessWidget {
  const GetStartedEndBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Already have an account? ',
                style: AppTexts.miniRegular),
            RedText(
                text: 'Log in',
                gradient: LinearGradient(colors: AppColors.mainRed))
          ],
        ),
        const SizedBox(height: 24),
        TranceparentButtonWidget(
          borderColor: Colors.red,
          onPressed: () {},
          text: 'Continue as an expert',
          textColor: Colors.red,
        ),
        const SizedBox(height: 24),
        RedText(
            text: 'Explore as a guest',
            gradient: LinearGradient(colors: AppColors.mainRed)),
      ],
    );
  }
}
