import 'package:fitness_app/constants/constants.dart';
import 'package:fitness_app/screens/authentication/sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_validator/the_validator.dart';

import '../../widgets/custom_button.dart';
import '../../widgets/custom_text_field.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
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
                  'Sign Up',
                  style: kBodyText.copyWith(
                      fontSize: 22, fontWeight: FontWeight.w900),
                ),
                const SizedBox(
                  height: 40,
                ),
                CustomTextField(
                  inputAction: TextInputAction.next,
                  inputType: TextInputType.text,
                  controller: nameController,
                  nHintText: 'Full Name*',
                  validator: FieldValidator.required(),
                ),
                const SizedBox(
                  height: 20,
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
                          style:
                              kBodyText.copyWith(fontWeight: FontWeight.bold),
                        )),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomButton(
                  title: "Sign Up",
                  onTap: () async {
                    // if (_formKey.currentState!.validate()) {
                    //   Get.dialog(
                    //     SpinKitSpinningLines(color: kRed),
                    //     barrierDismissible: false,
                    //   );
                    //   dynamic result = await AuthController.authInstance
                    //       .register(
                    //           emailController.text, passwordController.text);

                    //   if (result != null) {
                    //     Get.back();
                    //     Get.rawSnackbar(
                    //       messageText: Text(
                    //         result,
                    //         style: kBodyText.copyWith(color: kBlack),
                    //       ),
                    //       backgroundColor: kLightGrey,
                    //       snackPosition: SnackPosition.TOP,
                    //       borderRadius: 10,
                    //       margin: const EdgeInsets.all(10),
                    //     );
                    //   } else {
                    //    await FirebaseFirestore.instance
                    //         .collection("users")
                    //         .doc(AuthController.authInstance.getCurrentUser())
                    //         .set({
                    //       "uid": AuthController.authInstance.getCurrentUser(),
                    //       "name": nameController.text,
                    //       "email": emailController.text,
                    //       "subscription": null,
                    //       "questionsAnswered": false,
                    //       "image":
                    //           "https://firebasestorage.googleapis.com/v0/b/survival-ecf70.appspot.com/o/profileImages%2Favatar.png?alt=media&token=feaabc68-4acc-41e7-9cc5-eb19dc155f36",
                    //       "timestamp": DateTime.now(),
                    //     }).then((value) {
                    //       Get.offAll(() => const SubscriptionScreen());
                    //     });
                    //   }
                    // }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
