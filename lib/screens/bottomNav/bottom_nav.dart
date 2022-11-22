import 'package:auto_size_text/auto_size_text.dart';
import 'package:fitness_app/controllers/bottom_nav.dart';
import 'package:fitness_app/screens/explore/explore.dart';
import 'package:fitness_app/screens/homepage.dart';
import 'package:fitness_app/screens/live/live.dart';
import 'package:fitness_app/screens/meals_nutrition_screen.dart';
import 'package:fitness_app/screens/setWorkouts/set_workouts.dart';
import 'package:fitness_app/screens/workoutVideos/workout_videos.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
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
            ? const LiveScreen()
            : BottomNavController.instance.currentTab.value == 1
                ? const HomePage()
                : BottomNavController.instance.currentTab.value == 2
                    ? WorkoutVideos()
                    : BottomNavController.instance.currentTab.value == 3
                        ? SetWorkouts()
                        : BottomNavController.instance.currentTab.value == 4
                            ? MealsNutritionScreen()
                            : ExploreScreen(),
        bottomNavigationBar: BottomAppBar(
          elevation: 10,
          color: kBlack,
          child: SizedBox(
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                liveMenuItem("assets/images/live.png", 0),
                menuItem('Home', "assets/images/home.png", 1),
                menuItem('Exercise Videos', "assets/images/videos.png", 2),
                menuItem('Set Workouts', "assets/images/sets.png", 3),
                menuItem('Meals Nutrition', "assets/images/meals.png", 4),
                menuItem('Explore/Feed', "assets/images/search.png", 5),
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
