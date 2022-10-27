import 'package:fitness_app/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:the_validator/the_validator.dart';

import '../../widgets/custom_button.dart';
import '../../widgets/custom_text_field.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
final   TextEditingController emailController = TextEditingController();

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
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 40,
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
                  'NO PROBLEM, JUST PROVIDE US IMPORTANT INFORMATION FOR RECOVERY',
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
