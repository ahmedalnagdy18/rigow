import 'package:flutter/material.dart';
import 'package:rigow/core/colors/app_colors.dart';
import 'package:rigow/core/common/buttons.dart';
import 'package:rigow/core/common/cliked_textfield_widget.dart';
import 'package:rigow/core/fonts/app_text.dart';
import 'package:rigow/features/authentication/presentation/screens/welcome_to_rigow_page.dart';
import 'package:rigow/features/authentication/presentation/widgets/country_sheet.dart';
import 'package:rigow/l10n/app_localizations.dart';

class SelectCountryPage extends StatefulWidget {
  const SelectCountryPage({super.key});

  @override
  State<SelectCountryPage> createState() => _SelectCountryPageState();
}

class _SelectCountryPageState extends State<SelectCountryPage> {
  String? selectedCountry;
  String? selectedCity;
  String? selectedArea;

  List<String> countries = ['Egypt', 'USA', 'Canada'];
  List<String> cities = [];
  List<String> areas = [];

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
                    return CountrySheet(
                      countries: countries,
                      selectedValue: selectedCountry,
                      onSelect: (value) {
                        setState(() {
                          selectedCountry = value;
                          selectedCity = null;
                          selectedArea = null;
                          cities = _getCitiesForCountry(selectedCountry);
                        });
                      },
                    );
                  },
                );
              },
              child: ClikedTextFieldWidget(
                color: selectedCountry == null ? null : AppColors.lightGrey,
                hintText: AppLocalizations.of(context)!.country,
                suffixText:
                    selectedCountry ?? AppLocalizations.of(context)!.tapToSet,
                borderColor: selectedCountry == null
                    ? AppColors.tapBorder
                    : AppColors.lightGrey,
              ),
            ),
            const SizedBox(height: 16),
            if (selectedCountry != null)
              InkWell(
                onTap: () {
                  showModalBottomSheet<void>(
                    context: context,
                    builder: (BuildContext context) {
                      return CountrySheet(
                        countries: cities,
                        selectedValue: selectedCity,
                        onSelect: (value) {
                          setState(() {
                            selectedCity = value;
                            selectedArea = null;
                            areas = _getAreasForCity(selectedCity);
                          });
                        },
                      );
                    },
                  );
                },
                child: ClikedTextFieldWidget(
                  color: selectedCity == null ? null : AppColors.lightGrey,
                  hintText: AppLocalizations.of(context)!.city,
                  suffixText:
                      selectedCity ?? AppLocalizations.of(context)!.tapToSet,
                  borderColor: selectedCity == null
                      ? AppColors.tapBorder
                      : AppColors.lightGrey,
                ),
              ),
            const SizedBox(height: 16),
            if (selectedCity != null)
              InkWell(
                onTap: () {
                  showModalBottomSheet<void>(
                    context: context,
                    builder: (BuildContext context) {
                      return CountrySheet(
                        countries: areas,
                        selectedValue: selectedArea,
                        onSelect: (value) {
                          setState(() {
                            selectedArea = value;
                          });
                        },
                      );
                    },
                  );
                },
                child: ClikedTextFieldWidget(
                  hintText: "Area",
                  color: selectedArea == null ? null : AppColors.lightGrey,
                  suffixText:
                      selectedArea ?? AppLocalizations.of(context)!.tapToSet,
                  borderColor: selectedArea == null
                      ? AppColors.tapBorder
                      : AppColors.lightGrey,
                ),
              ),
            if (selectedCity != null) const SizedBox(height: 24),
            ColoredButtonWidget(
              text: AppLocalizations.of(context)!.next,
              onPressed: () {
                selectedArea == null
                    ? null
                    : Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => const WelcomeToRigowPage()));
              },
              grideantColors: selectedArea == null
                  ? AppColors.greyLoader
                  : AppColors.mainRed,
              textColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }

  List<String> _getCitiesForCountry(String? country) {
    if (country == 'Egypt') return ['Cairo', 'Alexandria', 'Giza'];
    if (country == 'USA') return ['New York', 'Los Angeles', 'Chicago'];
    if (country == 'Canada') return ['Toronto', 'Vancouver', 'Montreal'];
    return [];
  }

  List<String> _getAreasForCity(String? city) {
    if (city == 'Cairo') return ['Downtown', 'Heliopolis', 'Maadi'];
    if (city == 'New York') return ['Manhattan', 'Brooklyn', 'Queens'];
    if (city == 'Toronto') return ['Scarborough', 'North York', 'Etobicoke'];
    return [];
  }
}
