import 'package:fitness_app/controllers/bottom_nav.dart';
import 'package:fitness_app/screens/workoutVideos/filters.dart';
import 'package:fitness_app/screens/workoutVideos/personalized_plan.dart';
import 'package:fitness_app/screens/workoutVideos/video_detail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/constants.dart';

class WorkoutVideos extends StatelessWidget {
  WorkoutVideos({super.key});

  final BottomNavController _navController = Get.put(BottomNavController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: kBlack,
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(
                    width: 45,
                  ),
                  GestureDetector(
                    onTap: () {
                      _navController.navigateTo(0);
                    },
                    child: SizedBox(
                      height: 55,
                      child: Image.asset("assets/images/logo.png"),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Get.to(() => const WorkoutVideosFilter()),
                    child: Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Icon(
                        Icons.filter_alt,
                        color: kWhite,
                        size: 25,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        children: [
                          Flexible(
                            child: Container(
                              decoration: BoxDecoration(
                                  //ckgroundColor: Colors.white,
                                  color: kWhite,
                                  borderRadius: BorderRadius.circular(10)),

                              //margin: const EdgeInsets.symmetric(vertical: 10),
                              height: 60,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 8, top: 8),
                                child: TextField(
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.search,
                                      color: kBlack,
                                      size: 24,
                                    ),
                                    border: InputBorder.none,
                                    hintText: 'Search',
                                  ),
                                  cursorColor: kBlack,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ...List.generate(
                        6,
                        (index) => GestureDetector(
                              onTap: () =>
                                  Get.to(() => const WorkoutVideoDetail()),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 5),
                                child: GestureDetector(
                                  // onTap: () =>
                                  //     Get.to(() => const NutritionDetailScreen()),
                                  child: Row(
                                    children: [
                                      const CustomContainer(
                                        imageString:
                                            "assets/images/setsImage.jpg",
                                      ),
                                      const SizedBox(width: 10),
                                      Text(
                                        'Name of video',
                                        style: kBodyText.copyWith(
                                            color: kLightGrey,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            )),
                    const SizedBox(
                      height: 15,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Center(
                child: GestureDetector(
                  onTap: () => Get.to(() => const PersonalizedFitnessPlan()),
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    height: 55,
                    width: size.width * 1,
                    decoration: BoxDecoration(
                        color: kWhite, borderRadius: BorderRadius.circular(5)),
                    child: Center(
                        child: Text(
                      'Apply for personalised fitness plan',
                      style: kButtonText,
                    )),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomContainer extends StatelessWidget {
  final String imageString;
  const CustomContainer({
    Key? key,
    required this.imageString,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.only(bottom: 15, right: 15),
      padding: const EdgeInsets.all(15),
      height: size.width * 0.22,
      width: size.width * 0.3,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(imageString), fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(24)),
      child: Align(
        alignment: Alignment.bottomRight,
        child: Container(
            height: 20,
            width: 40,
            decoration: BoxDecoration(
                color: kLightGrey, borderRadius: BorderRadius.circular(4)),
            child: Center(
              child: Text(
                "10:00",
                style: kBodyText.copyWith(
                    color: kBlack, fontSize: 11, fontWeight: FontWeight.bold),
              ),
            )),
      ),
    );
  }
}
