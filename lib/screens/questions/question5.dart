import 'package:fitness_app/constants/constants.dart';
import 'package:fitness_app/controllers/questions_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'question6.dart';

class Question5Screen extends StatefulWidget {
  const Question5Screen({super.key});

  @override
  State<Question5Screen> createState() => _Question5ScreenState();
}

class _Question5ScreenState extends State<Question5Screen> {
  final List<SimpleModel> _items = <SimpleModel>[
    SimpleModel(
      'Very Active',
    ),
    SimpleModel(
      'Fairly Active',
    ),
    SimpleModel(
      'A little Active',
    ),
    SimpleModel(
      'Inactive',
    ),
    SimpleModel(
      'Very Inactive',
    ),
  ];
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
                "Activity Level",
                style: kBodyText.copyWith(
                    fontWeight: FontWeight.bold, fontSize: 24),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                textAlign: TextAlign.center,
                'This helps us create your personalized plan',
                style: kBodyText.copyWith(fontSize: 10),
              ),
              SizedBox(
                height: size.height * 0.05,
              ),
              ...List.generate(
                  _items.length,
                  (index) => Obx(() {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: ListTile(
                            onTap: () {
                              QuestionsController.instance.question5.value =
                                  _items[index].title;
                            },
                            visualDensity: const VisualDensity(
                                horizontal: 0, vertical: -2),
                            leading: (QuestionsController.instance.question5.value ==
                                    _items[index].title)
                                ? Container(
                                    decoration: BoxDecoration(
                                      color: kRed,
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    constraints: const BoxConstraints(
                                        maxHeight: 18, maxWidth: 18),
                                  )
                                : Container(
                                    decoration: BoxDecoration(
                                      color: kWhite,
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    constraints: const BoxConstraints(
                                        maxHeight: 18, maxWidth: 18)),
                            title: Text(
                              _items[index].title,
                              style: kBodyText.copyWith(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                        );
                      })),
              SizedBox(
                height: size.height * 0.15,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () {
                    if (QuestionsController.instance.question5.value != "") {
                      Get.to(() => const Question6Screen());
                    } else {
                      Get.rawSnackbar(
                        messageText: Text(
                          "Please choose your activity level",
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

class SimpleModel {
  String title;

  SimpleModel(this.title);
}
