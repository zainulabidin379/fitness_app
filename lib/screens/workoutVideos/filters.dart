import 'package:fitness_app/controllers/workout_videos_filter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/constants.dart';

class WorkoutVideosFilter extends StatelessWidget {
  const WorkoutVideosFilter({super.key});

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
          child: Obx(() {
            return Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: Text(
                    "Difficulty level",
                    style: kBodyText.copyWith(
                        fontWeight: FontWeight.bold, fontSize: 22),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      Flexible(
                        child: GestureDetector(
                          onTap: () {
                            if (WorkoutVideoFilterController
                                    .instance.difficultyLevel.value ==
                                "Any Level") {
                              WorkoutVideoFilterController
                                  .instance.difficultyLevel.value = "";
                            } else {
                              WorkoutVideoFilterController
                                  .instance.difficultyLevel.value = "Any Level";
                            }
                          },
                          child: CustomContainer(
                            color: (WorkoutVideoFilterController
                                        .instance.difficultyLevel.value ==
                                    "Any Level")
                                ? kWhite
                                : kLightGrey,
                            textColor: (WorkoutVideoFilterController
                                        .instance.difficultyLevel.value ==
                                    "Any Level")
                                ? kBlack
                                : kWhite,
                            size: size,
                            filterTitle: 'Any Level',
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Flexible(
                        child: GestureDetector(
                          onTap: () {
                            if (WorkoutVideoFilterController
                                    .instance.difficultyLevel.value ==
                                "Beginner") {
                              WorkoutVideoFilterController
                                  .instance.difficultyLevel.value = "";
                            } else {
                              WorkoutVideoFilterController
                                  .instance.difficultyLevel.value = "Beginner";
                            }
                          },
                          child: CustomContainer(
                            color: (WorkoutVideoFilterController
                                        .instance.difficultyLevel.value ==
                                    "Beginner")
                                ? kWhite
                                : kLightGrey,
                            textColor: (WorkoutVideoFilterController
                                        .instance.difficultyLevel.value ==
                                    "Beginner")
                                ? kBlack
                                : kWhite,
                            size: size,
                            filterTitle: 'Beginner',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      Flexible(
                        child: GestureDetector(
                          onTap: () {
                            if (WorkoutVideoFilterController
                                    .instance.difficultyLevel.value ==
                                "Intermediate") {
                              WorkoutVideoFilterController
                                  .instance.difficultyLevel.value = "";
                            } else {
                              WorkoutVideoFilterController.instance
                                  .difficultyLevel.value = "Intermediate";
                            }
                          },
                          child: CustomContainer(
                            color: (WorkoutVideoFilterController
                                        .instance.difficultyLevel.value ==
                                    "Intermediate")
                                ? kWhite
                                : kLightGrey,
                            textColor: (WorkoutVideoFilterController
                                        .instance.difficultyLevel.value ==
                                    "Intermediate")
                                ? kBlack
                                : kWhite,
                            size: size,
                            filterTitle: 'Intermediate',
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Flexible(
                        child: GestureDetector(
                          onTap: () {
                            if (WorkoutVideoFilterController
                                    .instance.difficultyLevel.value ==
                                "Advanced") {
                              WorkoutVideoFilterController
                                  .instance.difficultyLevel.value = "";
                            } else {
                              WorkoutVideoFilterController
                                  .instance.difficultyLevel.value = "Advanced";
                            }
                          },
                          child: CustomContainer(
                            color: (WorkoutVideoFilterController
                                        .instance.difficultyLevel.value ==
                                    "Advanced")
                                ? kWhite
                                : kLightGrey,
                            textColor: (WorkoutVideoFilterController
                                        .instance.difficultyLevel.value ==
                                    "Advanced")
                                ? kBlack
                                : kWhite,
                            size: size,
                            filterTitle: 'Advanced',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: Text(
                    "Muscle Group",
                    style: kBodyText.copyWith(
                        fontWeight: FontWeight.bold, fontSize: 22),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      Flexible(
                        child: GestureDetector(
                          onTap: () {
                            if (WorkoutVideoFilterController
                                    .instance.muscleGroup.value ==
                                "Full Body") {
                              WorkoutVideoFilterController
                                  .instance.muscleGroup.value = "";
                            } else {
                              WorkoutVideoFilterController
                                  .instance.muscleGroup.value = "Full Body";
                            }
                          },
                          child: CustomContainer(
                            color: (WorkoutVideoFilterController
                                        .instance.muscleGroup.value ==
                                    "Full Body")
                                ? kWhite
                                : kLightGrey,
                            textColor: (WorkoutVideoFilterController
                                        .instance.muscleGroup.value ==
                                    "Full Body")
                                ? kBlack
                                : kWhite,
                            size: size,
                            filterTitle: 'Full Body',
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Flexible(
                        child: GestureDetector(
                          onTap: () {
                            if (WorkoutVideoFilterController
                                    .instance.muscleGroup.value ==
                                "Lower Body") {
                              WorkoutVideoFilterController
                                  .instance.muscleGroup.value = "";
                            } else {
                              WorkoutVideoFilterController
                                  .instance.muscleGroup.value = "Lower Body";
                            }
                          },
                          child: CustomContainer(
                            color: (WorkoutVideoFilterController
                                        .instance.muscleGroup.value ==
                                    "Lower Body")
                                ? kWhite
                                : kLightGrey,
                            textColor: (WorkoutVideoFilterController
                                        .instance.muscleGroup.value ==
                                    "Lower Body")
                                ? kBlack
                                : kWhite,
                            size: size,
                            filterTitle: 'Lower Body',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      Flexible(
                        child: GestureDetector(
                          onTap: () {
                            if (WorkoutVideoFilterController
                                    .instance.muscleGroup.value ==
                                "Upper Body") {
                              WorkoutVideoFilterController
                                  .instance.muscleGroup.value = "";
                            } else {
                              WorkoutVideoFilterController
                                  .instance.muscleGroup.value = "Upper Body";
                            }
                          },
                          child: CustomContainer(
                            color: (WorkoutVideoFilterController
                                        .instance.muscleGroup.value ==
                                    "Upper Body")
                                ? kWhite
                                : kLightGrey,
                            textColor: (WorkoutVideoFilterController
                                        .instance.muscleGroup.value ==
                                    "Upper Body")
                                ? kBlack
                                : kWhite,
                            size: size,
                            filterTitle: 'Upper Body',
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Flexible(
                        child: GestureDetector(
                          onTap: () {
                            if (WorkoutVideoFilterController
                                    .instance.muscleGroup.value ==
                                "Core") {
                              WorkoutVideoFilterController
                                  .instance.muscleGroup.value = "";
                            } else {
                              WorkoutVideoFilterController
                                  .instance.muscleGroup.value = "Core";
                            }
                          },
                          child: CustomContainer(
                            color: (WorkoutVideoFilterController
                                        .instance.muscleGroup.value ==
                                    "Core")
                                ? kWhite
                                : kLightGrey,
                            textColor: (WorkoutVideoFilterController
                                        .instance.muscleGroup.value ==
                                    "Core")
                                ? kBlack
                                : kWhite,
                            size: size,
                            filterTitle: 'Core',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: Text(
                    "Equipment",
                    style: kBodyText.copyWith(
                        fontWeight: FontWeight.bold, fontSize: 22),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      Flexible(
                        child: GestureDetector(
                          onTap: () {
                            if (WorkoutVideoFilterController
                                    .instance.equipment.value ==
                                "Equipment") {
                              WorkoutVideoFilterController
                                  .instance.equipment.value = "";
                            } else {
                              WorkoutVideoFilterController
                                  .instance.equipment.value = "Equipment";
                            }
                          },
                          child: CustomContainer(
                            color: (WorkoutVideoFilterController
                                        .instance.equipment.value ==
                                    "Equipment")
                                ? kWhite
                                : kLightGrey,
                            textColor: (WorkoutVideoFilterController
                                        .instance.equipment.value ==
                                    "Equipment")
                                ? kBlack
                                : kWhite,
                            size: size,
                            filterTitle: 'Equipment',
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Flexible(
                        child: GestureDetector(
                          onTap: () {
                            if (WorkoutVideoFilterController
                                    .instance.equipment.value ==
                                "No Equipment") {
                              WorkoutVideoFilterController
                                  .instance.equipment.value = "";
                            } else {
                              WorkoutVideoFilterController
                                  .instance.equipment.value = "No Equipment";
                            }
                          },
                          child: CustomContainer(
                            color: (WorkoutVideoFilterController
                                        .instance.equipment.value ==
                                    "No Equipment")
                                ? kWhite
                                : kLightGrey,
                            textColor: (WorkoutVideoFilterController
                                        .instance.equipment.value ==
                                    "No Equipment")
                                ? kBlack
                                : kWhite,
                            size: size,
                            filterTitle: 'No Equipment',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: Text(
                    "Location",
                    style: kBodyText.copyWith(
                        fontWeight: FontWeight.bold, fontSize: 22),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      Flexible(
                        child: GestureDetector(
                          onTap: () {
                            if (WorkoutVideoFilterController
                                    .instance.location.value ==
                                "Gym") {
                              WorkoutVideoFilterController
                                  .instance.location.value = "";
                            } else {
                              WorkoutVideoFilterController
                                  .instance.location.value = "Gym";
                            }
                          },
                          child: CustomContainer(
                            color: (WorkoutVideoFilterController
                                        .instance.location.value ==
                                    "Gym")
                                ? kWhite
                                : kLightGrey,
                            textColor: (WorkoutVideoFilterController
                                        .instance.location.value ==
                                    "Gym")
                                ? kBlack
                                : kWhite,
                            size: size,
                            filterTitle: 'Gym',
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Flexible(
                        child: GestureDetector(
                          onTap: () {
                            if (WorkoutVideoFilterController
                                    .instance.location.value ==
                                "Home") {
                              WorkoutVideoFilterController
                                  .instance.location.value = "";
                            } else {
                              WorkoutVideoFilterController
                                  .instance.location.value = "Home";
                            }
                          },
                          child: CustomContainer(
                            color: (WorkoutVideoFilterController
                                        .instance.location.value ==
                                    "Home")
                                ? kWhite
                                : kLightGrey,
                            textColor: (WorkoutVideoFilterController
                                        .instance.location.value ==
                                    "Home")
                                ? kBlack
                                : kWhite,
                            size: size,
                            filterTitle: 'Home',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                  child: Center(
                    child: GestureDetector(
                      onTap: () => Get.back(),
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        height: 55,
                        width: size.width * 1,
                        decoration: BoxDecoration(
                            color: kWhite,
                            borderRadius: BorderRadius.circular(5)),
                        child: Center(
                            child: Text(
                          'Apply filters',
                          style: kButtonText,
                        )),
                      ),
                    ),
                  ),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}

class CustomContainer extends StatelessWidget {
  final String filterTitle;
  final Color color;
  final Color textColor;
  const CustomContainer({
    Key? key,
    required this.color,
    required this.size,
    required this.filterTitle,
    required this.textColor,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      height: 55,
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(12)),
      child: Center(
          child: Text(
        filterTitle,
        style: kButtonText.copyWith(color: textColor),
      )),
    );
  }
}
