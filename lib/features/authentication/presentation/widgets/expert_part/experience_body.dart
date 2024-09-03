import 'package:flutter/material.dart';
import 'package:rigow/core/colors/app_colors.dart';
import 'package:rigow/core/fonts/app_text.dart';
import 'package:rigow/features/authentication/domain/model/countries_model.dart';
import 'package:rigow/features/authentication/presentation/screens/expert_registar_part/specialty_page.dart';
import 'package:rigow/l10n/app_localizations.dart';

class ExperienceBody extends StatefulWidget {
  const ExperienceBody({super.key});

  @override
  State<ExperienceBody> createState() => _ExperienceBodyState();
}

class _ExperienceBodyState extends State<ExperienceBody> {
  String? selectedSpecialty;
  @override
  Widget build(BuildContext context) {
    bool isRtl = Localizations.localeOf(context).languageCode == 'ar';
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8), topRight: Radius.circular(8))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Experience',
            style: AppTexts.title.copyWith(fontSize: 18),
          ),
          const SizedBox(height: 35),
          Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    selectedSpecialty != null
                        ? const Padding(
                            padding: EdgeInsets.only(right: 8),
                            child: Icon(Icons.verified,
                                color: Colors.green, size: 18),
                          )
                        : const SizedBox(),
                    const Text(
                      'Specialty',
                      style: AppTexts.regular,
                    ),
                  ],
                ),
              ),
              Text(
                selectedSpecialty ?? AppLocalizations.of(context)!.tapToSet,
                style: AppTexts.miniRegular.copyWith(
                  color: selectedSpecialty == null
                      ? AppColors.clickedTextfieldBorder
                      : Colors.black,
                ),
              ),
              const SizedBox(width: 8),
              InkWell(
                onTap: () async {
                  final result = await Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) => const SpecialtyPage()));
                  if (result != null && result is CountriesModel) {
                    setState(() {
                      selectedSpecialty = result.name;
                    });
                  }
                },
                child: Icon(
                    !isRtl ? Icons.arrow_forward_ios : Icons.arrow_back_ios,
                    color: Colors.red,
                    size: 16),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
