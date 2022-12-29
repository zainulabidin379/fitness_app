import 'package:fitness_app/screens/authentication/sign_in_screen.dart';
import 'package:fitness_app/screens/onboarding/onboarding.dart';
import 'package:fitness_app/screens/payment/subscription.dart';
import 'package:fitness_app/constants/constants.dart';
import 'package:fitness_app/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: kBlack,
        body: Column(
          children: [
            Flexible(
              child: Container(
                color: kWhite,
                child: Image.asset(
                  "assets/images/img1.png",
                  fit: BoxFit.fitHeight,
                  width: size.width,
                  height: size.height * 0.55,
                ),
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 15),
                CustomButton(
                    title: "Take A Tour",
                    color: kGrey,
                    onTap: () => Get.to(() => const OnboardingScreen())),
                CustomButton(
                  title: "Subscriptions",
                  color: kGrey,
                  onTap: () {
                    Get.to(() => const SubscriptionScreen());
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Text(
                    "------------- or --------------",
                    style: kButtonText.copyWith(color: kGrey),
                  ),
                ),
                CustomButton(
                    title: "Login",
                    onTap: () => Get.to(() => const SignInScreen())),
                const SizedBox(height: 15),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
