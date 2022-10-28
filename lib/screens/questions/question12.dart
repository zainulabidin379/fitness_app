import 'package:fitness_app/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vertical_weight_slider/vertical_weight_slider.dart';

import '../../controllers/questions_controller.dart';
import 'question13.dart';

class Question12Screen extends StatefulWidget {
  const Question12Screen({super.key});

  @override
  State<Question12Screen> createState() => _Question12ScreenState();
}

class _Question12ScreenState extends State<Question12Screen> {
  final QuestionsController questionsController =
      Get.put(QuestionsController());
  late WeightSliderController _controller;
  var weight = 3.0.obs;
  @override
  void initState() {
    super.initState();
    _controller = WeightSliderController(
        initialWeight: questionsController.question12.value,
        minWeight: 1,
        interval: 0.5);
  }

  @override
  void dispose() {
    _controller.dispose();
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
                  "How many meals per day?",
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
                height: 40,
              ),
              Obx(
                () => RichText(
                  text: TextSpan(
                    text:
                        questionsController.question12.value.toStringAsFixed(0),
                    style: GoogleFonts.montserrat(
                        fontSize: 45,
                        fontWeight: FontWeight.bold,
                        color: kWhite),
                  ),
                ),
              ),
              VerticalWeightSlider(
                controller: _controller,
                isVertical: false,
                height: 150,
                maxWeight: 8,
                decoration: const PointerDecoration(
                  width: 130.0,
                  height: 3.0,
                  largeColor: Color(0xFF898989),
                  mediumColor: Color(0xFF898989),
                  smallColor: Color(0xFF898989),
                  gap: 30.0,
                ),
                onChanged: (double value) {
                  questionsController.question12.value = value;
                },
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Text(
                  "I'm not sure and would love your guidance",
                  textAlign: TextAlign.center,
                  style: kBodyText.copyWith(
                      fontWeight: FontWeight.bold, fontSize: 13),
                ),
              ),
              SizedBox(
                height: size.height * 0.15,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () => Get.to(() => const Question13Screen()),
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
