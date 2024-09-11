import 'package:flutter/material.dart';
import 'package:rigow/core/colors/app_colors.dart';
import 'package:rigow/core/fonts/app_text.dart';

class CheckBoxWidget extends StatelessWidget {
  const CheckBoxWidget({
    super.key,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    required this.title,
    this.style,
  });

  final dynamic value;
  final dynamic groupValue;
  final void Function(dynamic) onChanged;
  final String title;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (groupValue == value) {
          onChanged(null);
        } else {
          onChanged(value);
        }
      },
      child: SizedBox(
        width: MediaQuery.of(context).size.width - 150,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Radio<dynamic>(
              value: value,
              groupValue: groupValue,
              onChanged: onChanged,
              activeColor: AppColors.mainRed[0],
              visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
            ),
            Expanded(
              child: Text(
                title,
                style: style ?? AppTexts.regular,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
