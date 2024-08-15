import 'package:flutter/material.dart';
import 'package:rigow/core/colors/app_colors.dart';
import 'package:rigow/core/fonts/app_text.dart';

class DontHaveAccPart extends StatelessWidget {
  const DontHaveAccPart(
      {super.key, required this.blackText, required this.redText});
  final String blackText;
  final String redText;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30, top: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(blackText, style: AppTexts.miniRegular),
              RedText(
                  text: redText,
                  gradient: LinearGradient(colors: AppColors.mainRed))
            ],
          ),
          const SizedBox(height: 24),
          RedText(
              text: 'Explore as a guest',
              gradient: LinearGradient(
                colors: AppColors.mainRed,
              )),
        ],
      ),
    );
  }
}
