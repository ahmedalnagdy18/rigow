import 'package:flutter/material.dart';
import 'package:rigow/core/colors/app_colors.dart';
import 'package:rigow/core/common/check_box_widget.dart';
import 'package:rigow/core/fonts/app_text.dart';

class AddedBodyItem extends StatelessWidget {
  const AddedBodyItem(
      {super.key,
      required this.deleteOnTap,
      required this.title,
      required this.editOnTap});
  final Function() deleteOnTap;
  final Function() editOnTap;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: AppColors.grey,
        ),
        child: Column(
          children: [
            Row(
              children: [
                CheckBoxWidget(
                  onChanged: (p0) {},
                  groupValue: 0,
                  title: title,
                  style: AppTexts.midTitle,
                  value: 0,
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Divider(color: Colors.white),
            const SizedBox(height: 16),
            Row(
              children: [
                Icon(
                  Icons.edit,
                  size: 20,
                  color: AppColors.clickedTextfieldBorder,
                ),
                const SizedBox(width: 5),
                InkWell(
                  onTap: editOnTap,
                  child: RedText(
                    text: 'Edit',
                    fontWeight: FontWeight.w400,
                    gradient: LinearGradient(colors: AppColors.mainRed),
                  ),
                ),
                const SizedBox(width: 16),
                Icon(Icons.delete_forever_outlined,
                    color: AppColors.clickedTextfieldBorder, size: 20),
                const SizedBox(width: 5),
                InkWell(
                  onTap: deleteOnTap,
                  child: RedText(
                    text: 'Delete',
                    fontWeight: FontWeight.w400,
                    gradient: LinearGradient(colors: AppColors.mainRed),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
