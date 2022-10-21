import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/constants.dart';

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
          child: Column(
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
                    CustomContainer(
                      size: size,
                      filterTitle: 'Any Level',
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    CustomContainer(
                      size: size,
                      filterTitle: 'Beginner',
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    CustomContainer(
                      size: size,
                      filterTitle: 'Intermediate',
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    CustomContainer(
                      size: size,
                      filterTitle: 'Advanced',
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
                    CustomContainer(
                      size: size,
                      filterTitle: 'Full Body',
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    CustomContainer(
                      size: size,
                      filterTitle: 'Lower body',
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    CustomContainer(
                      size: size,
                      filterTitle: 'Upper body',
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    CustomContainer(
                      size: size,
                      filterTitle: 'Core',
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
                    CustomContainer(
                      size: size,
                      filterTitle: 'Equipment',
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    CustomContainer(
                      size: size,
                      filterTitle: 'No Equipment',
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
                    CustomContainer(
                      size: size,
                      filterTitle: 'Gym',
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    CustomContainer(
                      size: size,
                      filterTitle: 'Home',
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
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
          ),
        ),
      ),
    );
  }
}

class CustomContainer extends StatelessWidget {
  final String filterTitle;
  const CustomContainer({
    Key? key,
    required this.size,
    required this.filterTitle,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        height: 55,
        decoration: BoxDecoration(
            color: kWhite, borderRadius: BorderRadius.circular(12)),
        child: Center(
            child: Text(
          filterTitle,
          style: kButtonText,
        )),
      ),
    );
  }
}
