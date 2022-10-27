import 'package:fitness_app/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vertical_weight_slider/vertical_weight_slider.dart';

import 'question5.dart';

class Question4Screen extends StatefulWidget {
  const Question4Screen({super.key});

  @override
  State<Question4Screen> createState() => _Question4ScreenState();
}

class _Question4ScreenState extends State<Question4Screen> {
  late WeightSliderController _controller;
  var weight = 175.0.obs;
  var weightInFeet = 0.0.obs;
  var weightInInches = 0.0.obs;

  void calculateHeight() {
    weightInFeet.value = weight.value / 30.48;
    double decimalValue = weightInFeet.value - weightInFeet.value.toInt();
    weightInInches.value = decimalValue * 12;
    print(weightInFeet);
    print(weightInInches);
  }

  @override
  void initState() {
    super.initState();
    calculateHeight();
    _controller = WeightSliderController(
        initialWeight: weight.value, minWeight: 1, interval: 1);
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
            Text(
              "Your Height",
              style:
                  kBodyText.copyWith(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Your height can be changed later",
              textAlign: TextAlign.center,
              style: kBodyText.copyWith(fontSize: 10),
            ),
            const SizedBox(
              height: 40,
            ),
            Obx(
              () => RichText(
                text: TextSpan(
                  text: weight.value.toStringAsFixed(0),
                  style: GoogleFonts.montserrat(
                      fontSize: 45, fontWeight: FontWeight.bold, color: kWhite),
                  children: <TextSpan>[
                    TextSpan(
                      text: ' cm',
                      style:
                          GoogleFonts.montserrat(fontSize: 17, color: kWhite),
                    ),
                  ],
                ),
              ),
            ),
            VerticalWeightSlider(
              controller: _controller,
              isVertical: false,
              height: 150,
              decoration: const PointerDecoration(
                width: 130.0,
                height: 3.0,
                largeColor: Color(0xFF898989),
                mediumColor: Color(0xFF898989),
                smallColor: Color(0xFF898989),
                gap: 30.0,
              ),
              onChanged: (double value) {
                weight.value = value;
                calculateHeight();
              },
            ),
            Obx(
              () => RichText(
                text: TextSpan(
                  text: weightInFeet.value.floor().toString(),
                  style: GoogleFonts.montserrat(
                      fontSize: 45, fontWeight: FontWeight.bold, color: kWhite),
                  children: <TextSpan>[
                    TextSpan(
                      text: ' ft ',
                      style:
                          GoogleFonts.montserrat(fontSize: 17, color: kWhite),
                    ),
                    TextSpan(
                      text: weightInInches.value.toStringAsFixed(0),
                      style: GoogleFonts.montserrat(
                          fontSize: 45,
                          fontWeight: FontWeight.bold,
                          color: kWhite),
                    ),
                    TextSpan(
                      text: ' in',
                      style:
                          GoogleFonts.montserrat(fontSize: 17, color: kWhite),
                    ),
                  ],
                ),
              ),
            ),
            const Spacer(),
            Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: () => Get.to(() => const Question5Screen()),
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
