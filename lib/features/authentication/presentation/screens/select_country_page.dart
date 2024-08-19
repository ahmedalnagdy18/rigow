import 'package:flutter/material.dart';
import 'package:rigow/core/colors/app_colors.dart';
import 'package:rigow/core/common/buttons.dart';
import 'package:rigow/core/common/cliked_textfield_widget.dart';
import 'package:rigow/core/fonts/app_text.dart';
import 'package:rigow/features/authentication/presentation/screens/welcome_to_rigow_page.dart';
import 'package:rigow/features/authentication/presentation/widgets/country_sheet.dart';
import 'package:rigow/l10n/app_localizations.dart';

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
            Text(AppLocalizations.of(context)!.completeYourProfile,
                style: AppTexts.title),
            Text(
              AppLocalizations.of(context)!.region,
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
                  hintText: AppLocalizations.of(context)!.country,
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
                  hintText: AppLocalizations.of(context)!.city,
                  suffixText: AppLocalizations.of(context)!.tapToSet,
                  borderColor: AppColors.tapBorder,
                )),
            const SizedBox(height: 24),
            ColoredButtonWidget(
                text: AppLocalizations.of(context)!.next,
                onPressed: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
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
