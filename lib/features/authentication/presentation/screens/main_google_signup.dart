import 'package:flutter/material.dart';
import 'package:rigow/core/colors/app_colors.dart';
import 'package:rigow/core/common/custom_indicator.dart';
import 'package:rigow/features/authentication/presentation/screens/complete_profile_page.dart';
import 'package:rigow/features/authentication/presentation/screens/google_signup_page.dart';
import 'package:rigow/features/authentication/presentation/screens/welcome_to_rigow_page.dart';
import 'package:rigow/features/authentication/presentation/widgets/authentication_appbar.dart';

class MainGoogleSignUpPage extends StatefulWidget {
  const MainGoogleSignUpPage({super.key});

  @override
  State<MainGoogleSignUpPage> createState() =>
      _MainCompleteYourProfilePageState();
}

class _MainCompleteYourProfilePageState extends State<MainGoogleSignUpPage> {
  int _currint = 0;
  final PageController _controller = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AuthenticationAppbar(
        title: _currint == 0 ? 'Sign up' : 'Complete Profile',
        automaticallyImplyLeading: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            children: [
              CustomIndicator(
                colors:
                    _currint == 1 ? AppColors.mainRed : AppColors.greyLoader,
              ),
              const SizedBox(height: 24),
              Expanded(
                child: PageView(
                  physics: const NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  controller: _controller,
                  onPageChanged: (int value) {
                    setState(() {
                      _currint = value;
                    });
                  },
                  children: [
                    GoogleSignupPage(
                      onPressed: () {
                        _controller.jumpToPage(1);

                        setState(() {
                          _currint = 1;
                        });
                      },
                    ),
                    CompleteProfilePage(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => const WelcomeToRigowPage()));
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
