import 'package:flutter/material.dart';
import 'package:rigow/core/colors/app_colors.dart';
import 'package:rigow/core/common/buttons.dart';
import 'package:rigow/core/fonts/app_text.dart';

class ExpertPolicesPage extends StatelessWidget {
  final VoidCallback onNextPress;

  const ExpertPolicesPage({super.key, required this.onNextPress});

  @override
  Widget build(BuildContext context) {
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
          ColoredButtonWidget(
            text: 'Send the request',
            onPressed: onNextPress,
            grideantColors: AppColors.mainRed,
            textColor: Colors.white,
          ),
        ],
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
