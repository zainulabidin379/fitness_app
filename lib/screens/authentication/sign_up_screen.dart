import 'package:fitness_app/screens/authentication/sign_in_screen.dart';
import 'package:fitness_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/custom_button.dart';
import '../../widgets/custom_text_field.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kBlack,
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 40,
              ),
              Center(
                child: SizedBox(
                  height: 55,
                  child: Image.asset("assets/images/logo.png"),
                ),
              ),
              const SizedBox(
                height: 60,
              ),
              Text(
                'Sign Up',
                style: kBodyText.copyWith(
                    fontSize: 22, fontWeight: FontWeight.w900),
              ),
              const SizedBox(
                height: 40,
              ),
              const CustomTextField(
                nHintText: 'Full Name*',
              ),
              const SizedBox(
                height: 20,
              ),
              const CustomTextField(
                nHintText: 'Email*',
              ),
              const SizedBox(
                height: 20,
              ),
              const CustomTextField(
                nHintText: 'Password*',
              ),
              const SizedBox(
                height: 20,
              ),

              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already a member?',
                    style: kBodyText.copyWith(fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                      onPressed: () => Get.to(() => const SignInScreen()),
                      child: Text(
                        'Sign In',
                        style: kBodyText.copyWith(fontWeight: FontWeight.bold),
                      )),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              CustomButton(
                title: "Sign Up",
                onTap: () => Get.to(() => const SignUpScreen()),
              ),

              // Image.asset(
              //   "assets/images/img1.jpg",
              //   fit: BoxFit.cover,
              //   width: size.width,
              //   height: size.height * 0.55,
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
