import 'package:fitness_app/screens/checkIn/check_in_screen.dart';
import 'package:fitness_app/screens/diary/food_diary_screen.dart';
import 'package:fitness_app/screens/saved_items.dart';
import 'package:fitness_app/screens/shopping/shooping_list_overView_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/constants.dart';

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

  // @override
  // void initState() {
  //   if (FirebaseAuth.instance.currentUser == null) {
  //     setState(() {
  //       loading = false;
  //       loggedIn = false;
  //     });
  //   } else {
  //     getUser();
  //   }
  //   super.initState();
  // }

  // Future getUser() async {
  //   await FirebaseFirestore.instance
  //       .collection('users')
  //       .doc(_auth.getCurrentUser())
  //       .get()
  //       .then((value) {
  //     setState(() {
  //       subscription = value['premium'];
  //       name = value['name'];
  //       email = value['email'];
  //       loading = false;
  //       loggedIn = true;
  //     });
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Drawer(
      backgroundColor: kBlack,
      width: size.width * 0.82,
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
                        Container(
                          height: 90,
                          width: 90,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: kDark, width: 3),
                              image: const DecorationImage(
                                  image: AssetImage(
                                      "assets/images/videosImage.jpg"))),
                        ),
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
                            Text(
                              "2 Months ago",
                              style: kBodyText.copyWith(
                                  fontWeight: FontWeight.bold),
                            ),
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
                      child: Text(
                        "Name Goes Here",
                        textAlign: TextAlign.center,
                        style: kBodyText.copyWith(
                            fontWeight: FontWeight.bold, fontSize: 22),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  profileItem(() => Get.to(() => CheckInScreen()), "Check In"),
                  profileItem(() {}, "Personalized Workout Plans"),
                  profileItem(() {}, "Personalized Nutrition Plans"),
                  profileItem(() => Get.to(() => ShopingListOverViewScreen()),
                      "Shopping List"),
                  profileItem(
                      () => Get.to(() => FoodDiaryScreen()), "Food Diary"),
                  profileItem(() {}, "Fitness Diary"),
                  profileItem(() {}, "Lifestyle Diary"),
                  profileItem(() {}, "Picture Diary"),
                  profileItem(() => Get.to(() => const SavedItemsScreen()),
                      "Saved Items"),
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
