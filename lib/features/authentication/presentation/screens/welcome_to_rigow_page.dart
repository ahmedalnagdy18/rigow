import 'package:flutter/material.dart';
import 'package:rigow/core/colors/app_colors.dart';
import 'package:rigow/core/common/buttons.dart';
import 'package:rigow/core/fonts/app_text.dart';

class WelcomeToRigowPage extends StatelessWidget {
  const WelcomeToRigowPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    width: 111,
                    height: 33,
                    child: Image.asset(
                      'assets/images/rigow.png',
                      fit: BoxFit.fill,
                    ),
                  ),
                  const SizedBox(height: 16),
                  RedText(
                      text: 'Welcome, Ahmed',
                      gradient: LinearGradient(colors: AppColors.mainRed)),
                  const SizedBox(height: 32),
                  Container(
                    width: 101,
                    height: 101,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                    child: const CircleAvatar(
                      backgroundImage: AssetImage('assets/images/man.png'),
                    ),
                  ),
                  const SizedBox(height: 32),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      'Account was successfully created. You can now connect Rigow Community  and share your activities with them, come on to start your journey',
                      textAlign: TextAlign.center,
                      style: AppTexts.miniRegular,
                    ),
                  ),
                  const SizedBox(height: 24),
                  ColoredButtonWidget(
                      text: 'Next',
                      onPressed: () {
                        // Navigator.of(context).push(MaterialPageRoute(
                        //     builder: (context) => const WelcomeToRigowPage()));
                      },
                      grideantColors: AppColors.mainRed,
                      textColor: Colors.white),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
