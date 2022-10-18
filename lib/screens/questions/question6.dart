import 'package:fitness_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'question7.dart';

class Question6Screen extends StatefulWidget {
  const Question6Screen({super.key});

  @override
  State<Question6Screen> createState() => _Question6ScreenState();
}

class _Question6ScreenState extends State<Question6Screen> {
  final List<SimpleModel> _items = <SimpleModel>[
    SimpleModel('Fat Loss', false),
    SimpleModel('Fitter', false),
    SimpleModel('Maintain', false),
    SimpleModel('New Skills', false),
    SimpleModel('Nutrition Help', false),
    SimpleModel('Stronger', false),
  ];
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
            const SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5),
              child: SizedBox(
                // color: Colors.yellow,
                height: 330,
                child: ListView(
                  padding: const EdgeInsets.all(8),
                  children: _items
                      .map(
                        (SimpleModel item) => ListTile(
                          // dense: true,
                          // // contentPadding: const EdgeInsets.only(
                          // //     left: 0.0, right: 0.0, top: 0),
                          visualDensity:
                              const VisualDensity(horizontal: 0, vertical: -2),
                          leading: item.isChecked
                              ? GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      item.isChecked = false;
                                    });
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    constraints: const BoxConstraints(
                                        maxHeight: 18, maxWidth: 18),
                                  ),
                                )
                              : GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      item.isChecked = true;
                                    });
                                  },
                                  child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      constraints: const BoxConstraints(
                                          maxHeight: 18, maxWidth: 18)),
                                ),
                          title: Text(
                            item.title,
                            style: kBodyText.copyWith(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
            ),
            const Spacer(),
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
    );
  }
}

class SimpleModel {
  String title;
  bool isChecked;

  SimpleModel(this.title, this.isChecked);
}
