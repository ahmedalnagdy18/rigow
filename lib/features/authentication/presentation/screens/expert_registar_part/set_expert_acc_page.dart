import 'dart:io';

import 'package:flutter/material.dart';
import 'package:rigow/core/colors/app_colors.dart';
import 'package:rigow/core/common/textfield.dart';
import 'package:rigow/core/fonts/app_text.dart';
import 'package:rigow/features/authentication/domain/model/countries_model.dart';
import 'package:rigow/features/authentication/presentation/screens/expert_registar_part/specialty_page.dart';
import 'package:rigow/features/authentication/presentation/widgets/experience_widget.dart';
import 'package:rigow/l10n/app_localizations.dart';

class SetExpertAccountPage extends StatefulWidget {
  const SetExpertAccountPage({super.key});

  @override
  State<SetExpertAccountPage> createState() => _SetExpertAccountPageState();
}

class _SetExpertAccountPageState extends State<SetExpertAccountPage> {
  String? selectedSpecialty;
  String? selectedFaculty;
  String? selectedDepartment;
  File? _universitySelectedimage;

  @override
  Widget build(BuildContext context) {
    bool isRtl = Localizations.localeOf(context).languageCode == 'ar';
    return Scaffold(
      backgroundColor: AppColors.grey,
      body: SingleChildScrollView(
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
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
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
                        selectedSpecialty ??
                            AppLocalizations.of(context)!.tapToSet,
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
                            !isRtl
                                ? Icons.arrow_forward_ios
                                : Icons.arrow_back_ios,
                            color: Colors.red,
                            size: 16),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 4),
            Container(
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
                                builder: (context) => const SpecialtyPage()));
                        if (result != null && result is CountriesModel) {
                          setState(() {
                            selectedFaculty = result.name;
                          });
                        }
                      },
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                selectedFaculty != null
                                    ? const Padding(
                                        padding: EdgeInsets.only(right: 8),
                                        child: Icon(Icons.verified,
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
                          Text(
                            selectedFaculty ??
                                AppLocalizations.of(context)!.tapToSet,
                            style: AppTexts.miniRegular.copyWith(
                              color: selectedFaculty == null
                                  ? AppColors.clickedTextfieldBorder
                                  : Colors.black,
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
                  ),
                  // eeeeeeeeeeeeeeeeeeeeeee
                  selectedFaculty != null
                      ? Padding(
                          padding: const EdgeInsets.only(top: 30),
                          child: InkWell(
                            onTap: () async {
                              final result = await Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const SpecialtyPage()));
                              if (result != null && result is CountriesModel) {
                                setState(() {
                                  selectedDepartment = result.name;
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
                                              padding:
                                                  EdgeInsets.only(right: 8),
                                              child: Icon(Icons.verified,
                                                  color: Colors.green,
                                                  size: 18),
                                            )
                                          : const SizedBox(),
                                      const Text(
                                        'Department',
                                        style: AppTexts.regular,
                                      ),
                                    ],
                                  ),
                                ),
                                Text(
                                  selectedDepartment ??
                                      AppLocalizations.of(context)!.tapToSet,
                                  style: AppTexts.miniRegular.copyWith(
                                    color: selectedDepartment == null
                                        ? AppColors.clickedTextfieldBorder
                                        : Colors.black,
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
            ),
            const SizedBox(height: 4),
            CirtificateContainerWidget(
              onSelectedImageBack: (selectedImage) {
                _universitySelectedimage = selectedImage;
                print(_universitySelectedimage);
                setState(() {});
              },
              title: 'University degree',
              iconImage: 'assets/images/cirtificate.png',
            ),
            const SizedBox(height: 4),
            CirtificateContainerWidget(
              onSelectedImageBack: (selectedImage) {},
              title: 'Other certifications',
              iconImage: 'assets/images/cirtificate.png',
            ),
            const SizedBox(height: 4),
            CirtificateContainerWidget(
              onSelectedImageBack: (selectedImage) {},
              title: 'Government permit',
              iconImage: 'assets/images/file.png',
              size: 8,
            ),
            const SizedBox(height: 32),
            //! Nationality part
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
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
                    obscureText: false,
                    hintText: 'Type your full name in your national ID',
                  ),
                  const SizedBox(height: 8),
                  const TextFieldWidget(
                    obscureText: false,
                    hintText: 'Type your national ID number',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 4),
            CirtificateContainerWidget(
              onSelectedImageBack: (selectedImage) {},
              title: 'National ID (front)',
              iconImage: 'assets/images/cirtificate.png',
            ),
            const SizedBox(height: 4),
            CirtificateContainerWidget(
              onSelectedImageBack: (selectedImage) {},
              title: 'National ID (back)',
              iconImage: 'assets/images/cirtificate.png',
              size: 8,
            ),
            const SizedBox(height: 32),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
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
    );
  }
}
