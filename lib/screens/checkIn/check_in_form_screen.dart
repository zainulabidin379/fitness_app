import 'package:fitness_app/screens/checkIn/check_in_confirmation_screen.dart';
import 'package:fitness_app/utils/constants.dart';
import 'package:fitness_app/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckInFormScreen extends StatefulWidget {
  const CheckInFormScreen({super.key});

  @override
  State<CheckInFormScreen> createState() => _CheckInFormScreenState();
}

class _CheckInFormScreenState extends State<CheckInFormScreen> {
  final List<SimpleModel> _items = <SimpleModel>[
    SimpleModel('1.   Completed on?', '30.06.1992'),
    SimpleModel('2.   Weeks into check-ins?', '4'),
    SimpleModel('3.   Weight at last check-in?', '63kg'),
    SimpleModel('4.   Current weight?', '59kg'),
    SimpleModel(
        '5.   Achieved cardio for the whole week?Explain why if something you set out to do wasn\'t achieved. ',
        'All targets achieved, refer to training diary.'),
    SimpleModel(
        '6.   Explain why if something you set out to do wasn\'t achieved.Explain why if something you set out to do wasn\'t achieved.',
        '2 workouts were missed, mixture of tired and laziness, refer to training diary to see which days were missed.'),
    SimpleModel(
        '7.   Achieved stretches for the whole week? Explain why if something you set out to do wasn\'t achieved.',
        'All stretches achieved and logged into fitness diary.'),
    SimpleModel(
        '8.   How is your strength and performance throughout your workouts and cardio sessions?',
        'So good, happy with my scores and results.'),
    SimpleModel(
        '9.   How have your energy levels been inside and outside of the gym?',
        'My energy has been good even when | missed the two days, | was still fine just tired from working hard.'),
    SimpleModel(
        '10.   Did yo hit your water intake for each day? Explain why if not.',
        'Yes,every day.'),
    SimpleModel(
        '11.   Did you hit your sleep target for each day? Explain why if not.',
        'No, refer to sleep diary. Up late working and not prioritizing good enough.'),
    SimpleModel(
        '12.   Did you hit your step target for each day? Explain why if not.',
        'Yes, every day.'),
    SimpleModel(
        '13.   Did you stick to your diet plan this week? Explain why if not.',
        'No, the two days | didn\'t train | also didn\'t eat much. | didn\'t feel hungry, and | know my body didn\'t need as much food as usual as | hadn\'t worked out as much, however | will try harder next week.'),
    SimpleModel(
        '14.   How do you feel mentally and physically after all exercise?',
        'Felt so good, energized, and positive.'),
    SimpleModel('15.   How has your mood and stress levels been overall?',
        'I\'ve felt fine and chilled all week, just tired due to lack of sleep.'),
    SimpleModel(
        '16.   Do you ever feel hungry, if so when and what did you do?',
        'No, even when | did skip one meal on my none training day, | didn\'t feel hungry.'),
    SimpleModel(
        '17.   How many cheat meals did you have? Did you deserve or want them?',
        '| had 6 cheat meals. 2 per day over 3 days. My set cheat day and the two days | missed training. | deserved 2 out of 6.'),
    SimpleModel('18.   How would you rate the quality of your sleep?',
        'Good quality but not enough.'),
    SimpleModel('19.   How has your menstrual cycle been?',
        'Due on next week, don’t feel anything yet.'),
    SimpleModel(
        '20.   Any other information regards to how your week has been and anything you feel you need to mention?',
        'No, had a good week.'),
    SimpleModel('21.   Have you taken new photos?',
        'yes, added 3 new progress pictures, refer to picture diary.'),
    SimpleModel('22.   Videos?', 'No, haven\'t taken any. | will this week.'),
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      backgroundColor: kBlack,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 50,
            ),
            Center(
              child: SizedBox(
                height: 55,
                child: Image.asset("assets/images/logo.png"),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Center(
              child: Text(
                "Check In Form",
                style: kBodyText.copyWith(
                    fontWeight: FontWeight.bold, fontSize: 24),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              height: 400,
              child: Scrollbar(
                thumbVisibility: true,
                trackVisibility: true,
                child: ListView(
                  children: _items
                      .map(
                        (SimpleModel item) => Padding(
                          padding: const EdgeInsets.only(left: 22.0, right: 22),
                          child: Container(
                            // color: Colors.yellow,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item.title,
                                  style: kBodyText.copyWith(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      //ckgroundColor: Colors.white,
                                      color: kWhite,
                                      borderRadius: BorderRadius.circular(15)),

                                  //margin: const EdgeInsets.symmetric(vertical: 10),
                                  height: 40,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 8),
                                    child: TextField(
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: item.hintText,
                                      ),
                                      cursorColor: kBlack,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
            ),
            CustomButton(
              title: 'Check In',
              onTap: () => Get.to(() => const CheckInConfirmation()),
            ),
          ],
        ),
      ),
    ));
  }
}

class SimpleModel {
  String title;
  String hintText;

  SimpleModel(this.title, this.hintText);
}
