import 'package:fitness_app/constants/constants.dart';
import 'package:fitness_app/controllers/auth_controller.dart';
import 'package:fitness_app/screens/authentication/forgot_password.dart';
import 'package:fitness_app/screens/authentication/sign_up_screen.dart';
import 'package:fitness_app/widgets/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:the_validator/the_validator.dart';

import '../../widgets/custom_button.dart';
import '../../widgets/custom_text_field.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kBlack,
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
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

                CustomTextField(
                  inputAction: TextInputAction.next,
                  inputType: TextInputType.emailAddress,
                  controller: emailController,
                  nHintText: 'Email*',
                  validator: FieldValidator.email(),
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  inputAction: TextInputAction.done,
                  inputType: TextInputType.visiblePassword,
                  controller: passwordController,
                  nHintText: 'Password*',
                  validator: FieldValidator.password(
                      minLength: 8,
                      errorMessage:
                          "Password must contain at least 8 characters"),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 185),
                  child: TextButton(
                      onPressed: () =>
                          Get.to(() => const ForgotPasswordScreen()),
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
                          style:
                              kBodyText.copyWith(fontWeight: FontWeight.bold),
                        )),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomButton(
                  title: "Sign In",
                  onTap: () async {
                    if (_formKey.currentState!.validate()) {
                      Get.dialog(
                        SpinKitSpinningLines(color: kRed),
                        barrierDismissible: false,
                      );
                      dynamic result = await AuthController.authInstance
                          .login(emailController.text, passwordController.text);

                      if (result != null) {
                        Get.back();
                        Get.rawSnackbar(
                          messageText: Text(
                            result,
                            style: kBodyText.copyWith(color: kBlack),
                          ),
                          backgroundColor: kLightGrey,
                          snackPosition: SnackPosition.TOP,
                          borderRadius: 10,
                          margin: const EdgeInsets.all(10),
                        );
                      } else {
                        Get.offAll(() => WrapperScreen());
                      }
                    }
                  },
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
      ),
    );
  }
}
