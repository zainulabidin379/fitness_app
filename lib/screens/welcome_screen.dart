import 'package:fitness_app/screens/authentication/sign_in_screen.dart';
import 'package:fitness_app/screens/onboarding.dart';
import 'package:fitness_app/screens/subscription.dart';
import 'package:fitness_app/utils/constants.dart';
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
        body: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(
                "assets/images/img1.jpg",
                fit: BoxFit.cover,
                width: size.width,
                height: size.height * 0.55,
              ),
              const SizedBox(height: 30),
              CustomButton(
                  title: "Take A Tour",
                  onTap: () => Get.to(() => const OnboardingScreen())),
              CustomButton(
                title: "Subscriptions",
                onTap: () => Get.to(() => const SubscriptionScreen()),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Text(
                  "-------------or--------------",
                  style: kButtonText.copyWith(color: kGrey),
                ),
              ),
              CustomButton(
                  title: "Login",
                  onTap: () => Get.to(() => const SignInScreen())),
            ],
          ),
        ),
      ),
    );
  }
}
