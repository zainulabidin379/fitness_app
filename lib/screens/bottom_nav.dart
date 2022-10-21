import 'package:auto_size_text/auto_size_text.dart';
import 'package:fitness_app/screens/explore.dart';
import 'package:fitness_app/screens/homepage.dart';
import 'package:fitness_app/screens/meals_nutrition_screen.dart';
import 'package:fitness_app/screens/workoutVideos/order_of_workouts.dart';
import 'package:flutter/material.dart';

import '../utils/constants.dart';

class BottomNav extends StatefulWidget {
  final int? currentTab;
  const BottomNav({Key? key, this.currentTab}) : super(key: key);

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  int? currentTab;
  bool loading = true;

  @override
  void initState() {
    currentTab = widget.currentTab ?? 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        key: _scaffoldKey,
        body: currentTab == 0
            ? const HomePage()
            : currentTab == 1
                ? const OrderOfWorkouts()
                : currentTab == 2
                    ? const HomePage()
                    : currentTab == 3
                        ? const MealsNutritionScreen()
                        : const ExploreScreen(),
        bottomNavigationBar: BottomAppBar(
          elevation: 10,
          color: kBlack,
          child: SizedBox(
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                menuItem('Home', "assets/images/home.png", 0),
                menuItem('Exercise Videos', "assets/images/videos.png", 1),
                menuItem('Set Programs', "assets/images/sets.png", 2),
                menuItem('Meals Nutrition', "assets/images/meals.png", 3),
                menuItem('Explore/Feed', "assets/images/search.png", 4),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget menuItem(String name, String icon, int value) {
    return MaterialButton(
      splashColor: kTrans,
      highlightColor: kTrans,
      minWidth: 20,
      padding: EdgeInsets.zero,
      onPressed: () {
        setState(() {
          currentTab = value;
        });
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            icon,
            height: 20,
            color: currentTab == value ? kRed : kWhite,
          ),
          const SizedBox(
            height: 5,
          ),
          AutoSizeText(
            name,
            maxLines: 1,
            minFontSize: 5,
            maxFontSize: 9,
            style: kBodyText.copyWith(
              fontSize: 9,
              fontWeight: FontWeight.bold,
              color: currentTab == value ? kRed : kWhite,
            ),
          ),
        ],
      ),
    );
  }
}
