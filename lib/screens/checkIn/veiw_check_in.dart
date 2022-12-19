import 'package:fitness_app/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ViewCheckIn extends StatefulWidget {
  final String title;
  final List answers;
  const ViewCheckIn({super.key, required this.title, required this.answers});

  @override
  State<ViewCheckIn> createState() => _ViewCheckInState();
}

class _ViewCheckInState extends State<ViewCheckIn> {
  final List<String> questions = [
    "Completed on?",
    "Weeks into check-ins?",
    "Weight at last check-in?",
    "Current weight?",
    "Achieved cardio for the whole week? Explain why if something you set out to do wasn't achieved.",
    "Achieved workouts for the whole week? Explain why if something you set out to do wasn't achieved.",
    "Achieved stretches for the whole week? Explain why if something you set out to do wasn't achieved.",
    "How have your energy levels been inside and outside of the gym?",
    "How is your strength and performance throughout your workouts and cardio sessions?",
    "Did you hit your water intake for each day? Explain why if not.",
    "Did you hit your sleep target for each day? Explain why if not.",
    "Did you hit your step target for each day? Explain why if not.",
    "Did you stick to your diet plan this week? Explain why if not.",
    "How do you feel mentally and physically after all exercise?",
    "How has your mood and stress levels been overall?",
    "Do you ever feel hungry, if so when and what did you do?",
    "How many cheat meals did you have? Did you deserve or want them?",
    "How would you rate the quality of your sleep?",
    "How has your menstrual cycle been?",
    "Any other information regards to how your week has been and anything you feel you need to mention?",
    "Have you taken new photos?",
    "Have you taken new videos?",
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: kBlack,
      appBar: AppBar(
        backgroundColor: kBlack,
        title: SizedBox(
          height: 55,
          child: Image.asset("assets/images/logo.png"),
        ),
        centerTitle: true,
        leading: Center(
          child: GestureDetector(
            onTap: () => Get.back(),
            child: Container(
              padding: const EdgeInsets.only(right: 4),
              margin: const EdgeInsets.only(left: 10),
              height: 32,
              width: 32,
              decoration: BoxDecoration(color: kDark, shape: BoxShape.circle),
              child: Center(
                child: Icon(
                  Icons.arrow_back_ios_new,
                  color: kWhite,
                  size: 18,
                ),
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            Center(
              child: Text(
                widget.title,
                style: kBodyText.copyWith(
                    fontWeight: FontWeight.bold, fontSize: 24),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            ...List.generate(
                22,
                (index) => questionWidget(
                    index + 1, questions[index], widget.answers[index])),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    ));
  }

  Widget questionWidget(
    int number,
    String question,
    String answer,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          child: Text(
            "$number.  $question",
            style:
                kBodyText.copyWith(fontWeight: FontWeight.bold, fontSize: 18),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            "Ans: $answer",
            style: kBodyText,
          ),
        ),
        const SizedBox(
          height: 15,
        )
      ],
    );
  }
}
