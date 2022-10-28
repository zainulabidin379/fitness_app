import 'package:fitness_app/controllers/questions_controller.dart';
import 'package:fitness_app/screens/questions/question11.dart';
import 'package:fitness_app/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Question10Screen extends StatefulWidget {
  const Question10Screen({super.key});

  @override
  State<Question10Screen> createState() => _Question10ScreenState();
}

class _Question10ScreenState extends State<Question10Screen> {
  final QuestionsController questionsController =
      Get.put(QuestionsController());
  late FixedExtentScrollController _controller;

  @override
  void initState() {
    super.initState();

    _controller = FixedExtentScrollController();
  }

  final List<String> _items = [
    "I am expecting a baby",
    "I have recently had a baby",
    "I am breast feeding",
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
                  "Any special requirements?",
                  textAlign: TextAlign.center,
                  style: kBodyText.copyWith(
                      fontWeight: FontWeight.bold, fontSize: 24),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "This helps us create your personalized plan",
                textAlign: TextAlign.center,
                style: kBodyText.copyWith(fontSize: 10),
              ),
              SizedBox(
                height: size.height * 0.05,
              ),
              Obx(() => Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    height: 150,
                    child: Scrollbar(
                      controller: _controller,
                      thumbVisibility: true,
                      trackVisibility: true,
                      child: ListWheelScrollView(
                        controller: _controller,
                        itemExtent: 50,
                        perspective: 0.001,
                        diameterRatio: 1.5,
                        onSelectedItemChanged: (value) {
                          questionsController.question10.value = _items[value];
                        },
                        physics: const FixedExtentScrollPhysics(),
                        children: List.generate(
                          _items.length,
                          (index) => Text(
                            _items[index],
                            textAlign: TextAlign.center,
                            style: (questionsController.question10.value ==
                                    _items[index])
                                ? kBodyText.copyWith(
                                    fontWeight: FontWeight.bold, fontSize: 20)
                                : kBodyText.copyWith(
                                    color: kLightGrey,
                                    fontSize: 20),
                          ),
                        ),
                      ),
                    ),
                  )),
              SizedBox(
                height: size.height * 0.15,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () => Get.to(() => const Question11Screen()),
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
