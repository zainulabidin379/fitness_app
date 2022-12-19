import 'package:fitness_app/constants/controllers.dart';
import 'package:fitness_app/constants/firebase_constants.dart';
import 'package:fitness_app/screens/checkIn/check_in_confirmation_screen.dart';
import 'package:fitness_app/constants/constants.dart';
import 'package:fitness_app/widgets/custom_button.dart';
import 'package:fitness_app/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:the_validator/the_validator.dart';
import 'package:uuid/uuid.dart';

class CheckInFormScreen extends StatefulWidget {
  const CheckInFormScreen({super.key});

  @override
  State<CheckInFormScreen> createState() => _CheckInFormScreenState();
}

class _CheckInFormScreenState extends State<CheckInFormScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
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

  final TextEditingController question0 = TextEditingController();
  final TextEditingController question1 = TextEditingController();
  final TextEditingController question2 = TextEditingController();
  final TextEditingController question3 = TextEditingController();
  final TextEditingController question4 = TextEditingController();
  final TextEditingController question5 = TextEditingController();
  final TextEditingController question6 = TextEditingController();
  final TextEditingController question7 = TextEditingController();
  final TextEditingController question8 = TextEditingController();
  final TextEditingController question9 = TextEditingController();
  final TextEditingController question10 = TextEditingController();
  final TextEditingController question11 = TextEditingController();
  final TextEditingController question12 = TextEditingController();
  final TextEditingController question13 = TextEditingController();
  final TextEditingController question14 = TextEditingController();
  final TextEditingController question15 = TextEditingController();
  final TextEditingController question16 = TextEditingController();
  final TextEditingController question17 = TextEditingController();
  final TextEditingController question18 = TextEditingController();
  final TextEditingController question19 = TextEditingController();
  final TextEditingController question20 = TextEditingController();
  final TextEditingController question21 = TextEditingController();
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
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 20,
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
                      questionWidget(1, questions[0], question0),
                      questionWidget(2, questions[1], question1),
                      questionWidget(3, questions[2], question2),
                      questionWidget(4, questions[3], question3),
                      questionWidget(5, questions[4], question4),
                      questionWidget(6, questions[5], question5),
                      questionWidget(7, questions[6], question6),
                      questionWidget(8, questions[7], question7),
                      questionWidget(9, questions[8], question8),
                      questionWidget(10, questions[9], question9),
                      questionWidget(11, questions[10], question10),
                      questionWidget(12, questions[11], question11),
                      questionWidget(13, questions[12], question12),
                      questionWidget(14, questions[13], question13),
                      questionWidget(15, questions[14], question14),
                      questionWidget(16, questions[15], question15),
                      questionWidget(17, questions[16], question16),
                      questionWidget(18, questions[17], question17),
                      questionWidget(19, questions[18], question18),
                      questionWidget(20, questions[19], question19),
                      questionWidget(21, questions[20], question20),
                      questionWidget(22, questions[21], question21),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            CustomButton(
              title: 'Check In',
              onTap: () async {
                if (_formKey.currentState!.validate()) {
                  Get.dialog(
                    SpinKitSpinningLines(color: kRed),
                    barrierDismissible: false,
                  );
                  List answers = [];
                  answers.add(question0.text);
                  answers.add(question1.text);
                  answers.add(question2.text);
                  answers.add(question3.text);
                  answers.add(question4.text);
                  answers.add(question5.text);
                  answers.add(question6.text);
                  answers.add(question7.text);
                  answers.add(question8.text);
                  answers.add(question9.text);
                  answers.add(question10.text);
                  answers.add(question11.text);
                  answers.add(question12.text);
                  answers.add(question13.text);
                  answers.add(question14.text);
                  answers.add(question15.text);
                  answers.add(question16.text);
                  answers.add(question17.text);
                  answers.add(question18.text);
                  answers.add(question19.text);
                  answers.add(question20.text);
                  answers.add(question21.text);
                  String id = const Uuid().v4();
                  await firestore
                      .collection("checkIns")
                      .get()
                      .then((value) async {
                    await firestore.collection("checkIns").doc(id).set({
                      "uid": authController.getCurrentUser(),
                      "id": id,
                      "answers": answers,
                      "checkIn": value.docs.length + 1,
                      "timestamp": DateTime.now(),
                    }).then((value) {
                      Get.off(() => const CheckInConfirmation());
                    });
                  });
                }
              },
            ),
          ],
        ),
      ),
    ));
  }

  Widget questionWidget(
    int number,
    String question,
    TextEditingController controller,
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
        CustomTextField(
          verticalPadding: 10,
          fillColor: kWhite,
          inputAction:
              number == 22 ? TextInputAction.done : TextInputAction.next,
          inputType: TextInputType.text,
          controller: controller,
          nHintText: "Your answer",
          validator: FieldValidator.required(),
        ),
        const SizedBox(
          height: 15,
        )
      ],
    );
  }
}
