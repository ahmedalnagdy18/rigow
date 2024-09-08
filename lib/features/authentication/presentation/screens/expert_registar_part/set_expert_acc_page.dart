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
  const SetExpertAccountPage({super.key});

  @override
  State<SetExpertAccountPage> createState() => _SetExpertAccountPageState();
}

class _SetExpertAccountPageState extends State<SetExpertAccountPage> {
  //! xxxxxxxxxx
  String? _universitySelectedimage;
  String? _otherCertificationsimages;
  String? _governmentPermitImage;
  String? _nationalFrontId;
  String? __nationalBackId;
  int? _specialityId;
  int? _fucltyId;
  int? _departmentId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(AppLocalizations.of(context)!.setYourExpertAccount,
                      style: AppTexts.title),
                  const SizedBox(height: 4),
                  Text(AppLocalizations.of(context)!.confirmYourQualifications,
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
                  ),
                  const SizedBox(height: 4),
                  CirtificateContainerWidget(
                    onSelectedTakeImage: (takeImage) {},
                    isPdf: true,
                    onSelectedImageBack: (selectedImage) {
                      _universitySelectedimage = selectedImage?.path;

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
                        const TextFieldWidget(
                          label: 'Full name in national ID',
                          obscureText: false,
                          hintText: 'Type your full name in your national ID',
                        ),
                        const SizedBox(height: 8),
                        const TextFieldWidget(
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
                    },
                    title: 'National ID (back)',
                    iconImage: 'assets/images/cirtificate.png',
                    size: 8,
                  ),
                  const SizedBox(height: 32),
                  const SocialLinksPage(),
                  const SizedBox(height: 32),
                ],
              ),
            ),
          ),
          ColoredButtonWidget(
            text: 'Next',
            onPressed: () {
              // Navigator.of(context).push(MaterialPageRoute(
              // builder: (context) => const Page4()));
              print(
                  'result: 1=== $_specialityId, 2==== $_fucltyId, 3=== $_departmentId');
              print(_universitySelectedimage);
              print(_otherCertificationsimages);
              print(_governmentPermitImage);
              print(_nationalFrontId);
              print(__nationalBackId);
            },
            grideantColors: AppColors.mainRed,
            textColor: Colors.white,
          ),
        ],
      ),
    );
  }
}
