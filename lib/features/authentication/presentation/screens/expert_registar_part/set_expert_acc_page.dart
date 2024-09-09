import 'package:flutter/material.dart';
import 'package:rigow/core/colors/app_colors.dart';
import 'package:rigow/core/common/buttons.dart';
import 'package:rigow/core/common/textfield.dart';
import 'package:rigow/core/fonts/app_text.dart';
import 'package:rigow/features/authentication/presentation/screens/expert_registar_part/social_links_page.dart';
import 'package:rigow/features/authentication/presentation/widgets/expert_part/cirtificate_body.dart';
import 'package:rigow/features/authentication/presentation/widgets/expert_part/experience_body.dart';
import 'package:rigow/features/authentication/presentation/widgets/expert_part/faculty_body.dart';
import 'package:rigow/l10n/app_localizations.dart';

class SetExpertAccountPage extends StatefulWidget {
  final void Function(CollectedExpertEnteredData dataInfo) onNextPressed;
  const SetExpertAccountPage({super.key, required this.onNextPressed});

  @override
  State<SetExpertAccountPage> createState() => _SetExpertAccountPageState();
}

class _SetExpertAccountPageState extends State<SetExpertAccountPage> {
  //! xxxxxxxxx

  int? _specialityId;
  int? _fucltyId;
  int? _departmentId;
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

  @override
  void dispose() {
    _fullNameInNationalId.dispose();
    _nationalIdNumber.dispose();
    _universityName.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                      onSelectedSpecialityIdCallBack: (secialityId) {
                        _specialityId = secialityId;
                        setState(() {});
                      },
                    ),
                    const SizedBox(height: 4),

                    FacultyBody(
                      onSelectedFacultyIdCallBack: (fucltyId) {
                        _fucltyId = fucltyId;
                        setState(() {});
                      },
                      onSelectedDepartmentIdCallBack: (departmentId) {
                        _departmentId = departmentId;
                        setState(() {});
                      },
                      selectedSpecialtyId: _specialityId ?? 0,
                      mycontroller: _universityName,
                    ),
                    const SizedBox(height: 4),
                    CirtificateContainerWidget(
                      onSelectedTakeImage: (takeImage) {},
                      isPdf: true,
                      onSelectedImageBack: (selectedImage) {
                        _universitySelectedimage = selectedImage?.path;
                        _isEnabled();
                        setState(() {});
                      },
                      title: 'University degree',
                      iconImage: 'assets/images/cirtificate.png',
                    ),
                    const SizedBox(height: 4),
                    CirtificateContainerWidget(
                      onSelectedTakeImage: (takeImage) {},
                      isPdf: true,
                      onSelectedImageBack: (selectedImage) {
                        _isEnabled();
                        _otherCertificationsimages = selectedImage?.path;
                      },
                      title: 'Other certifications',
                      iconImage: 'assets/images/cirtificate.png',
                    ),
                    const SizedBox(height: 4),
                    CirtificateContainerWidget(
                      isPdf: true,
                      onSelectedTakeImage: (takeImage) {},
                      onSelectedImageBack: (selectedImage) {
                        _isEnabled();
                        _governmentPermitImage = selectedImage?.path;
                      },
                      title: 'Government permit',
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
                            'Nationality',
                            style: AppTexts.title.copyWith(fontSize: 18),
                          ),
                          const SizedBox(height: 16),
                          TextFieldWidget(
                            mycontroller: _fullNameInNationalId,
                            label: 'Full name in national ID',
                            obscureText: false,
                            hintText: 'Type your full name in your national ID',
                          ),
                          const SizedBox(height: 8),
                          TextFieldWidget(
                            mycontroller: _nationalIdNumber,
                            label: 'National ID number',
                            obscureText: false,
                            hintText: 'Type your national ID number',
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 4),
                    CirtificateContainerWidget(
                      onSelectedTakeImage: (takeImage) {},
                      isPdf: false,
                      onSelectedImageBack: (selectedationalFrontIdImage) {
                        _nationalFrontId = selectedationalFrontIdImage?.path;
                        _isEnabled();
                      },
                      title: 'National ID (front)',
                      iconImage: 'assets/images/cirtificate.png',
                    ),
                    const SizedBox(height: 4),
                    CirtificateContainerWidget(
                      onSelectedTakeImage: (takeImage) {},
                      isPdf: false,
                      onSelectedImageBack: (selectedImage) {
                        __nationalBackId = selectedImage?.path;
                        _isEnabled();
                      },
                      title: 'National ID (back)',
                      iconImage: 'assets/images/cirtificate.png',
                      size: 8,
                    ),
                    const SizedBox(height: 32),
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
              text: 'Next',
              onPressed: _isButtonEnabled
                  ? () {
                      {
                        widget.onNextPressed(
                          CollectedExpertEnteredData(
                            specialityId: _specialityId,
                            facultyId: _fucltyId,
                            departmentId: _departmentId,
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
    if (_universityName.text.isNotEmpty &&
        _nationalIdNumber.text.isNotEmpty &&
        _fullNameInNationalId.text.isNotEmpty &&
        _universitySelectedimage != null &&
        _otherCertificationsimages != null &&
        _governmentPermitImage != null &&
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
  final int? departmentId;
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
