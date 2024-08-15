import 'package:flutter/material.dart';
import 'package:rigow/core/colors/app_colors.dart';
import 'package:rigow/core/common/buttons.dart';
import 'package:rigow/core/common/cliked_textfield_widget.dart';
import 'package:rigow/core/fonts/app_text.dart';
import 'package:rigow/features/authentication/presentation/screens/welcome_to_rigow_page.dart';
import 'package:rigow/features/authentication/presentation/widgets/country_sheet.dart';

class SelectCountryPage extends StatelessWidget {
  const SelectCountryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text('Complete your profile ', style: AppTexts.title),
            const Text(
              'Region',
              style: AppTexts.miniRegular,
            ),
            const SizedBox(height: 24),
            InkWell(
                onTap: () {
                  showModalBottomSheet<void>(
                    context: context,
                    builder: (BuildContext context) {
                      return const CountrySheet();
                    },
                  );
                },
                child: ClikedTextFieldWidget(
                  hintText: 'Country',
                  suffixText: 'Egypt',
                  borderColor: Colors.white,
                  color: AppColors.lightGrey,
                )),
            const SizedBox(height: 16),
            InkWell(
                onTap: () {
                  showModalBottomSheet<void>(
                    context: context,
                    builder: (BuildContext context) {
                      return const CountrySheet();
                    },
                  );
                },
                child: ClikedTextFieldWidget(
                  hintText: 'City',
                  suffixText: 'Tap to select',
                  borderColor: AppColors.tapBorder,
                )),
            const SizedBox(height: 24),
            ColoredButtonWidget(
                text: 'Next',
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const WelcomeToRigowPage()));
                },
                grideantColors: AppColors.mainRed,
                textColor: Colors.white),
          ],
        ),
      ),
    );
  }
}
