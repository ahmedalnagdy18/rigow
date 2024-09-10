import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rigow/core/colors/app_colors.dart';
import 'package:rigow/core/common/buttons.dart';
import 'package:rigow/core/fonts/app_text.dart';
import 'package:rigow/features/authentication/domain/entities/register_part_entity/complete_profile_entity/complete_expert_profile_data_input.dart';
import 'package:rigow/features/authentication/presentation/cubits/main_complete_expert_cubit/complete_expert_cubit.dart';
import 'package:rigow/features/authentication/presentation/cubits/main_complete_expert_cubit/complete_expert_state.dart';
import 'package:rigow/features/authentication/presentation/screens/welcome_to_rigow_page.dart';
import 'package:rigow/injection_container.dart';

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
      required this.role});
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

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          CompleteExpertCubit(completeExpertProfileUsecase: sl()),
      child: _ExpertPolicesPage(
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
      ),
    );
  }
}

class _ExpertPolicesPage extends StatefulWidget {
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
      required this.role});

  @override
  State<_ExpertPolicesPage> createState() => _ExpertPolicesPageState();
}

class _ExpertPolicesPageState extends State<_ExpertPolicesPage> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CompleteExpertCubit, CompleteExpertState>(
        listener: (context, state) {
      if (state is ErrorCompleteExpertState) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.red,
          content: Text(state.message.toString()),
          action: SnackBarAction(
            label: 'Undo',
            textColor: Colors.white,
            onPressed: () {},
          ),
        ));
      }
    }, builder: (context, state) {
      return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Expert account Polices",
                      style: AppTexts.title,
                    ),
                    SizedBox(height: 8),
                    Text(
                      "To have an expert user account in the RIGOW, the following policies could be implemented:",
                      style: AppTexts.medium,
                    ),
                    SizedBox(height: 30),
                    PolicesTextWidget(
                      title: "Certification Requirement: ",
                      hintText:
                          "You must provide proof of certification or accreditation in a relevant fitness or wellness field to make sure that you have the necessary knowledge and expertise to contribute meaningfully to the community.",
                    ),
                    SizedBox(height: 24),
                    PolicesTextWidget(
                      title: "Content Quality Standards: ",
                      hintText:
                          "you are required to maintain high-quality standards in your content, including accuracy, relevance, and professionalism. Regular audits or reviews of your posts may be conducted to ensure adherence to these standards.",
                    ),
                    SizedBox(height: 24),
                    PolicesTextWidget(
                      title: "Engagement Criteria: ",
                      hintText:
                          "you should demonstrate active engagement within the RIGOW community by regularly posting informative and valuable content, interacting with other users, and participating in discussions or challenges related to fitness and wellness.",
                    ),
                    SizedBox(height: 24),
                    PolicesTextWidget(
                      title: "Community Contribution: ",
                      hintText:
                          "Expert users encourage other users to contribute to the community by sharing insights, offering advice, and providing support to them. Their contributions should enrich the overall experience of the app and align with its mission of promoting health and well-being.",
                    ),
                    SizedBox(height: 24),
                    PolicesTextWidget(
                      title: "Continuous Education: ",
                      hintText:
                          "Expert users are expected to stay updated with the latest trends, research, and developments in the fitness and wellness industry. Participation in continuing education programs or workshops may be encouraged to ensure your knowledge remains current and relevant.",
                    ),
                    SizedBox(height: 24),
                    PolicesTextWidget(
                      title: "Review Process: ",
                      hintText:
                          "The upgrade to an expert user account may involve a review process conducted by the app administrators or a designated panel. This review assesses the user's qualifications, experience, and contributions to determine eligibility for the expert status.",
                    ),
                    SizedBox(height: 24),
                    PolicesTextWidget(
                      title: "Code of Conduct: ",
                      hintText:
                          "Expert users must adhere to a strict code of conduct, which prohibits the dissemination of false information, engagement in harmful practices, or any behavior that undermines the integrity of the RIGOW community.",
                    ),
                    SizedBox(height: 24),
                    Text(
                      "By implementing these policies, RIGOW can ensure that its expert user accounts uphold the highest standards of professionalism, expertise, and contribution to foster a vibrant and supportive community focused on fitness and wellness.",
                      style: AppTexts.regular,
                    ),
                    SizedBox(height: 30),
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
                          )));
                }
              },
              child: ColoredButtonWidget(
                text: 'Send the request',
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
        profilePicture: 'test.com',
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
