import 'package:flutter/material.dart';
import 'package:rigow/core/colors/app_colors.dart';
import 'package:rigow/core/common/check_box_widget.dart';
import 'package:rigow/core/common/textfield.dart';
import 'package:rigow/core/extentions/app_extentions.dart';
import 'package:rigow/core/fonts/app_text.dart';
import 'package:rigow/l10n/app_localizations.dart';

class CountrySheet extends StatefulWidget {
  const CountrySheet({super.key});

  @override
  State<CountrySheet> createState() => _CountrySheetState();
}

class _CountrySheetState extends State<CountrySheet> {
  String? selectedContury;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        color: Colors.white,
      ),
      height: appHight(context, 1),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 22),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppLocalizations.of(context)!.selectYourCountry,
                  style: AppTexts.regularSimiBold,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(Icons.close),
                ),
              ],
            ),
            const SizedBox(height: 12),
            TextFieldWidget(
              prefixIcon: const Icon(Icons.search, size: 20),
              hintText: AppLocalizations.of(context)!.searchCountry,
              obscureText: false,
            ),
            const SizedBox(height: 16),
            CheckBoxWidget(
              value: 'Egypt',
              groupValue: selectedContury,
              onChanged: (value) {
                setState(() {
                  selectedContury = value;
                });
              },
              title: 'Egypt',
            ),
            const SizedBox(height: 12),
            Divider(color: AppColors.lightGrey),
          ],
        ),
      ),
    );
  }
}
