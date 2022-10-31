import 'package:fitness_app/constants/constants.dart';
import 'package:fitness_app/controllers/questions_controller.dart';
import 'package:fitness_app/screens/questions/question2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';

class Question1Screen extends StatefulWidget {
  const Question1Screen({super.key});

  @override
  State<Question1Screen> createState() => _Question1ScreenState();
}

class _Question1ScreenState extends State<Question1Screen> {
  @override
  void initState() {
    FlutterNativeSplash.remove();

    super.initState();
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
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 50),
                  child: SizedBox(
                    height: 55,
                    child: Image.asset("assets/images/logo.png"),
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              Text(
                "Tell us about yourself!",
                style: kBodyText.copyWith(
                    fontWeight: FontWeight.bold, fontSize: 24),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "To give you a better experience we need\nto know your gender",
                textAlign: TextAlign.center,
                style: kBodyText.copyWith(fontSize: 10),
              ),
              SizedBox(
                height: size.height * 0.05,
              ),
              Obx(() {
                return GestureDetector(
                  onTap: () {
                    QuestionsController.instance.question1.value = "male";
                  },
                  child: Container(
                    height: size.width * 0.33,
                    width: size.width * 0.33,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: (QuestionsController.instance.question1.value == "male")
                          ? kWhite
                          : kLightGrey,
                    ),
                    child: Center(
                      child: Text(
                        "Male",
                        style: kBodyText.copyWith(
                            color:
                                (QuestionsController.instance.question1.value == "male")
                                    ? kBlack
                                    : kWhite,
                            fontWeight: FontWeight.bold,
                            fontSize: 24),
                      ),
                    ),
                  ),
                );
              }),
              SizedBox(
                height: size.height * 0.03,
              ),
              Obx(() {
                return GestureDetector(
                  onTap: () {
                    QuestionsController.instance.question1.value = "female";
                  },
                  child: Container(
                    height: size.width * 0.33,
                    width: size.width * 0.33,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: (QuestionsController.instance.question1.value == "female")
                          ? kWhite
                          : kLightGrey,
                    ),
                    child: Center(
                      child: Text(
                        "Female",
                        style: kBodyText.copyWith(
                            color: (QuestionsController.instance.question1.value ==
                                    "female")
                                ? kBlack
                                : kWhite,
                            fontWeight: FontWeight.bold,
                            fontSize: 24),
                      ),
                    ),
                  ),
                );
              }),
              SizedBox(
                height: size.height * 0.15,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () {
                    if (QuestionsController.instance.question1.value != "") {
                      Get.to(() => const Question2Screen());
                    } else {
                      Get.rawSnackbar(
                        messageText: Text(
                          "Please choose your gender",
                          style: kBodyText.copyWith(color: kBlack),
                        ),
                        backgroundColor: kWhite,
                        snackPosition: SnackPosition.TOP,
                        borderRadius: 10,
                        margin: const EdgeInsets.all(10),
                      );
                    }
                  },
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 30, right: 30),
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
