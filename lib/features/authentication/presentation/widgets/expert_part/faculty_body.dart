import 'package:flutter/material.dart';
import 'package:rigow/core/colors/app_colors.dart';
import 'package:rigow/core/common/textfield.dart';
import 'package:rigow/core/fonts/app_text.dart';
import 'package:rigow/features/authentication/domain/model/countries_model.dart';
import 'package:rigow/features/authentication/domain/model/faculty_model.dart';
import 'package:rigow/features/authentication/presentation/screens/expert_registar_part/department_page.dart';
import 'package:rigow/features/authentication/presentation/screens/expert_registar_part/faculty_page.dart';
import 'package:rigow/l10n/app_localizations.dart';

class FacultyBody extends StatefulWidget {
  const FacultyBody({
    super.key,
    required this.selectedSpecialtyId,
  });
  final int selectedSpecialtyId;
  @override
  State<FacultyBody> createState() => _FacultyBodyState();
}

class _FacultyBodyState extends State<FacultyBody> {
  String? selectedFaculty;
  String? selectedDepartment;
  @override
  Widget build(BuildContext context) {
    bool isRtl = Localizations.localeOf(context).languageCode == 'ar';
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 14),
            child: InkWell(
              onTap: () async {
                final result =
                    await Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => FacultyPage(
                              selectedSpecialtyId: widget.selectedSpecialtyId,
                            )));
                if (result != null && result is FacultyModel) {
                  setState(() {
                    selectedFaculty = result.name;
                  });
                } else if (result is String) {
                  setState(() {
                    selectedFaculty = result;
                  });
                }
              },
              child: Row(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        selectedFaculty != null
                            ? const Padding(
                                padding: EdgeInsets.only(right: 8),
                                child: Icon(Icons.check_circle,
                                    color: Colors.green, size: 18),
                              )
                            : const SizedBox(),
                        const Text(
                          'Faculty',
                          style: AppTexts.regular,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Text(
                      selectedFaculty ?? AppLocalizations.of(context)!.tapToSet,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.end,
                      style: AppTexts.miniRegular.copyWith(
                        color: selectedFaculty == null
                            ? AppColors.clickedTextfieldBorder
                            : Colors.black,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Icon(!isRtl ? Icons.arrow_forward_ios : Icons.arrow_back_ios,
                      color: Colors.red, size: 16),
                ],
              ),
            ),
          ),
          // eeeeeeeeeeeeeeeeeeeeeee
          selectedFaculty != null
              ? Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: InkWell(
                    onTap: () async {
                      final result = await Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => const DepartmentPage()));
                      if (result != null && result is CountriesModel) {
                        setState(() {
                          selectedDepartment = result.name;
                        });
                      } else if (result is String) {
                        setState(() {
                          selectedDepartment = result;
                        });
                      }
                    },
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              selectedDepartment != null
                                  ? const Padding(
                                      padding: EdgeInsets.only(right: 8),
                                      child: Icon(Icons.check_circle,
                                          color: Colors.green, size: 18),
                                    )
                                  : const SizedBox(),
                              const Text(
                                'Department',
                                style: AppTexts.regular,
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Text(
                            selectedDepartment ??
                                AppLocalizations.of(context)!.tapToSet,
                            textAlign: TextAlign.end,
                            overflow: TextOverflow.ellipsis,
                            style: AppTexts.miniRegular.copyWith(
                              color: selectedDepartment == null
                                  ? AppColors.clickedTextfieldBorder
                                  : Colors.black,
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Icon(
                            !isRtl
                                ? Icons.arrow_forward_ios
                                : Icons.arrow_back_ios,
                            color: Colors.red,
                            size: 16),
                      ],
                    ),
                  ),
                )
              : const SizedBox(),
          const SizedBox(height: 24),
          const TextFieldWidget(
            obscureText: false,
            hintText: 'Type your university name',
          ),
        ],
      ),
    );
  }
}
