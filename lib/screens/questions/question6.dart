import 'package:fitness_app/constants/constants.dart';
import 'package:fitness_app/controllers/questions_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'question7.dart';

class Question6Screen extends StatefulWidget {
  const Question6Screen({super.key});

  @override
  State<Question6Screen> createState() => _Question6ScreenState();
}

class _Question6ScreenState extends State<Question6Screen> {
  final QuestionsController questionsController =
      Get.put(QuestionsController());
  final List<SimpleModel> _items = <SimpleModel>[
    SimpleModel(
      'Fat Loss',
    ),
    SimpleModel(
      'Fitter',
    ),
    SimpleModel(
      'Maintain',
    ),
    SimpleModel(
      'New Skills',
    ),
    SimpleModel(
      'Nutrition Help',
    ),
    SimpleModel(
      'Stronger',
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
              Center(
                child: Text(
                  "Your goal?",
                  style: kBodyText.copyWith(
                      fontWeight: FontWeight.bold, fontSize: 24),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Center(
                child: Text(
                  textAlign: TextAlign.center,
                  'This helps us create your personalized plan',
                  style: kBodyText.copyWith(fontSize: 10),
                ),
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
                              questionsController.question6.value =
                                  _items[index].title;
                            },
                            visualDensity:
                                const VisualDensity(horizontal: 0, vertical: -2),
                            leading: (questionsController.question6.value ==
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
                  onTap: () => Get.to(() => const Question7Screen()),
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

  SimpleModel(
    this.title,
  );
}
