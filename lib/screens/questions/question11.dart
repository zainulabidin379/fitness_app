import 'package:fitness_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'question12.dart';

class Question11Screen extends StatefulWidget {
  const Question11Screen({super.key});

  @override
  State<Question11Screen> createState() => _Question11ScreenState();
}

class _Question11ScreenState extends State<Question11Screen> {
  late FixedExtentScrollController _controller;

  var selected = 0.obs;

  @override
  void initState() {
    super.initState();

    _controller = FixedExtentScrollController();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: kBlack,
        body: Column(
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
                "Any preferred meal plans?",
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
            const SizedBox(
              height: 50,
            ),
            Obx(() => Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
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
                        selected.value = value;
                      },
                      physics: const FixedExtentScrollPhysics(),
                      children: [
                        Text(
                          "Vegan",
                          textAlign: TextAlign.center,
                          style: (selected.value == 0)
                              ? kBodyText.copyWith(
                                  fontWeight: FontWeight.bold, fontSize: 20)
                              : kBodyText.copyWith(
                                  color: kWhite.withOpacity(0.5), fontSize: 20),
                        ),
                        Text(
                          "Vegetarian",
                          textAlign: TextAlign.center,
                          style: (selected.value == 1)
                              ? kBodyText.copyWith(
                                  fontWeight: FontWeight.bold, fontSize: 20)
                              : kBodyText.copyWith(
                                  color: kWhite.withOpacity(0.5), fontSize: 20),
                        ),
                        Text(
                          "Pescatarian",
                          textAlign: TextAlign.center,
                          style: (selected.value == 2)
                              ? kBodyText.copyWith(
                                  fontWeight: FontWeight.bold, fontSize: 20)
                              : kBodyText.copyWith(
                                  color: kWhite.withOpacity(0.5), fontSize: 20),
                        ),
                        Text(
                          "Standard",
                          textAlign: TextAlign.center,
                          style: (selected.value == 3)
                              ? kBodyText.copyWith(
                                  fontWeight: FontWeight.bold, fontSize: 20)
                              : kBodyText.copyWith(
                                  color: kWhite.withOpacity(0.5), fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                )),
            const Spacer(),
            Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: () => Get.to(() => const Question12Screen()),
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
    );
  }
}
