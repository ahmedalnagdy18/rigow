import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rigow/core/colors/app_colors.dart';
import 'package:rigow/core/common/buttons.dart';
import 'package:rigow/core/extentions/app_extentions.dart';
import 'package:rigow/core/fonts/app_text.dart';
import 'package:rigow/features/authentication/domain/entities/register_part_entity/complete_profile_entity/complete_expert_profile_data_input.dart';
import 'package:rigow/features/authentication/presentation/cubits/main_complete_expert_cubit/complete_expert_cubit.dart';
import 'package:rigow/features/authentication/presentation/cubits/main_complete_expert_cubit/complete_expert_state.dart';
import 'package:rigow/features/authentication/presentation/screens/welcome_to_rigow_page.dart';
import 'package:rigow/injection_container.dart';
import 'package:rigow/l10n/app_localizations.dart';

class ExpertPolicesPage extends StatelessWidget {
  const ExpertPolicesPage(
      {super.key,
      required this.bioText,
      required this.username,
      required this.gender,
      required this.birthdate,
      required this.countryId,
      required this.statesId,
      required this.areaId,
      required this.specialityId,
      required this.facultyId,
      required this.departmentId,
      required this.universityImage,
      required this.universityName,
      required this.otherCertificationsImage,
      required this.governmentPermitImage,
      required this.nationalFrontId,
      required this.nationalBackId,
      required this.fullNameInNationalId,
      required this.nationalIdNumber,
      required this.socialLinks,
      required this.firstName,
      required this.role,
      required this.imageOfprofile,
      required this.onSendRequestPressed});
  final String imageOfprofile;
  final String bioText;
  final String username;
  final String gender;
  final DateTime birthdate;
  final int countryId;
  final int statesId;
  final int areaId;
  final int specialityId;
  final int facultyId;
  final int departmentId;
  final String universityImage;
  final String universityName;
  final String otherCertificationsImage;
  final String governmentPermitImage;
  final String nationalFrontId;
  final String nationalBackId;
  final String fullNameInNationalId;
  final String nationalIdNumber;
  final List<String> socialLinks;
  final String firstName;
  final String role;
  final void Function() onSendRequestPressed;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          CompleteExpertCubit(completeExpertProfileUsecase: sl()),
      child: _ExpertPolicesPage(
        imageOfprofile: imageOfprofile,
        bioText: bioText,
        username: username,
        gender: gender,
        birthdate: birthdate,
        countryId: countryId,
        statesId: statesId,
        areaId: areaId,
        specialityId: specialityId,
        facultyId: facultyId,
        departmentId: departmentId,
        universityImage: universityImage,
        universityName: universityName,
        otherCertificationsImage: otherCertificationsImage,
        governmentPermitImage: governmentPermitImage,
        nationalFrontId: nationalFrontId,
        nationalBackId: nationalBackId,
        fullNameInNationalId: fullNameInNationalId,
        nationalIdNumber: nationalIdNumber,
        socialLinks: socialLinks,
        firstName: firstName,
        role: role,
        onSendRequestPressed: onSendRequestPressed,
      ),
    );
  }
}

class _ExpertPolicesPage extends StatefulWidget {
  final String imageOfprofile;
  final String bioText;
  final String username;
  final String gender;
  final DateTime birthdate;
  final int countryId;
  final int statesId;
  final int areaId;
  final int specialityId;
  final int facultyId;
  final int departmentId;
  final String universityImage;
  final String universityName;
  final String otherCertificationsImage;
  final String governmentPermitImage;
  final String nationalFrontId;
  final String nationalBackId;
  final String fullNameInNationalId;
  final String nationalIdNumber;
  final List<String> socialLinks;
  final String firstName;
  final String role;
  final void Function() onSendRequestPressed;

  const _ExpertPolicesPage(
      {required this.bioText,
      required this.username,
      required this.gender,
      required this.birthdate,
      required this.countryId,
      required this.statesId,
      required this.areaId,
      required this.specialityId,
      required this.facultyId,
      required this.departmentId,
      required this.universityImage,
      required this.universityName,
      required this.otherCertificationsImage,
      required this.governmentPermitImage,
      required this.nationalFrontId,
      required this.nationalBackId,
      required this.fullNameInNationalId,
      required this.nationalIdNumber,
      required this.socialLinks,
      required this.firstName,
      required this.role,
      required this.imageOfprofile,
      required this.onSendRequestPressed});

  @override
  State<_ExpertPolicesPage> createState() => _ExpertPolicesPageState();
}

class _ExpertPolicesPageState extends State<_ExpertPolicesPage> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CompleteExpertCubit, CompleteExpertState>(
        listener: (context, state) {
      if (state is ErrorCompleteExpertState) {
        showErrorToastMessage(message: state.message);
      }
    }, builder: (context, state) {
      return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.expertAccountPolices,
                      style: AppTexts.title,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      AppLocalizations.of(context)!.toHaveExpertUserRIGOW,
                      style: AppTexts.medium,
                    ),
                    const SizedBox(height: 30),
                    PolicesTextWidget(
                      title: AppLocalizations.of(context)!.policesTitle1,
                      hintText: AppLocalizations.of(context)!.policesHintText1,
                    ),
                    const SizedBox(height: 24),
                    PolicesTextWidget(
                      title: AppLocalizations.of(context)!.policesTitle2,
                      hintText: AppLocalizations.of(context)!.policesHintText2,
                    ),
                    const SizedBox(height: 24),
                    PolicesTextWidget(
                      title: AppLocalizations.of(context)!.policesTitle3,
                      hintText: AppLocalizations.of(context)!.policesHintText3,
                    ),
                    const SizedBox(height: 24),
                    PolicesTextWidget(
                      title: AppLocalizations.of(context)!.policesTitle4,
                      hintText: AppLocalizations.of(context)!.policesHintText4,
                    ),
                    const SizedBox(height: 24),
                    PolicesTextWidget(
                      title: AppLocalizations.of(context)!.policesTitle5,
                      hintText: AppLocalizations.of(context)!.policesHintText5,
                    ),
                    const SizedBox(height: 24),
                    PolicesTextWidget(
                      title: AppLocalizations.of(context)!.policesTitle6,
                      hintText: AppLocalizations.of(context)!.policesHintText6,
                    ),
                    const SizedBox(height: 24),
                    PolicesTextWidget(
                      title: AppLocalizations.of(context)!.policesTitle7,
                      hintText: AppLocalizations.of(context)!.policesHintText7,
                    ),
                    const SizedBox(height: 24),
                    Text(
                      AppLocalizations.of(context)!.policesEndText,
                      style: AppTexts.regular,
                    ),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ),
            BlocListener<CompleteExpertCubit, CompleteExpertState>(
              listener: (context, state) {
                if (state is SucsessCompleteExpertState) {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => WelcomeToRigowPage(
                            firstName: widget.firstName,
                            role: widget.role,
                            imageOfprofile: widget.imageOfprofile,
                          )));
                }
                if (state is ErrorCompleteExpertState) {
                  widget.onSendRequestPressed();
                }
              },
              child: ColoredButtonWidget(
                text: AppLocalizations.of(context)!.sendTheRequest,
                onPressed: () {
                  _sendRequestButton(context);
                },
                grideantColors: AppColors.mainRed,
                textColor: Colors.white,
              ),
            ),
          ],
        ),
      );
    });
  }

  void _sendRequestButton(BuildContext context) {
    BlocProvider.of<CompleteExpertCubit>(context).setExpertData(
      CompleteExpertProfileInput(
        profilePicture: widget.imageOfprofile,
        username: widget.username,
        bio: widget.bioText,
        gender: widget.gender,
        birthDate: widget.birthdate,
        countryId: widget.countryId,
        cityId: widget.areaId,
        stateId: widget.statesId,
        specialtyId: widget.specialityId,
        facultyId: widget.facultyId,
        departmentId: widget.departmentId,
        universityDegreeUrl: widget.universityImage,
        universityName: widget.universityName,
        otherCertificates: [widget.otherCertificationsImage],
        governmentPermitUrl: widget.governmentPermitImage,
        nationalIdFront: widget.nationalFrontId,
        nationalIdBack: widget.nationalBackId,
        customDepartment: 'test.com',
        customFaculty: 'test.com',
        fullNameInNationalId: widget.fullNameInNationalId,
        nationalIdNumber: widget.nationalIdNumber,
        socialLinks: widget.socialLinks,
      ),
    );
  }
}

class PolicesTextWidget extends StatelessWidget {
  const PolicesTextWidget(
      {super.key, required this.title, required this.hintText});
  final String title;
  final String hintText;
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: title,
            style: AppTexts.midTitle,
          ),
          TextSpan(
            text: hintText,
            style: AppTexts.regular.copyWith(
              color: AppColors.tapBorder,
            ),
          ),
        ],
      ),
      textAlign: TextAlign.start,
    );
  }
}
