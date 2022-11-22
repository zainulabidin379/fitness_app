import 'package:cached_network_image/cached_network_image.dart';
import 'package:date_time_format/date_time_format.dart';
import 'package:fitness_app/constants/firebase_constants.dart';
import 'package:fitness_app/controllers/auth_controller.dart';
import 'package:fitness_app/screens/checkIn/check_in_screen.dart';
import 'package:fitness_app/screens/diary/fitness_diary_screen.dart';
import 'package:fitness_app/screens/diary/food_diary_screen.dart';
import 'package:fitness_app/screens/diary/life_style_diary_screen.dart';
import 'package:fitness_app/screens/diary/picture_diary_screen.dart';
import 'package:fitness_app/screens/nutrition/personalised_nutrition_confirmation_screen.dart';
import 'package:fitness_app/screens/savedItems/saved_items.dart';
import 'package:fitness_app/screens/shopping/shooping_list_overView_screen.dart';
import 'package:fitness_app/screens/workoutVideos/personalized_plan.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

import '../constants/constants.dart';

class NavDrawer extends StatefulWidget {
  const NavDrawer({Key? key}) : super(key: key);
  @override
  State<NavDrawer> createState() => _NavDrawerState();
}

class _NavDrawerState extends State<NavDrawer> {
  ///final AuthController _auth = AuthController();
  bool subscription = false;
  bool loggedIn = false;
  bool loading = true;
  String name = "";
  String email = "";

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Drawer(
      backgroundColor: kBlack,
      width: size.width * 0.85,
      child: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: GestureDetector(
              onTap: () => Get.back(),
              child: Container(
                margin: const EdgeInsets.only(left: 15, top: 25),
                padding: const EdgeInsets.only(right: 4),
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
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 20, right: 20, top: 30, bottom: 20),
                    child: Row(
                      children: [
                        StreamBuilder<dynamic>(
                            stream: firestore
                                .collection("users")
                                .doc(AuthController.instance.getCurrentUser())
                                .snapshots(),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                return Container(
                                    height: 90,
                                    width: 90,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border:
                                          Border.all(color: kDark, width: 3),
                                    ),
                                    child: CachedNetworkImage(
                                      imageUrl: snapshot.data["image"],
                                      imageBuilder: (context, imageProvider) =>
                                          Container(
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: imageProvider,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      errorWidget: (context, url, error) =>
                                           Icon(Icons.error, color: kWhite,),
                                      placeholder: (context, url) =>
                                          SpinKitSpinningLines(color: kRed),
                                      fit: BoxFit.cover,
                                    ));
                              } else {
                                return Container(
                                  height: 90,
                                  width: 90,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(color: kDark, width: 3),
                                  ),
                                  child: Center(
                                      child: SpinKitSpinningCircle(
                                    color: kRed,
                                  )),
                                );
                              }
                            }),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 20),
                          height: 90,
                          child: VerticalDivider(
                            color: kDark,
                            thickness: 1,
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Joined",
                              style: kBodyText.copyWith(
                                  color: kDark, fontSize: 13),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            StreamBuilder<dynamic>(
                                stream: firestore
                                    .collection("users")
                                    .doc(AuthController.instance
                                        .getCurrentUser())
                                    .snapshots(),
                                builder: (context, snapshot) {
                                  return Text(
                                    snapshot.hasData
                                        ? DateTimeFormat.relative(
                                            snapshot.data["timestamp"].toDate(),
                                            ifNow: 'Now',
                                            appendIfAfter: 'ago')
                                        : "......",
                                    style: kBodyText.copyWith(
                                        fontWeight: FontWeight.bold),
                                  );
                                }),
                          ],
                        )
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      child: StreamBuilder<dynamic>(
                          stream: firestore
                              .collection("users")
                              .doc(AuthController.instance.getCurrentUser())
                              .snapshots(),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return Text(
                                snapshot.data["name"],
                                style: kBodyText.copyWith(
                                    fontWeight: FontWeight.bold, fontSize: 22),
                              );
                            } else {
                              return Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 26),
                                    child: SpinKitSpinningLines(
                                      color: kRed,
                                      size: 30,
                                    ),
                                  ),
                                ],
                              );
                            }
                          }),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  profileItem(() => Get.to(() => CheckInScreen()), "Check In"),
                  profileItem(
                      () => Get.to(() => const PersonalizedFitnessPlan()),
                      "Personalized Workout Plans"),
                  profileItem(
                      () => Get.to(() =>
                          const PersonalizedNutritionConfirmationScreen()),
                      "Personalized Nutrition Plans"),
                  profileItem(() => Get.to(() => ShopingListOverViewScreen()),
                      "Shopping List"),
                  profileItem(
                      () => Get.to(() => FoodDiaryScreen()), "Food Diary"),
                  profileItem(() => Get.to(() => FitnessDiaryScreen()),
                      "Fitness Diary"),
                  profileItem(() => Get.to(() => const LifeStyleDiaryScreen()),
                      "Lifestyle Diary"),
                  profileItem(() => Get.to(() => const PictureDiaryScreen()),
                      "Picture Diary"),
                  profileItem(() => Get.to(() => const SavedItemsScreen()),
                      "Saved Items"),
                  profileItem(
                      () => AuthController.instance.signOut(), "Logout"),
                  const SizedBox(
                    height: 10,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget profileItem(
    Function() onTap,
    String title,
  ) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
        height: 45,
        decoration: BoxDecoration(
            color: kWhite, borderRadius: BorderRadius.circular(8)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: kButtonText.copyWith(fontSize: 12),
              ),
              Icon(
                Icons.navigate_next,
                color: kBlack,
                size: 25,
              )
            ],
          ),
        ),
      ),
    );
  }
}
