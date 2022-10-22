import 'package:fitness_app/screens/setWorkouts/complete_workout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/constants.dart';

class WorkingScreen extends StatelessWidget {
  const WorkingScreen({super.key});

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
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Center(
                child: Container(
                    height: 35,
                    width: 70,
                    margin: const EdgeInsets.symmetric(
                      vertical: 15,
                    ),
                    decoration: BoxDecoration(
                        color: kLightGrey,
                        borderRadius: BorderRadius.circular(4)),
                    child: Center(
                      child: Text(
                        "02:00",
                        style: kBodyText.copyWith(
                            color: kBlack,
                            fontSize: 17,
                            fontWeight: FontWeight.bold),
                      ),
                    )),
              ),
              Stack(
                alignment: Alignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      //margin: const EdgeInsets.only(bottom: 15, right: 15),
                      padding: const EdgeInsets.all(15),
                      width: size.width,
                      height: 190,
                      decoration: BoxDecoration(
                          image: const DecorationImage(
                              image: AssetImage('assets/images/workout.jpg'),
                              fit: BoxFit.cover),
                          borderRadius: BorderRadius.circular(24)),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(right: 4),
                    margin: const EdgeInsets.only(left: 10),
                    height: 32,
                    width: 32,
                    decoration:
                        BoxDecoration(color: kWhite, shape: BoxShape.circle),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Icon(
                          Icons.arrow_forward_ios_outlined,
                          color: kBlack,
                          size: 18,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                      bottom: 5,
                      right: 50,
                      child: Icon(
                        Icons.favorite,
                        color: kWhite,
                        size: 30,
                      ))
                ],
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                child: Text(
                  textAlign: TextAlign.center,
                  '15 Reps',
                  style: kBodyText.copyWith(
                      fontWeight: FontWeight.bold, fontSize: 25),
                ),
              ),
              Text(
                textAlign: TextAlign.center,
                'Knee Push Ups',
                style: kBodyText.copyWith(
                    fontWeight: FontWeight.bold, fontSize: 13),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      textAlign: TextAlign.center,
                      'Weight\nUsed',
                      style: kBodyText.copyWith(
                          fontWeight: FontWeight.bold, fontSize: 25),
                    ),
                    Container(
                      height: 55,
                      width: 80,
                      decoration: BoxDecoration(
                          color: kWhite,
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                        child: Text(
                          textAlign: TextAlign.center,
                          '8 Kg',
                          style:
                              kBodyText.copyWith(color: kBlack, fontSize: 20),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: size.height * 0.31,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                    color: kLightGrey,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(24),
                        topRight: Radius.circular(24))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        height: 4,
                        width: 100,
                        decoration: BoxDecoration(
                            color: kWhite,
                            borderRadius: BorderRadius.circular(24)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0, bottom: 10),
                      child: Text(
                        'Next Up',
                        style: kBodyText.copyWith(
                            color: kBlack,
                            fontWeight: FontWeight.bold,
                            fontSize: 17),
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
                                        image: AssetImage(
                                            'assets/images/workout.jpg'),
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
                                    color: kBlack,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Text(
                                textAlign: TextAlign.left,
                                '15 rest in seconds',
                                style: kBodyText.copyWith(
                                    color: kGrey, fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () => Get.to(() => const CompleteWorkout()),
                      child: Align(
                        alignment: Alignment.center,
                        child: Container(
                          margin: const EdgeInsets.symmetric(vertical: 20),
                          height: 50,
                          width: size.width * 0.7,
                          decoration: BoxDecoration(
                              color: kBlack,
                              borderRadius: BorderRadius.circular(16)),
                          child: Center(
                            child: Text(
                              textAlign: TextAlign.left,
                              'Complete Workout',
                              style: kBodyText.copyWith(
                                  fontSize: 17, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
