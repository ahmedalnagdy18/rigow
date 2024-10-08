import 'package:flutter/material.dart';
import 'package:rigow/core/colors/app_colors.dart';
import 'package:rigow/core/fonts/app_text.dart';

class ClikedTextFieldWidget extends StatelessWidget {
  const ClikedTextFieldWidget(
      {super.key,
      this.color,
      required this.borderColor,
      required this.hintText,
      required this.suffixText});
  final Color? color;
  final Color borderColor;
  final String hintText;
  final String suffixText;
  @override
  Widget build(BuildContext context) {
    bool isRtl = Localizations.localeOf(context).languageCode == 'ar';
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      height: 52,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: color,
        border: Border.all(color: borderColor),
      ),
      child: Row(
        children: [
          Expanded(child: Text(hintText, style: AppTexts.regular)),
          Text(
            suffixText,
            style: AppTexts.miniRegular.copyWith(
              color: AppColors.clickedTextfieldBorder,
            ),
          ),
          const SizedBox(width: 8),
          Icon(!isRtl ? Icons.arrow_forward_ios : Icons.arrow_back_ios,
              color: Colors.red, size: 16),
        ],
      ),
    );
  }
}
