import 'package:fitness_app/screens/setWorkouts/cancel_timer.dart';
import 'package:fitness_app/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TimerScreen extends StatelessWidget {
  const TimerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              child: GestureDetector(
            onTap: () => Get.to(() => const CancelTimerScreen()),
            child: Center(
              child: Container(
                height: size.width * 0.4,
                width: size.width * 0.4,
                decoration:
                    BoxDecoration(color: kLightGrey, shape: BoxShape.circle),
                child: Center(
                  child: Text(
                    '42',
                    style: kBodyText.copyWith(
                        color: kWhite,
                        fontWeight: FontWeight.bold,
                        fontSize: 90),
                  ),
                ),
              ),
            ),
          )),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 5.0, bottom: 15),
                    child: Text(
                      'Next Workout',
                      style: kBodyText.copyWith(
                          color: kWhite,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Container(
                            padding: const EdgeInsets.all(15),
                            width: size.width * 0.35,
                            height: size.width * 0.22,
                            decoration: BoxDecoration(
                                image: const DecorationImage(
                                    image:
                                        AssetImage('assets/images/workout.jpg'),
                                    fit: BoxFit.cover),
                                borderRadius: BorderRadius.circular(16)),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(right: 4),
                          margin: const EdgeInsets.only(left: 10),
                          height: 25,
                          width: 25,
                          decoration: BoxDecoration(
                              color: kWhite, shape: BoxShape.circle),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: Icon(
                                Icons.arrow_forward_ios_outlined,
                                color: kBlack,
                                size: 15,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            textAlign: TextAlign.left,
                            'Short description of workout',
                            style: kBodyText.copyWith(
                                color: kWhite,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            textAlign: TextAlign.left,
                            '15 rest in seconds',
                            style:
                                kBodyText.copyWith(color: kWhite, fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 5.0, bottom: 15),
                    child: Text(
                      'Next Workout',
                      style: kBodyText.copyWith(
                          color: kWhite,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Container(
                            padding: const EdgeInsets.all(15),
                            width: size.width * 0.25,
                            height: size.width * 0.17,
                            decoration: BoxDecoration(
                                image: const DecorationImage(
                                    image:
                                        AssetImage('assets/images/workout.jpg'),
                                    fit: BoxFit.cover),
                                borderRadius: BorderRadius.circular(16)),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(right: 4),
                          margin: const EdgeInsets.only(left: 10),
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(
                              color: kWhite, shape: BoxShape.circle),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: Icon(
                                Icons.arrow_forward_ios_outlined,
                                color: kBlack,
                                size: 13,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            textAlign: TextAlign.left,
                            'Short description of workout',
                            style: kBodyText.copyWith(
                                color: kWhite,
                                fontWeight: FontWeight.bold,
                                fontSize: 13),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            textAlign: TextAlign.left,
                            '15 rest in seconds',
                            style:
                                kBodyText.copyWith(color: kWhite, fontSize: 10),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
