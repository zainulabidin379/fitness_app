import 'package:cached_network_image/cached_network_image.dart';
import 'package:fitness_app/constants/firebase_constants.dart';
import 'package:fitness_app/controllers/bottom_nav.dart';
import 'package:fitness_app/screens/setWorkouts/filters.dart';
import 'package:fitness_app/screens/setWorkouts/order_of_workouts.dart';
import 'package:fitness_app/screens/workoutVideos/personalized_plan.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

import '../../constants/constants.dart';

class SetWorkouts extends StatelessWidget {
  SetWorkouts({super.key});

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
                    onTap: () => Get.to(() => const SetWorkoutsFilter()),
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
                                  color: kWhite,
                                  borderRadius: BorderRadius.circular(10)),
                              height: 55,
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
                    StreamBuilder<dynamic>(
                        stream: firestore.collection("setWorkouts").snapshots(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return Column(
                              children: [
                                const SizedBox(
                                  height: 15,
                                ),
                                ...List.generate(
                                    snapshot.data.docs.length,
                                    (index) => Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20, vertical: 5),
                                          child: GestureDetector(
                                            onTap: () => Get.to(
                                                () => const OrderOfWorkouts()),
                                            child: Row(
                                              children: [
                                                CustomContainer(
                                                  imageString: snapshot.data
                                                      .docs[index]["thumbnail"],
                                                  duration: snapshot.data
                                                      .docs[index]["duration"],
                                                ),
                                                const SizedBox(width: 10),
                                                Text(
                                                  snapshot.data.docs[index]
                                                      ["name"],
                                                  style: kBodyText.copyWith(
                                                      color: kLightGrey,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 16),
                                                )
                                              ],
                                            ),
                                          ),
                                        )),
                              ],
                            );
                          } else {
                            return Padding(
                              padding: const EdgeInsets.only(top: 30),
                              child: Center(
                                child: SpinKitSpinningLines(
                                  color: kRed,
                                ),
                              ),
                            );
                          }
                        }),
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
  final String duration;
  const CustomContainer({
    Key? key,
    required this.imageString,
    required this.duration,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.only(bottom: 15, right: 15),
      height: size.width * 0.22,
      width: size.width * 0.3,
      child: CachedNetworkImage(
        imageUrl: imageString,
        imageBuilder: (context, imageProvider) => Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            image: DecorationImage(
              image: imageProvider,
              fit: BoxFit.cover,
            ),
          ),
          child: Align(
            alignment: Alignment.bottomRight,
            child: Container(
                height: 20,
                width: 40,
                decoration: BoxDecoration(
                    color: kLightGrey, borderRadius: BorderRadius.circular(4)),
                child: Center(
                  child: Text(
                    duration,
                    style: kBodyText.copyWith(
                        color: kBlack,
                        fontSize: 11,
                        fontWeight: FontWeight.bold),
                  ),
                )),
          ),
        ),
        errorWidget: (context, url, error) => Icon(
          Icons.error,
          color: kWhite,
        ),
        placeholder: (context, url) => SpinKitSpinningLines(color: kRed),
        fit: BoxFit.cover,
      ),
    );
  }
}
