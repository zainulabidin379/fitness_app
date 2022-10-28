import 'package:fitness_app/screens/questions/question14.dart';
import 'package:fitness_app/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Question13Screen extends StatefulWidget {
  const Question13Screen({super.key});

  @override
  State<Question13Screen> createState() => _Question13ScreenState();
}

class _Question13ScreenState extends State<Question13Screen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: kBlack,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 50),
                  child: SizedBox(
                    height: 55,
                    child: Image.asset("assets/images/logo.png"),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Disclaimer",
                  textAlign: TextAlign.center,
                  style: kBodyText.copyWith(
                      fontWeight: FontWeight.bold, fontSize: 24),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 25),
                height: size.height * 0.45,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Text(
                        "This is a dummy text." * 200,
                        textAlign: TextAlign.center,
                        style: kBodyText.copyWith(fontSize: 10),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              SizedBox(
                height: size.height * 0.15,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () => Get.to(() => const Question14Screen()),
                  child: Container(
                    margin: const EdgeInsets.only(right: 30),
                    height: 50,
                    width: 120,
                    decoration: BoxDecoration(
                        color: kWhite, borderRadius: BorderRadius.circular(48)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Next",
                          style: kButtonText,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Icon(
                          Icons.navigate_next,
                          color: kBlack,
                          size: 25,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.only(
                    right: 55,
                    bottom: 30,
                  ),
                  child: TextButton(
                      onPressed: () {},
                      child: Text(
                        'Cancel',
                        style: kBodyText.copyWith(
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline),
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
