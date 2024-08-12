import 'package:flutter/material.dart';
import 'package:rigow/core/common/buttons.dart';
import 'package:rigow/features/onboarding/widgets/dots_widget.dart';
import 'package:rigow/features/onboarding/widgets/onboarding_widget.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController pageController = PageController();
  int currentPage = 0;

  @override
  void initState() {
    currentPage = pageController.initialPage;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: PageView.builder(
                  physics: const ClampingScrollPhysics(),
                  controller: pageController,
                  onPageChanged: (value) {
                    setState(() {
                      currentPage = value;
                    });
                  },
                  itemCount: onboardingList.length,
                  itemBuilder: (_, i) {
                    return OnboardingBody(
                      image: onboardingList[i].image,
                      title: onboardingList[i].title,
                      position: i,
                    );
                  },
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: queryData.size.height * 0.1, horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    onboardingList[currentPage].title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
                const SizedBox(height: 46),
                DotsWidget(
                  dotsCount: onboardingList.length,
                  position: currentPage,
                ),
                const SizedBox(height: 32),
                ColoredButtonWidget(
                    text: currentPage == 2 ? 'Get Started' : 'Next',
                    onPressed: () {
                      if (currentPage == 2) {
                        // Navigator.of(context).push(MaterialPageRoute(
                        //   builder: (context) => const LoginRegsisterPage(),
                        // ));
                      } else {
                        pageController.nextPage(
                            duration: const Duration(milliseconds: 400),
                            curve: Curves.decelerate);
                      }
                    },
                    grideantColors: const [Colors.white, Colors.white],
                    textColor: Colors.black),
                const SizedBox(height: 28),
                InkWell(
                  onTap: () {
                    // Navigator.of(context).push(MaterialPageRoute(
                    //     builder: (context) => const Navbar()));
                  },
                  child: Text(
                    currentPage == 2 ? 'Continue as an expert' : 'Skip',
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class OnboardingBody extends StatelessWidget {
  const OnboardingBody({
    super.key,
    required this.position,
    required this.image,
    required this.title,
  });

  final String image;
  final String title;
  final int position;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox.expand(
          child: Image.asset(
            image,
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }
}
