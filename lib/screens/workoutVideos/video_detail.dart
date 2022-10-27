import 'package:fitness_app/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WorkoutVideoDetail extends StatelessWidget {
  const WorkoutVideoDetail({super.key});

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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                          height: 20,
                          width: 40,
                          decoration: BoxDecoration(
                              color: kLightGrey,
                              borderRadius: BorderRadius.circular(4)),
                          child: Center(
                            child: Text(
                              "10:00",
                              style: kBodyText.copyWith(
                                  color: kBlack,
                                  fontSize: 11,
                                  fontWeight: FontWeight.bold),
                            ),
                          )),
                    ),
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
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 30),
              child: Text(
                'Full body goal crusher',
                style: kBodyText.copyWith(
                    fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Text(
                'Description',
                style: kBodyText.copyWith(
                    fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 20, right: 20, top: 5, bottom: 20),
              child: Text(
                'This is a dummy description. ' * 4,
                style: kBodyText.copyWith(fontSize: 13),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                children: [
                  Flexible(
                    child: Column(
                      children: [
                        Text(
                          'Difficulty Level',
                          style: kBodyText.copyWith(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          height: 50,
                          decoration: BoxDecoration(
                              color: kWhite,
                              borderRadius: BorderRadius.circular(12)),
                          child: Center(
                              child: Text(
                            'Intermediate',
                            style: kButtonText,
                          )),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Flexible(
                    child: Column(
                      children: [
                        Text(
                          'Muscle Group',
                          style: kBodyText.copyWith(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          height: 50,
                          decoration: BoxDecoration(
                              color: kWhite,
                              borderRadius: BorderRadius.circular(12)),
                          child: Center(
                              child: Text(
                            'Chest',
                            style: kButtonText,
                          )),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                children: [
                  Flexible(
                    child: Column(
                      children: [
                        Text(
                          'Equipment',
                          style: kBodyText.copyWith(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          height: 50,
                          decoration: BoxDecoration(
                              color: kWhite,
                              borderRadius: BorderRadius.circular(12)),
                          child: Center(
                              child: Text(
                            'Equipment',
                            style: kButtonText,
                          )),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Flexible(
                    child: Column(
                      children: [
                        Text(
                          'Location',
                          style: kBodyText.copyWith(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          height: 50,
                          decoration: BoxDecoration(
                              color: kWhite,
                              borderRadius: BorderRadius.circular(12)),
                          child: Center(
                              child: Text(
                            'Gym',
                            style: kButtonText,
                          )),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
