import 'package:fitness_app/controllers/questions_controller.dart';
import 'package:fitness_app/screens/questions/question8.dart';
import 'package:fitness_app/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Question7Screen extends StatefulWidget {
  const Question7Screen({super.key});

  @override
  State<Question7Screen> createState() => _Question7ScreenState();
}

class _Question7ScreenState extends State<Question7Screen> {
  final List<SimpleModel> _items = <SimpleModel>[
    SimpleModel('Home', false),
    SimpleModel('Park', false),
    SimpleModel('Gym', false),
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Where do you currently train?",
                  textAlign: TextAlign.center,
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
                              QuestionsController.instance.question7.value =
                                  _items[index].title;
                            },
                            visualDensity: const VisualDensity(
                                horizontal: 0, vertical: -2),
                            leading: (QuestionsController.instance.question7.value ==
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
                    if (QuestionsController.instance.question7.value != "") {
                      Get.to(() => const Question8Screen());
                    } else {
                      Get.rawSnackbar(
                        messageText: Text(
                          "Please choose where you currently train",
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
  bool isChecked;

  SimpleModel(this.title, this.isChecked);
}
