import 'package:fitness_app/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_validator/the_validator.dart';

import '../../widgets/custom_button.dart';
import '../../widgets/custom_text_field.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: kBlack,
        appBar: AppBar(
          backgroundColor: kBlack,
          leading: Center(
            child: GestureDetector(
              onTap: () => Get.back(),
              child: Container(
                padding: const EdgeInsets.only(right: 4),
                margin: const EdgeInsets.only(left: 10),
                height: 32,
                width: 32,
                decoration: BoxDecoration(color: kDark, shape: BoxShape.circle),
                child: Center(
                  child: Icon(
                    Icons.arrow_back_ios_new,
                    color: kWhite,
                    size: 18,
                  ),
                ),
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
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
                'FORGOT PASSWORD?',
                style: kBodyText.copyWith(
                    fontSize: 22, fontWeight: FontWeight.w900),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: size.width - 50,
                child: Text(
                  textAlign: TextAlign.center,
                  'NO PROBLEM, JUST PROVIDE US YOUR EMAIL AND WE WILL SEND YOU A LINK TO RESET YOUR PASSWORD',
                  style: kBodyText.copyWith(fontSize: 11, color: kGrey),
                ),
              ),
              const SizedBox(
                height: 40,
              ),

              CustomTextField(
                inputAction: TextInputAction.done,
                inputType: TextInputType.emailAddress,
                controller: emailController,
                nHintText: 'Email*',
                validator: FieldValidator.email(),
              ),

              const SizedBox(
                height: 30,
              ),
              CustomButton(
                title: "Send",
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
