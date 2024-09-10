import 'package:flutter/material.dart';
import 'package:rigow/core/colors/app_colors.dart';
import 'package:rigow/core/fonts/app_text.dart';
import 'package:rigow/features/authentication/domain/model/specialty_model.dart';
import 'package:rigow/features/authentication/presentation/screens/expert_registar_part/specialty_page.dart';
import 'package:rigow/l10n/app_localizations.dart';

class ExperienceBody extends StatefulWidget {
  const ExperienceBody(
      {super.key, required this.onSelectedSpecialityIdCallBack});
  final void Function(int?) onSelectedSpecialityIdCallBack;
  @override
  State<ExperienceBody> createState() => _ExperienceBodyState();
}

class _ExperienceBodyState extends State<ExperienceBody> {
  SpecialtyModel? _selectedSpecialty;
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
            AppLocalizations.of(context)!.experience,
            style: AppTexts.title.copyWith(fontSize: 18),
          ),
          const SizedBox(height: 35),
          InkWell(
            onTap: () async {
              final result = await Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => SpecialtyPage(
                    onSelectedSpecialty: (secialty) {
                      _selectedSpecialty = secialty;
                      widget.onSelectedSpecialityIdCallBack(secialty?.id ?? 0);
                      setState(() {});
                    },
                    initialSelected: SpecialtyModel(
                      id: _selectedSpecialty?.id ?? 0,
                      name: _selectedSpecialty?.name ?? '',
                    ),
                  ),
                ),
              );
              if (result != null && result is SpecialtyModel) {
                setState(() {
                  _selectedSpecialty = result;
                });
              }
            },
            child: Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      _selectedSpecialty != null
                          ? const Padding(
                              padding: EdgeInsets.only(right: 8),
                              child: Icon(Icons.check_circle,
                                  color: Colors.green, size: 18),
                            )
                          : const SizedBox(),
                      Text(
                        AppLocalizations.of(context)!.specialty,
                        style: AppTexts.regular,
                      ),
                    ],
                  ),
                ),
                Text(
                  _selectedSpecialty?.name ??
                      AppLocalizations.of(context)!.tapToSet,
                  style: AppTexts.miniRegular.copyWith(
                    color: _selectedSpecialty == null
                        ? AppColors.clickedTextfieldBorder
                        : Colors.black,
                  ),
                ),
                const SizedBox(width: 8),
                Icon(!isRtl ? Icons.arrow_forward_ios : Icons.arrow_back_ios,
                    color: Colors.red, size: 16),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
