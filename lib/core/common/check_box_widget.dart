import 'package:flutter/material.dart';
import 'package:rigow/core/colors/app_colors.dart';
import 'package:roundcheckbox/roundcheckbox.dart';

class CheckBoxWidget extends StatelessWidget {
  const CheckBoxWidget(
      {super.key, required this.onTap, required this.isChecked});
  final dynamic Function(bool?) onTap;
  final bool isChecked;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          colors: AppColors.mainRed,
        ),
      ),
      padding: const EdgeInsets.all(1.5),
      child: RoundCheckBox(
        isChecked: isChecked,
        checkedWidget: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            gradient: LinearGradient(
              colors: AppColors.mainRed,
            ),
          ),
        ),
        onTap: onTap,
        borderColor: Colors.white,
        checkedColor: Colors.red,
        uncheckedColor: Colors.white,
        size: 16,
      ),
    );
  }
}
