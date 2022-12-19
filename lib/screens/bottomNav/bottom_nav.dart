import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:fitness_app/constants/controllers.dart';
import 'package:fitness_app/constants/firebase_constants.dart';
import 'package:fitness_app/controllers/bottom_nav.dart';
import 'package:fitness_app/screens/explore/explore.dart';
import 'package:fitness_app/screens/homepage.dart';
import 'package:fitness_app/screens/live/live.dart';
import 'package:fitness_app/screens/meals_nutrition_screen.dart';
import 'package:fitness_app/screens/profile/profile.dart';
import 'package:fitness_app/screens/setWorkouts/set_workouts.dart';
import 'package:fitness_app/screens/workoutVideos/workout_videos.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

import '../../constants/constants.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({Key? key}) : super(key: key);

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  bool loading = true;

  @override
  void initState() {
    FlutterNativeSplash.remove();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Obx(
      () => Scaffold(
        key: _scaffoldKey,
        body: BottomNavController.instance.currentTab.value == 0
            ? const HomePage()
            : BottomNavController.instance.currentTab.value == 1
                ? const LiveScreen()
                : BottomNavController.instance.currentTab.value == 2
                    ? WorkoutVideos()
                    : BottomNavController.instance.currentTab.value == 3
                        ? SetWorkouts()
                        : BottomNavController.instance.currentTab.value == 4
                            ? MealsNutritionScreen()
                            : BottomNavController.instance.currentTab.value == 5
                                ? const ProfileScreen()
                                : const ExploreScreen(),
        bottomNavigationBar: BottomAppBar(
          elevation: 10,
          color: kBlack,
          child: SizedBox(
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                liveMenuItem("assets/images/live.png", 1),
                menuItem('Exercise Videos', "assets/images/videos.png", 2),
                menuItem('Set Workouts', "assets/images/sets.png", 3),
                menuItem('Meals Nutrition', "assets/images/meals.png", 4),
                profileMenuItem("Profile", 5),
                menuItem('Explore/Feed', "assets/images/search.png", 6),
              ],
            ),
          ),
        ),
      ),
    ));
  }

  Widget menuItem(String name, String icon, int value) {
    return MaterialButton(
      splashColor: kTrans,
      highlightColor: kTrans,
      minWidth: 20,
      padding: EdgeInsets.zero,
      onPressed: () {
        BottomNavController.instance.navigateTo(value);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            icon,
            height: 20,
            color: BottomNavController.instance.currentTab.value == value
                ? kRed
                : kWhite,
          ),
          const SizedBox(
            height: 5,
          ),
          BottomNavController.instance.currentTab.value == value
              ? AutoSizeText(
                  name,
                  maxLines: 1,
                  minFontSize: 5,
                  maxFontSize: 9,
                  style: kBodyText.copyWith(
                    color:
                        BottomNavController.instance.currentTab.value == value
                            ? kRed
                            : kWhite,
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }

  Widget profileMenuItem(String name, int value) {
    return StreamBuilder<dynamic>(
        stream: firestore
            .collection("users")
            .doc(authController.getCurrentUser())
            .snapshots(),
        builder: (context, snapshot) {
          return snapshot.hasData
              ? MaterialButton(
                  splashColor: kTrans,
                  highlightColor: kTrans,
                  minWidth: 20,
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    BottomNavController.instance.navigateTo(value);
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 20,
                        width: 20,
                        child: CachedNetworkImage(
                          imageUrl: snapshot.data["image"],
                          imageBuilder: (context, imageProvider) => Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: imageProvider,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          errorWidget: (context, url, error) => Icon(
                            Icons.error,
                            color: kWhite,
                          ),
                          placeholder: (context, url) => SpinKitSpinningLines(
                            color: kRed,
                            size: 20,
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      BottomNavController.instance.currentTab.value == value
                          ? AutoSizeText(
                              name,
                              maxLines: 1,
                              minFontSize: 5,
                              maxFontSize: 9,
                              style: kBodyText.copyWith(
                                color: BottomNavController
                                            .instance.currentTab.value ==
                                        value
                                    ? kRed
                                    : kWhite,
                              ),
                            )
                          : const SizedBox(),
                    ],
                  ),
                )
              : SpinKitSpinningLines(
                  color: BottomNavController.instance.currentTab.value == value
                      ? kRed
                      : kWhite,
                  size: 20,
                );
        });
  }

  Widget liveMenuItem(String icon, int value) {
    return MaterialButton(
      splashColor: kTrans,
      highlightColor: kTrans,
      minWidth: 20,
      padding: EdgeInsets.zero,
      onPressed: () {
        BottomNavController.instance.navigateTo(value);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                  color: kRed, borderRadius: BorderRadius.circular(5)),
              child: Text(
                "Live",
                style: kBodyText.copyWith(
                    fontSize: 11, fontWeight: FontWeight.bold),
              ))
          // Image.asset(
          //   icon,
          //   height: 25,
          //   color: BottomNavController.instance.currentTab.value == value
          //       ? kRed
          //       : kWhite,
          // ),
          // const SizedBox(
          //   height: 5,
          // ),
        ],
      ),
    );
  }
}
