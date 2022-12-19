import 'package:fitness_app/constants/controllers.dart';
import 'package:fitness_app/constants/firebase_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

import '../../constants/constants.dart';

class DatesModel {
  final GlobalKey key;
  final DateTime date;

  const DatesModel(this.key, this.date);
}

class FoodDiaryScreen extends StatefulWidget {
  const FoodDiaryScreen({super.key});

  @override
  State<FoodDiaryScreen> createState() => _FoodDiaryScreenState();
}

class _FoodDiaryScreenState extends State<FoodDiaryScreen> {
  TextEditingController breakfastController = TextEditingController();
  TextEditingController lunchController = TextEditingController();
  TextEditingController dinnerController = TextEditingController();
  TextEditingController inBetweenMealsController = TextEditingController();
  TextEditingController liquidsController = TextEditingController();

  List<DatesModel> dates = List.generate(
      DateTime(DateTime.now().year, DateTime.now().month + 1, 0).day,
      (i) => DatesModel(
          GlobalKey(),
          DateTime(
            DateTime.now().year,
            DateTime.now().month,
          ).add(Duration(days: i))));

  var selectedDay =
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day)
          .obs;
  var isEditing = false.obs;

  void scrollToSelectedDay() {
    final targetContext = dates[selectedDay.value.day - 1].key.currentContext;
    if (targetContext != null) {
      Scrollable.ensureVisible(
        targetContext,
        duration: const Duration(milliseconds: 1000),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => scrollToSelectedDay());
  }

  String weekDay(int day) {
    switch (day) {
      case 1:
        {
          return "Monday";
        }
      case 2:
        {
          return "Tuesday";
        }
      case 3:
        {
          return "Wednesday";
        }
      case 4:
        {
          return "Thursday";
        }
      case 5:
        {
          return "Friday";
        }
      case 6:
        {
          return "Saturday";
        }
      case 7:
        {
          return "Sunday";
        }
      default:
        {
          return "";
        }
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      backgroundColor: kBlack,
      appBar: AppBar(
        backgroundColor: kBlack,
        title: Text(
          "Food Diary",
          style: kBodyText.copyWith(fontSize: 20, fontWeight: FontWeight.bold),
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
      floatingActionButton: Obx(() {
        return isEditing.value
            ? ElevatedButton(
                onPressed: () {
                  FocusScope.of(context).unfocus();
                  Get.dialog(
                    SpinKitSpinningLines(color: kRed),
                    barrierDismissible: false,
                  );
                  firestore
                      .collection("foodDiary")
                      .doc(authController.getCurrentUser())
                      .collection("dates")
                      .doc(selectedDay.value.toString())
                      .set({
                    "id": selectedDay.value,
                    "breakfast": breakfastController.text,
                    "lunch": lunchController.text,
                    "dinner": dinnerController.text,
                    "inBetweenMeals": inBetweenMealsController.text,
                    "liquids": liquidsController.text,
                    "timestamp": DateTime.now(),
                  }).then((value) {
                    Get.back();
                    isEditing.value = false;
                    Get.rawSnackbar(
                      messageText: Text(
                        "Your food diary is updated successfully",
                        style: kBodyText.copyWith(color: kBlack),
                      ),
                      backgroundColor: kWhite,
                      snackPosition: SnackPosition.TOP,
                      borderRadius: 10,
                      margin: const EdgeInsets.all(10),
                    );
                  });
                },
                style: ButtonStyle(
                    fixedSize:
                        MaterialStateProperty.all<Size?>(const Size(150, 55)),
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                    backgroundColor: MaterialStateProperty.all<Color>(kRed),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.done,
                      color: kWhite,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text("Update".toUpperCase(), style: kBodyText),
                  ],
                ))
            : FloatingActionButton(
                onPressed: () {
                  isEditing.value = true;
                },
                backgroundColor: kRed,
                isExtended: true,
                child: Icon(isEditing.value ? Icons.done : Icons.edit),
              );
      }),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  const SizedBox(
                    width: 15,
                  ),
                  ...List.generate(
                      dates.length,
                      (index) => dayCard(
                          size,
                          dates[index].key,
                          weekDay(dates[index].date.weekday),
                          dates[index].date.day.toString(),
                          dates[index].date)),
                  const SizedBox(
                    width: 15,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: kGrey,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15))),
                child: SingleChildScrollView(
                  child: Column(children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Obx(() {
                      return StreamBuilder<dynamic>(
                          stream: firestore
                              .collection("foodDiary")
                              .doc(authController.getCurrentUser())
                              .collection("dates")
                              .doc(selectedDay.value.toString())
                              .snapshots(),
                          builder: (context, snapshot) {
                            return snapshot.hasData
                                ? Column(
                                    children: [
                                      mealTypeCard(
                                          size,
                                          "Breakfast",
                                          snapshot.data.exists
                                              ? snapshot.data['breakfast']
                                              : null,
                                          breakfastController),
                                      mealTypeCard(
                                          size,
                                          "Lunch",
                                          snapshot.data.exists
                                              ? snapshot.data['lunch']
                                              : null,
                                          lunchController),
                                      mealTypeCard(
                                          size,
                                          "Dinner",
                                          snapshot.data.exists
                                              ? snapshot.data['dinner']
                                              : null,
                                          dinnerController),
                                      betweenMealsCard(
                                          size,
                                          'In-between Meals',
                                          snapshot.data.exists
                                              ? snapshot.data['inBetweenMeals']
                                              : null,
                                          inBetweenMealsController),
                                      mealTypeCard(
                                          size,
                                          "Liquids",
                                          snapshot.data.exists
                                              ? snapshot.data['liquids']
                                              : null,
                                          liquidsController),
                                    ],
                                  )
                                : Center(
                                    child: SpinKitSpinningLines(color: kRed));
                          });
                    }),
                    const SizedBox(
                      height: 20,
                    )
                  ]),
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }

  Widget mealTypeCard(Size size, String title, String? value,
      TextEditingController controller) {
    if (!isEditing.value) {
      controller.text = value ?? '';
    }
    return Obx(() {
      return Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
          width: size.width,
          decoration: BoxDecoration(
              color: kBlack, borderRadius: BorderRadius.circular(8)),
          child: Row(
            children: [
              SizedBox(
                width: size.width * 0.28,
                child: Text(
                  title,
                  style: kBodyText.copyWith(
                      fontSize: size.width * 0.05, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                width: size.width * 0.05,
              ),
              Flexible(
                child: TextField(
                  onTap: () => scrollToSelectedDay(),
                  controller: controller,
                  textAlign: TextAlign.center,
                  enabled: isEditing.value,
                  cursorColor: kWhite,
                  maxLines: 3,
                  style: kBodyText.copyWith(color: kWhite, fontSize: 13),
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.zero,
                      filled: false,
                      hintText: "Add $title",
                      hintStyle: kBodyText.copyWith(
                          color: kWhite.withOpacity(0.5), fontSize: 13),
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }

  Widget betweenMealsCard(Size size, String title, String? value,
      TextEditingController controller) {
    if (!isEditing.value) {
      controller.text = value ?? '';
    }
    return Obx(() {
      return Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          width: size.width,
          decoration: BoxDecoration(
              color: kBlack, borderRadius: BorderRadius.circular(8)),
          child: Column(
            children: [
              Text(
                title,
                style: kBodyText.copyWith(
                    fontSize: size.width * 0.05, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: size.width * 0.03,
              ),
              TextField(
                onTap: () => scrollToSelectedDay(),
                textAlign: TextAlign.center,
                controller: controller,
                enabled: isEditing.value,
                cursorColor: kWhite,
                maxLines: 2,
                style: kBodyText.copyWith(color: kWhite, fontSize: 13),
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.zero,
                    filled: false,
                    hintText: "Add $title",
                    hintStyle: kBodyText.copyWith(
                        color: kWhite.withOpacity(0.5), fontSize: 13),
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none),
              ),
            ],
          ),
        ),
      );
    });
  }

  Widget dayCard(
      Size size, GlobalKey key, String day, String date, DateTime dateTime) {
    return Obx(() {
      return GestureDetector(
        onTap: () {
          selectedDay.value = dateTime;
        },
        child: Container(
          key: key,
          margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 5),
          height: size.width * 0.22,
          width: size.width * 0.22,
          decoration: BoxDecoration(
              border: Border.all(color: kWhite, width: 3),
              color: selectedDay.value == dateTime ? kDark : kWhite,
              borderRadius: BorderRadius.circular(15)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                day,
                textAlign: TextAlign.center,
                style: kBodyText.copyWith(
                    fontSize: size.width * 0.03,
                    fontWeight: FontWeight.bold,
                    color: selectedDay.value == dateTime ? kWhite : kBlack),
              ),
              Text(
                date,
                style: kBodyText.copyWith(
                    fontSize: 32,
                    color: selectedDay.value == dateTime ? kWhite : kBlack),
              ),
            ],
          ),
        ),
      );
    });
  }
}
