import 'package:flutter/material.dart';
import 'package:rigow/core/colors/app_colors.dart';
import 'package:rigow/core/common/textfield.dart';
import 'package:rigow/core/fonts/app_text.dart';
import 'package:rigow/features/authentication/domain/model/department_model.dart';
import 'package:rigow/features/authentication/domain/model/faculty_model.dart';
import 'package:rigow/features/authentication/presentation/screens/expert_registar_part/department_page.dart';
import 'package:rigow/features/authentication/presentation/screens/expert_registar_part/faculty_page.dart';
import 'package:rigow/l10n/app_localizations.dart';

class FacultyBody extends StatefulWidget {
  const FacultyBody({
    super.key,
    required this.selectedSpecialtyId,
    required this.onSelectedFacultyIdCallBack,
    required this.onSelectedDepartmentIdCallBack,
    required this.mycontroller,
  });
  final int selectedSpecialtyId;
  final void Function(int?) onSelectedFacultyIdCallBack;
  final void Function(int?) onSelectedDepartmentIdCallBack;
  final TextEditingController mycontroller;
  @override
  State<FacultyBody> createState() => _FacultyBodyState();
}

class _FacultyBodyState extends State<FacultyBody> {
  FacultyModel? selectedFaculty;
  DepartmentModel? selectedDepartment;
  // FacultyModel? initialSelect;
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
                final result = await Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => FacultyPage(
                      selectedSpecialtyId: widget.selectedSpecialtyId,
                      initialSelected: FacultyModel(
                        id: selectedFaculty?.id ?? 0,
                        name: selectedFaculty?.name ?? '',
                      ),
                      onSelectedFaculty: (faculty) {
                        setState(() {
                          selectedFaculty = faculty;
                        });
                        widget.onSelectedFacultyIdCallBack(faculty?.id);
                      },
                    ),
                  ),
                );
                if (result != null && result is FacultyModel) {
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
                        Text(
                          AppLocalizations.of(context)!.faculty,
                          style: AppTexts.regular,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Text(
                      selectedFaculty?.name ??
                          AppLocalizations.of(context)!.tapToSet,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.end,
                      style: AppTexts.miniRegular.copyWith(
                        color: selectedFaculty == null
                            ? AppColors.clickedTextfieldBorder
                            : Colors.black,
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
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
                          builder: (context) => DepartmentPage(
                            onSelectedDepartment: (department) {
                              setState(() {
                                selectedDepartment = department;
                              });
                              widget.onSelectedDepartmentIdCallBack(
                                  department?.id);
                              Navigator.pop(context);
                            },
                            initialSelected: DepartmentModel(
                              id: selectedDepartment?.id ?? 0,
                              name: selectedDepartment?.name ?? '',
                            ),
                            facultyId: selectedFaculty?.id ?? -1,
                          ),
                        ),
                      );
                      if (result != null && result is DepartmentModel) {
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
                              Text(
                                AppLocalizations.of(context)!.department,
                                style: AppTexts.regular,
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Text(
                            selectedDepartment?.name ??
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
                        const SizedBox(width: 16),
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
          TextFieldWidget(
            mycontroller: widget.mycontroller,
            obscureText: false,
            hintText: AppLocalizations.of(context)!.typeYourUniversityName,
          ),
        ],
      ),
    );
  }
}
