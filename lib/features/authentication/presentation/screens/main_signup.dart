import 'package:flutter/material.dart';
import 'package:rigow/core/colors/app_colors.dart';
import 'package:rigow/core/common/custom_indicator.dart';
import 'package:rigow/features/authentication/presentation/screens/signup_by_email_page.dart';
import 'package:rigow/features/authentication/presentation/screens/verification_page.dart';
import 'package:rigow/features/authentication/presentation/widgets/authentication_appbar.dart';

class MainSignUpPage extends StatefulWidget {
  const MainSignUpPage({super.key});

  @override
  State<MainSignUpPage> createState() => _MainSignUpPageState();
}

class _MainSignUpPageState extends State<MainSignUpPage> {
  int _currint = 0;
  final PageController _controller = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const AuthenticationAppbar(
        title: 'Sign up',
        automaticallyImplyLeading: true,
      ),
      resizeToAvoidBottomInset: false,
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
                    SignupByEmailPage(
                      onPressed: () {
                        _controller.jumpToPage(1);

                        setState(() {
                          _currint = 1;
                        });
                      },
                    ),
                    VerificationPage(
                      onTap: () {
                        _controller.jumpToPage(0);

                        setState(() {
                          _currint = 0;
                        });
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
