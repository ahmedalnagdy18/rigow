import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rigow/core/colors/app_colors.dart';
import 'package:rigow/core/common/buttons.dart';
import 'package:rigow/core/common/textfield.dart';
import 'package:rigow/core/extentions/app_extentions.dart';
import 'package:rigow/core/fonts/app_text.dart';
import 'package:rigow/features/authentication/domain/model/department_model.dart';
import 'package:rigow/features/authentication/domain/model/faculty_model.dart';
import 'package:rigow/features/authentication/domain/model/specialty_model.dart';
import 'package:rigow/features/authentication/presentation/screens/expert_registar_part/social_links_page.dart';
import 'package:rigow/features/authentication/presentation/widgets/expert_part/cirtificate_body.dart';
import 'package:rigow/features/authentication/presentation/widgets/expert_part/experience_body.dart';
import 'package:rigow/features/authentication/presentation/widgets/expert_part/faculty_body.dart';
import 'package:rigow/l10n/app_localizations.dart';
import 'package:path/path.dart' as path;

class SetExpertAccountPage extends StatefulWidget {
  final void Function(CollectedExpertEnteredData dataInfo) onNextPressed;
  const SetExpertAccountPage({super.key, required this.onNextPressed});

  @override
  State<SetExpertAccountPage> createState() => _SetExpertAccountPageState();
}

class _SetExpertAccountPageState extends State<SetExpertAccountPage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  String? customFaculty;
  String? customDepartment;
  int? _specialityId;
  FacultyModel? _fucltyModel;
  DepartmentModel? _department;
  String? _universitySelectedimage;
  String? _otherCertificationsimages;
  String? _governmentPermitImage;
  String? _nationalFrontId;
  String? __nationalBackId;
  final _fullNameInNationalId = TextEditingController();
  final _nationalIdNumber = TextEditingController();
  final _universityName = TextEditingController();
  List<String>? _socialLinks;
  bool _isButtonEnabled = false;
  SpecialtyModel? specialtyModel;

  @override
  void dispose() {
    _fullNameInNationalId.dispose();
    _nationalIdNumber.dispose();
    _universityName.dispose();
    super.dispose();
  }

  bool _checkIfFileIsPdf(String? filePath) {
    if (filePath == null) return false;
    final extension = path.extension(filePath).toLowerCase();
    return extension == '.pdf';
  }

  bool _checkIfFileIsPdfs(String? filePath) {
    if (filePath == null) return false;
    final extension = path.extension(filePath).toLowerCase();
    return extension == '.pdf';
  }

  bool validateNationalId(String nationalId) {
    return nationalId.length == 14 && RegExp(r'^\d+$').hasMatch(nationalId);
  }

  bool universityName(String universityName) {
    return universityName.length >= 4 &&
        RegExp(r'^[a-zA-Z\u0600-\u06FF\s]+$').hasMatch(universityName);
  }

  bool _isShowGovernmentPermit = false;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Form(
        onChanged: _isEnabled,
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(AppLocalizations.of(context)!.setYourExpertAccount,
                        style: AppTexts.title),
                    const SizedBox(height: 4),
                    Text(
                        AppLocalizations.of(context)!.confirmYourQualifications,
                        style: AppTexts.miniRegular),
                    const SizedBox(height: 32),
                    //! experience part
                    ExperienceBody(
                      facultyModel:
                          _fucltyModel ?? const FacultyModel(id: -1, name: ""),
                      onSelectedSpecialityIdCallBack: (seciality) {
                        _specialityId = seciality?.id ?? -1;
                        _isShowGovernmentPermit =
                            seciality?.governmentPermitRequired ?? false;
                        _fucltyModel = null;
                        _department = null;

                        setState(() {});
                      },
                    ),
                    const SizedBox(height: 4),
                    FacultyBody(
                      initialSelected: _fucltyModel,
                      customDepartment: customDepartment =
                          _department?.name ?? "",
                      customFaculty: customFaculty = _fucltyModel?.name ?? "",
                      selectedDepartment: _department,
                      selectedFaculty: _fucltyModel,
                      initialSelectedDepartment: _department,
                      onSelectedFacultyIdCallBack: (fuclty) {
                        _fucltyModel = FacultyModel(
                            id: fuclty?.id, name: fuclty?.name ?? '');
                        _department = null;
                        setState(() {});
                      },
                      onSelectedDepartmentIdCallBack: (department) {
                        _department = DepartmentModel(
                            id: department?.id, name: department?.name ?? "");
                        setState(() {});
                      },
                      selectedSpecialtyId: _specialityId ?? -1,
                      mycontroller: _universityName,
                    ),
                    const SizedBox(height: 4),
                    //university

                    CirtificateContainerWidget(
                      key: ValueKey(_isEnabled()),
                      isPdf: _checkIfFileIsPdfs(_universitySelectedimage),
                      onSelectedImageBack: (selectedImage) {
                        setState(() {
                          _universitySelectedimage = selectedImage?.path;
                          _isEnabled();
                        });
                      },
                      title: AppLocalizations.of(context)!.universityDegree,
                      iconImage: 'assets/images/cirtificate.png',
                    ),
                    const SizedBox(height: 4),
                    //otherCertifications

                    CirtificateContainerWidget(
                      isPdf: _checkIfFileIsPdf(_otherCertificationsimages),
                      onSelectedImageBack: (selectedImage) {
                        _isEnabled();
                        _otherCertificationsimages = selectedImage?.path;
                      },
                      title: AppLocalizations.of(context)!.otherCertifications,
                      iconImage: 'assets/images/cirtificate.png',
                      size: _isShowGovernmentPermit ? 0 : 8,
                    ),
                    const SizedBox(height: 4),
                    //governmentPermitImage
                    if (_isShowGovernmentPermit)
                      CirtificateContainerWidget(
                        isPdf: _checkIfFileIsPdf(_governmentPermitImage),
                        onSelectedImageBack: (selectedImage) {
                          _isEnabled();
                          _governmentPermitImage = selectedImage?.path;
                        },
                        title: AppLocalizations.of(context)!.governmentPermit,
                        iconImage: 'assets/images/file.png',
                        size: 8,
                      ),
                    const SizedBox(height: 32),
                    //! Nationality part
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 16),
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(8),
                              topRight: Radius.circular(8))),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            AppLocalizations.of(context)!.nationality,
                            style: AppTexts.title.copyWith(fontSize: 18),
                          ),
                          const SizedBox(height: 16),
                          //fullNameInNationalId

                          TextFieldWidget(
                            counterText: '',
                            maxLength: 50,
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                RegExp(r'[\u0600-\u06FF\s]'),
                              ),
                              noSpaceFormatter(),
                            ],
                            mycontroller: _fullNameInNationalId,
                            label: AppLocalizations.of(context)!
                                .fullNameInNationalId,
                            obscureText: false,
                            hintText: AppLocalizations.of(context)!
                                .typeYourFullNationalId,
                          ),
                          const SizedBox(height: 8),
                          //nationalIdNumber

                          TextFieldWidget(
                            mycontroller: _nationalIdNumber,
                            counterText: '',
                            keyboardType:
                                const TextInputType.numberWithOptions(),
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                            maxLength: 14,
                            label:
                                AppLocalizations.of(context)!.nationalIdNumber,
                            obscureText: false,
                            hintText: AppLocalizations.of(context)!
                                .typeYourNationalIdNumber,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 4),
                    //nationalFrontId

                    CirtificateContainerWidget(
                      isPdf: _checkIfFileIsPdf(_nationalFrontId),
                      onSelectedImageBack: (selectedationalFrontIdImage) {
                        _nationalFrontId = selectedationalFrontIdImage?.path;
                        _isEnabled();
                      },
                      title: AppLocalizations.of(context)!.nationalIdFront,
                      iconImage: 'assets/images/cirtificate.png',
                    ),
                    const SizedBox(height: 4),
                    //nationalBackId

                    CirtificateContainerWidget(
                      isPdf: _checkIfFileIsPdf(__nationalBackId),
                      onSelectedImageBack: (selectedImage) {
                        __nationalBackId = selectedImage?.path;
                        _isEnabled();
                      },
                      title: AppLocalizations.of(context)!.nationalIdBack,
                      iconImage: 'assets/images/cirtificate.png',
                      size: 8,
                    ),
                    const SizedBox(height: 32),
                    //! SocialLinks

                    SocialLinksPage(
                      getSocialLinks: (links) {
                        _socialLinks = links;

                        setState(() {});
                      },
                    ),
                    const SizedBox(height: 32),
                  ],
                ),
              ),
            ),
            ColoredButtonWidget(
              text: AppLocalizations.of(context)!.next,
              onPressed: _isButtonEnabled
                  ? () {
                      {
                        String customFacultyValue = (_fucltyModel?.id == null)
                            ? customFaculty ?? ""
                            : "";
                        String customDepartmentValue = (_department?.id == null)
                            ? customDepartment ?? ""
                            : "";

                        widget.onNextPressed(
                          CollectedExpertEnteredData(
                            customFaculty: customFacultyValue,
                            specialityId: _specialityId,
                            facultyId: _fucltyModel?.id,
                            departmentId: _department?.id,
                            universityImage: _universitySelectedimage,
                            otherCertificationsImage:
                                _otherCertificationsimages,
                            governmentPermitImage: _governmentPermitImage,
                            nationalFrontId: _nationalFrontId,
                            nationalBackId: __nationalBackId,
                            fullNameInNationalId: _fullNameInNationalId.text,
                            nationalIdNumber: _nationalIdNumber.text,
                            universityName: _universityName.text,
                            socialLinks: _socialLinks,
                            customDepartment: customDepartmentValue,
                          ),
                        );
                      }
                    }
                  : null,
              grideantColors: !_isButtonEnabled
                  ? [AppColors.darkGrey, AppColors.darkGrey]
                  : AppColors.mainRed,
              textColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }

  void _isEnabled() {
    bool isNationalIdValid = validateNationalId(_nationalIdNumber.text);
    bool universityNameValid = universityName(_universityName.text);

    if (_fucltyModel != null &&
        _department != null &&
        universityNameValid &&
        isNationalIdValid &&
        _universityName.text.isNotEmpty &&
        _nationalIdNumber.text.isNotEmpty &&
        _fullNameInNationalId.text.isNotEmpty &&
        _universitySelectedimage != null &&
        _nationalFrontId != null &&
        __nationalBackId != null) {
      _isButtonEnabled = true;
    } else {
      _isButtonEnabled = false;
    }
    setState(() {});
  }
}

class CollectedExpertEnteredData {
  final int? specialityId;
  final int? facultyId;
  final String? customFaculty;
  final int? departmentId;
  final String? customDepartment;
  final String? universityImage;
  final String? universityName;
  final String? otherCertificationsImage;
  final String? governmentPermitImage;
  final String? nationalFrontId;
  final String? nationalBackId;
  final String? fullNameInNationalId;
  final String? nationalIdNumber;
  final List<String>? socialLinks;

  CollectedExpertEnteredData({
    required this.customDepartment,
    required this.customFaculty,
    required this.specialityId,
    required this.facultyId,
    required this.universityName,
    required this.departmentId,
    required this.universityImage,
    required this.otherCertificationsImage,
    required this.governmentPermitImage,
    required this.nationalFrontId,
    required this.fullNameInNationalId,
    required this.nationalIdNumber,
    required this.nationalBackId,
    required this.socialLinks,
  });
}
