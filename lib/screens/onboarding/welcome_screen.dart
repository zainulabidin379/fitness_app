import 'package:fitness_app/constants/controllers.dart';
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
              child: Image.asset(
                "assets/images/img1.jpg",
                fit: BoxFit.cover,
                width: size.width,
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
                    if (authController.isLoggedIn.value) {
                      Get.to(() => const SubscriptionScreen());
                    } else {
                      Get.to(() => const SignInScreen());
                      Get.rawSnackbar(
                        messageText: Text(
                          "Please Login to view subscriptions!",
                          style: kBodyText.copyWith(color: kBlack),
                        ),
                        backgroundColor: kWhite,
                        snackPosition: SnackPosition.TOP,
                        borderRadius: 10,
                        margin: const EdgeInsets.all(10),
                      );
                    }
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
