import 'dart:developer';

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
          actions: [
            GestureDetector(
              onTap: () => WorkoutVideoFilterController.instance.clearFilters(),
              child: Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Icon(
                  Icons.filter_alt_off,
                  color: kWhite,
                  size: 25,
                ),
              ),
            )
          ],
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
                            log(WorkoutVideoFilterController
                                .instance.difficultyLevel
                                .toString());
                            if (WorkoutVideoFilterController
                                .instance.difficultyLevel
                                .contains("Any Level")) {
                              log("Containsssss");
                              WorkoutVideoFilterController
                                  .instance.difficultyLevel
                                  .remove("Any Level");
                            } else {
                              log("Yesss");
                              WorkoutVideoFilterController
                                  .instance.difficultyLevel
                                  .add("Any Level");
                            }
                          },
                          child: CustomContainer(
                            color: (WorkoutVideoFilterController
                                    .instance.difficultyLevel
                                    .contains("Any Level"))
                                ? kWhite
                                : kLightGrey,
                            textColor: (WorkoutVideoFilterController
                                    .instance.difficultyLevel
                                    .contains("Any Level"))
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
                                .instance.difficultyLevel
                                .contains("Beginner")) {
                              WorkoutVideoFilterController
                                  .instance.difficultyLevel
                                  .remove("Beginner");
                            } else {
                              WorkoutVideoFilterController
                                  .instance.difficultyLevel
                                  .add("Beginner");
                            }
                          },
                          child: CustomContainer(
                            color: (WorkoutVideoFilterController
                                    .instance.difficultyLevel
                                    .contains("Beginner"))
                                ? kWhite
                                : kLightGrey,
                            textColor: (WorkoutVideoFilterController
                                    .instance.difficultyLevel
                                    .contains("Beginner"))
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
                                .instance.difficultyLevel
                                .contains("Intermediate")) {
                              WorkoutVideoFilterController
                                  .instance.difficultyLevel
                                  .remove("Intermediate");
                            } else {
                              WorkoutVideoFilterController
                                  .instance.difficultyLevel
                                  .add("Intermediate");
                            }
                          },
                          child: CustomContainer(
                            color: (WorkoutVideoFilterController
                                    .instance.difficultyLevel
                                    .contains("Intermediate"))
                                ? kWhite
                                : kLightGrey,
                            textColor: (WorkoutVideoFilterController
                                    .instance.difficultyLevel
                                    .contains("Intermediate"))
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
                                .instance.difficultyLevel
                                .contains("Advanced")) {
                              WorkoutVideoFilterController
                                  .instance.difficultyLevel
                                  .remove("Advanced");
                            } else {
                              WorkoutVideoFilterController
                                  .instance.difficultyLevel
                                  .add("Advanced");
                            }
                          },
                          child: CustomContainer(
                            color: (WorkoutVideoFilterController
                                    .instance.difficultyLevel
                                    .contains("Advanced"))
                                ? kWhite
                                : kLightGrey,
                            textColor: (WorkoutVideoFilterController
                                    .instance.difficultyLevel
                                    .contains("Advanced"))
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
                                .instance.muscleGroup
                                .contains("Full Body")) {
                              WorkoutVideoFilterController.instance.muscleGroup
                                  .remove("Full Body");
                            } else {
                              WorkoutVideoFilterController.instance.muscleGroup
                                  .add("Full Body");
                            }
                          },
                          child: CustomContainer(
                            color: (WorkoutVideoFilterController
                                    .instance.muscleGroup
                                    .contains("Full Body"))
                                ? kWhite
                                : kLightGrey,
                            textColor: (WorkoutVideoFilterController
                                    .instance.muscleGroup
                                    .contains("Full Body"))
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
                                .instance.muscleGroup
                                .contains("Lower Body")) {
                              WorkoutVideoFilterController.instance.muscleGroup
                                  .remove("Lower Body");
                            } else {
                              WorkoutVideoFilterController.instance.muscleGroup
                                  .add("Lower Body");
                            }
                          },
                          child: CustomContainer(
                            color: (WorkoutVideoFilterController
                                    .instance.muscleGroup
                                    .contains("Lower Body"))
                                ? kWhite
                                : kLightGrey,
                            textColor: (WorkoutVideoFilterController
                                    .instance.muscleGroup
                                    .contains("Lower Body"))
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
                                .instance.muscleGroup
                                .contains("Upper Body")) {
                              WorkoutVideoFilterController.instance.muscleGroup
                                  .remove("Upper Body");
                            } else {
                              WorkoutVideoFilterController.instance.muscleGroup
                                  .add("Upper Body");
                            }
                          },
                          child: CustomContainer(
                            color: (WorkoutVideoFilterController
                                    .instance.muscleGroup
                                    .contains("Upper Body"))
                                ? kWhite
                                : kLightGrey,
                            textColor: (WorkoutVideoFilterController
                                    .instance.muscleGroup
                                    .contains("Upper Body"))
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
                                .instance.muscleGroup
                                .contains("Core")) {
                              WorkoutVideoFilterController.instance.muscleGroup
                                  .remove("Core");
                            } else {
                              WorkoutVideoFilterController.instance.muscleGroup
                                  .add("Core");
                            }
                          },
                          child: CustomContainer(
                            color: (WorkoutVideoFilterController
                                    .instance.muscleGroup
                                    .contains("Core"))
                                ? kWhite
                                : kLightGrey,
                            textColor: (WorkoutVideoFilterController
                                    .instance.muscleGroup
                                    .contains("Core"))
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
                            if (WorkoutVideoFilterController.instance.equipment
                                .contains("Equipment")) {
                              WorkoutVideoFilterController.instance.equipment
                                  .remove("Equipment");
                            } else {
                              WorkoutVideoFilterController.instance.equipment
                                  .add("Equipment");
                            }
                          },
                          child: CustomContainer(
                            color: (WorkoutVideoFilterController
                                    .instance.equipment
                                    .contains("Equipment"))
                                ? kWhite
                                : kLightGrey,
                            textColor: (WorkoutVideoFilterController
                                    .instance.equipment
                                    .contains("Equipment"))
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
                            if (WorkoutVideoFilterController.instance.equipment
                                .contains("No Equipment")) {
                              WorkoutVideoFilterController.instance.equipment
                                  .remove("No Equipment");
                            } else {
                              WorkoutVideoFilterController.instance.equipment
                                  .add("No Equipment");
                            }
                          },
                          child: CustomContainer(
                            color: (WorkoutVideoFilterController
                                    .instance.equipment
                                    .contains("No Equipment"))
                                ? kWhite
                                : kLightGrey,
                            textColor: (WorkoutVideoFilterController
                                    .instance.equipment
                                    .contains("No Equipment"))
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
                            if (WorkoutVideoFilterController.instance.location
                                .contains("Gym")) {
                              WorkoutVideoFilterController.instance.location
                                  .remove("Gym");
                            } else {
                              WorkoutVideoFilterController.instance.location
                                  .add("Gym");
                            }
                          },
                          child: CustomContainer(
                            color: (WorkoutVideoFilterController
                                    .instance.location
                                    .contains("Gym"))
                                ? kWhite
                                : kLightGrey,
                            textColor: (WorkoutVideoFilterController
                                    .instance.location
                                    .contains("Gym"))
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
                            if (WorkoutVideoFilterController.instance.location
                                .contains("Home")) {
                              WorkoutVideoFilterController.instance.location
                                  .remove("Home");
                            } else {
                              WorkoutVideoFilterController.instance.location
                                  .add("Home");
                            }
                          },
                          child: CustomContainer(
                            color: (WorkoutVideoFilterController
                                    .instance.location
                                    .contains("Home"))
                                ? kWhite
                                : kLightGrey,
                            textColor: (WorkoutVideoFilterController
                                    .instance.location
                                    .contains("Home"))
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
