import 'dart:io';

import 'package:flutter/material.dart';
import 'package:rigow/core/colors/app_colors.dart';
import 'package:rigow/core/common/buttons.dart';
import 'package:rigow/core/common/textfield.dart';
import 'package:rigow/core/fonts/app_text.dart';
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
  // ignore: unused_field
  File? _universitySelectedimage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.grey,
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
                  const ExperienceBody(),
                  const SizedBox(height: 4),
                  const FacultyBody(),
                  const SizedBox(height: 4),
                  CirtificateContainerWidget(
                    onSelectedTakeImage: (takeImage) {},
                    isPdf: true,
                    onSelectedImageBack: (selectedImage) {
                      _universitySelectedimage = selectedImage;
                      setState(() {});
                    },
                    title: 'University degree',
                    iconImage: 'assets/images/cirtificate.png',
                  ),
                  const SizedBox(height: 4),
                  CirtificateContainerWidget(
                    onSelectedTakeImage: (takeImage) {},
                    isPdf: true,
                    onSelectedImageBack: (selectedImage) {},
                    title: 'Other certifications',
                    iconImage: 'assets/images/cirtificate.png',
                  ),
                  const SizedBox(height: 4),
                  CirtificateContainerWidget(
                    isPdf: true,
                    onSelectedTakeImage: (takeImage) {},
                    onSelectedImageBack: (selectedImage) {},
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
                          label: 'Full name in national ID ',
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
                    onSelectedImageBack: (selectedImage) {},
                    title: 'National ID (front)',
                    iconImage: 'assets/images/cirtificate.png',
                  ),
                  const SizedBox(height: 4),
                  CirtificateContainerWidget(
                    onSelectedTakeImage: (takeImage) {},
                    isPdf: false,
                    onSelectedImageBack: (selectedImage) {},
                    title: 'National ID (back)',
                    iconImage: 'assets/images/cirtificate.png',
                    size: 8,
                  ),
                  const SizedBox(height: 32),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 16),
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(8),
                            bottomRight: Radius.circular(8))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Social links',
                          style: AppTexts.title.copyWith(fontSize: 18),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            Icon(
                              Icons.add,
                              size: 24,
                              color: AppColors.iconAdd,
                            ),
                            const SizedBox(width: 8),
                            Text('Add link',
                                style: AppTexts.miniRegular
                                    .copyWith(color: AppColors.hintText))
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 32),
                ],
              ),
            ),
          ),
          ColoredButtonWidget(
            text: 'Next',
            onPressed: () {},
            grideantColors: AppColors.mainRed,
            textColor: Colors.white,
          ),
        ],
      ),
    );
  }
}
