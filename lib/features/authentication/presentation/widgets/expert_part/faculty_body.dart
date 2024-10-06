import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rigow/core/colors/app_colors.dart';
import 'package:rigow/core/common/textfield.dart';
import 'package:rigow/core/extentions/app_extentions.dart';
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
    required this.selectedFaculty,
    required this.selectedDepartment,
    required this.customFaculty,
    required this.customDepartment,
    required this.initialSelected,
    required this.initialSelectedDepartment,
  });
  final int selectedSpecialtyId;
  final String customFaculty;
  final String customDepartment;
  final void Function(FacultyModel?) onSelectedFacultyIdCallBack;
  final void Function(DepartmentModel?) onSelectedDepartmentIdCallBack;
  final TextEditingController mycontroller;
  final FacultyModel? selectedFaculty;
  final DepartmentModel? selectedDepartment;
  final FacultyModel? initialSelected;
  final DepartmentModel? initialSelectedDepartment;
  @override
  State<FacultyBody> createState() => _FacultyBodyState();
}

class _FacultyBodyState extends State<FacultyBody> {
  // ignore: unused_field
  FacultyModel? _faculty;
  // ignore: unused_field
  DepartmentModel? _department;
  @override
  void initState() {
    _faculty = widget.selectedFaculty;
    _department = widget.selectedDepartment;
    super.initState();
  }

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
                if (widget.selectedSpecialtyId == -1) {
                  showErrorToastMessage(message: "Select Specialty First");
                } else {
                  final result = await Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => FacultyPage(
                        selectedSpecialtyId: widget.selectedSpecialtyId,
                        initialSelected: widget.initialSelected,
                        onSelectedFaculty: (faculty) {
                          setState(() {
                            _faculty = faculty;
                          });
                          widget.onSelectedFacultyIdCallBack(faculty);
                        },
                      ),
                    ),
                  );
                  if (result != null && result is FacultyModel) {
                    setState(() {
                      _faculty = result;
                    });
                  }
                }
              },
              child: Row(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        widget.selectedFaculty != null
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
                      widget.selectedFaculty?.name ??
                          AppLocalizations.of(context)!.tapToSet,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.end,
                      style: AppTexts.miniRegular.copyWith(
                        color: widget.selectedFaculty == null
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
          widget.selectedFaculty != null
              ? Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: InkWell(
                    onTap: () async {
                      final result = await Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => DepartmentPage(
                            specialtyId: widget.selectedSpecialtyId,
                            onSelectedDepartment: (department) {
                              setState(() {
                                _department = department;
                              });
                              widget.onSelectedDepartmentIdCallBack(department);
                              Navigator.pop(context);
                            },
                            initialSelected: widget.initialSelectedDepartment,
                            facultyId: widget.selectedFaculty?.id ?? -1,
                          ),
                        ),
                      );
                      if (result != null && result is DepartmentModel) {
                        setState(() {
                          _department = result;
                        });
                      }
                    },
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              widget.selectedDepartment != null
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
                            widget.selectedDepartment?.name ??
                                AppLocalizations.of(context)!.tapToSet,
                            textAlign: TextAlign.end,
                            overflow: TextOverflow.ellipsis,
                            style: AppTexts.miniRegular.copyWith(
                              color: widget.selectedDepartment == null
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
            maxLength: 25,
            counterText: '',
            inputFormatters: [
              FilteringTextInputFormatter.allow(
                RegExp(r'[a-zA-Z\u0600-\u06FF\s]'),
              ),
              TextInputFormatter.withFunction(
                (oldValue, newValue) {
                  if (newValue.text.startsWith(' ')) {
                    final newText = newValue.text.trimLeft();
                    return newValue.copyWith(
                      text: newText,
                      selection: TextSelection.fromPosition(
                        TextPosition(offset: newText.length),
                      ),
                    );
                  }
                  return newValue;
                },
              ),
            ],
            hintText: AppLocalizations.of(context)!.typeYourUniversityName,
          ),
        ],
      ),
    );
  }
}
