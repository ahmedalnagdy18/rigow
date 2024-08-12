final onboardingList = [
  Onboarding(
    image: "assets/images/onboarding1.png",
    title:
        "Share posts, join rooms to ask for experts' advice, and enjoy communicating with others",
  ),
  Onboarding(
    image: "assets/images/onboarding2.png",
    title:
        "Boost your wellness and fitness through expert reels, stories, and blogs",
  ),
  Onboarding(
    image: "assets/images/onboarding3.png",
    title: "Learn something new and share your knowledge ",
  ),
];

class Onboarding {
  final String image;

  final String title;

  Onboarding({required this.image, required this.title});
}
