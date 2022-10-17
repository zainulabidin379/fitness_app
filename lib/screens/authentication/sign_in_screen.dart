import 'package:fitness_app/screens/authentication/forgot_password.dart';
import 'package:fitness_app/screens/authentication/sign_up_screen.dart';
import 'package:fitness_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/custom_button.dart';
import '../../widgets/custom_text_field.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

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
                'Sign In',
                style: kBodyText.copyWith(
                    fontSize: 22, fontWeight: FontWeight.w900),
              ),
              const SizedBox(
                height: 40,
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
              Padding(
                padding: const EdgeInsets.only(left: 185),
                child: TextButton(
                    onPressed: () => Get.to(() => const ForgotPasswordScreen()),
                    child: Text(
                      'Forgot Password?',
                      style: kBodyText.copyWith(fontWeight: FontWeight.bold),
                    )),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Don\'t have an account?',
                    style: kBodyText.copyWith(fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                      onPressed: () => Get.to(() => const SignUpScreen()),
                      child: Text(
                        'Sign Up',
                        style: kBodyText.copyWith(fontWeight: FontWeight.bold),
                      )),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              CustomButton(
                title: "Sign In",
                onTap: () => Get.to(() => const SignInScreen()),
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
