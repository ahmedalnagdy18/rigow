import 'package:flutter/material.dart';
import 'package:rigow/core/colors/app_colors.dart';
import 'package:rigow/core/common/check_box_widget.dart';
import 'package:rigow/core/common/textfield.dart';
import 'package:rigow/core/extentions/app_extentions.dart';
import 'package:rigow/core/fonts/app_text.dart';

class CountrySheet extends StatelessWidget {
  const CountrySheet({super.key});

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
                  const Text(
                    'Select your country',
                    style: AppTexts.regularSimiBold,
                  ),
                  InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(Icons.close))
                ],
              ),
              const SizedBox(height: 12),
              const TextFieldWidget(
                prefixIcon: Icon(Icons.search, size: 20),
                hintText: 'search country',
                obscureText: false,
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  CheckBoxWidget(
                    //      isChecked: isChecked2,
                    onTap: (selected) {
                      // setState(() {
                      //   isChecked2 = true;
                      //   isChecked = false;
                      // });
                    },
                    isChecked: true,
                  ),
                  const SizedBox(width: 10),
                  const Text('Egypt', style: AppTexts.regular),
                ],
              ),
              const SizedBox(height: 12),
              Divider(color: AppColors.lightGrey)
            ],
          ),
        )

        //         onPressed: () => Navigator.pop(context),

        );
  }
}
