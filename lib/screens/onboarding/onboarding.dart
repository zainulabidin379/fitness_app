import 'package:fitness_app/constants/constants.dart';
import 'package:flutter/material.dart';

import '../../widgets/onboarding_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  PageController pageController = PageController(
    initialPage: 0,
  );
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kBlack,
        body: PageView(
          controller: pageController,
          children: const [
            OnboardingPageWidget(
                image: "img2",
                title: "PERSONAL APP FOR YOUR BODY AND MIND",
                description:
                    "Personal and instant access to all our exercises, workouts, and nutritional tips.",
                pageNo: 1),
            OnboardingPageWidget(
                image: "img3",
                title: "VARIETY OF EXERCISES, MOVEMENTS AND WORKOUTS",
                description:
                    "Access to all videos from Calisthenics, Gym Machinery, Bodyweight, Weights, Yoga, Barbell, Stretches, Resistant Bands and much more.",
                pageNo: 2),
            OnboardingPageWidget(
                image: "img4",
                title: "LIVE TRAINING WITH DINA",
                description:
                    "Option to join in live with Dina wherever you are via the app. All moves and exercise are pre filmed inside the app.",
                pageNo: 3),
            OnboardingPageWidget(
                image: "img5",
                title: "PERSONALISED NUTRITION PLANS",
                description:
                    "Personal and instant access to all nutritional liquids, foods, vitamins, and minerals. Personalised macros and shopping list.",
                pageNo: 4),
            OnboardingPageWidget(
                image: "img6",
                title: "SUITABLE FOR CHILDREN",
                description:
                    "All unweighted movements can be copied and performed by children in the comfort of their own home.",
                pageNo: 5)
          ],
        ),
      ),
    );
  }
}
