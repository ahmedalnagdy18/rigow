import 'package:flutter/material.dart';
import 'package:rigow/core/colors/app_colors.dart';
import 'package:rigow/core/fonts/app_text.dart';
import 'package:rigow/features/authentication/presentation/widgets/addto_buttom_sheet_widget.dart';

class AddOntherSectionWidget extends StatelessWidget {
  const AddOntherSectionWidget(
      {super.key,
      required this.title,
      required this.controller,
      required this.onPressed});
  final String title;
  final TextEditingController controller;
  final void Function(BuildContext context) onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        AddToButtomSheetWidget.show(
          controller: controller,
          context,
          onPressed: onPressed,
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(Icons.add, color: AppColors.clickedTextfieldBorder),
            const SizedBox(width: 8),
            Text(title, style: AppTexts.regular),
          ],
        ),
      ),
    );
  }
}
