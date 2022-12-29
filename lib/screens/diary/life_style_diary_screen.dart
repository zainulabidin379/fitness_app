
import 'package:fitness_app/constants/controllers.dart';
import 'package:fitness_app/constants/firebase_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../constants/constants.dart';

class LifeStyleDiaryScreen extends StatefulWidget {
  const LifeStyleDiaryScreen({super.key});

  @override
  State<LifeStyleDiaryScreen> createState() => _LifeStyleDiaryScreenState();
}

class _LifeStyleDiaryScreenState extends State<LifeStyleDiaryScreen> {
  TextEditingController sleepController = TextEditingController();
  TextEditingController stepsController = TextEditingController();
  TextEditingController moodController = TextEditingController();
  TextEditingController periodController = TextEditingController();
  var selectedDay = DateUtils.dateOnly(DateTime.now()).obs;
  var isEditing = false.obs;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      backgroundColor: kBlack,
      appBar: AppBar(
        backgroundColor: kBlack,
        title: Text(
          "Lifestyle Diary",
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
                      .collection("lifestyleDiary")
                      .doc(authController.getCurrentUser())
                      .collection("dates")
                      .doc(selectedDay.value.toString())
                      .set({
                    "id": selectedDay.value,
                    "sleep": sleepController.text,
                    "steps": stepsController.text,
                    "mood": moodController.text,
                    "period": periodController.text,
                    "timestamp": DateTime.now(),
                  }).then((value) {
                    Get.back();
                    isEditing.value = false;
                    Get.rawSnackbar(
                      messageText: Text(
                        "Your lifestyle diary is updated successfully",
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
        child: Obx(() {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TableCalendar(
                    focusedDay: selectedDay.value,
                    firstDay: DateTime.utc(2010, 01, 01),
                    lastDay: DateTime.utc(2050, 12, 30),
                    rowHeight: 40,
                    selectedDayPredicate: (day) {
                      return isSameDay(selectedDay.value, day);
                    },
                    onDaySelected: (selectedDate, focusedDay) {
                      if (!isSameDay(selectedDay.value, selectedDate)) {
                        selectedDay.value = DateUtils.dateOnly(selectedDate);
                      }
                    },
                    headerStyle: HeaderStyle(
                        leftChevronIcon:
                            Icon(Icons.chevron_left, color: kWhite),
                        rightChevronIcon:
                            Icon(Icons.chevron_right, color: kWhite),
                        formatButtonVisible: false,
                        titleCentered: true,
                        titleTextStyle: TextStyle(
                            color: kWhite, fontWeight: FontWeight.bold)),
                    calendarFormat: CalendarFormat.month,
                    daysOfWeekStyle: DaysOfWeekStyle(
                      weekdayStyle: TextStyle(
                          color: kWhite,
                          fontSize: 13,
                          fontWeight: FontWeight.bold),
                      weekendStyle: TextStyle(
                          color: kWhite,
                          fontSize: 13,
                          fontWeight: FontWeight.bold),
                    ),
                    calendarStyle: CalendarStyle(
                        selectedDecoration:
                            BoxDecoration(color: kRed, shape: BoxShape.circle),
                        outsideDaysVisible: false,
                        defaultTextStyle: TextStyle(
                            color: kWhite,
                            fontSize: 13,
                            fontWeight: FontWeight.bold),
                        holidayTextStyle: TextStyle(
                            color: kWhite,
                            fontSize: 13,
                            fontWeight: FontWeight.bold),
                        todayTextStyle: TextStyle(
                            color: kWhite,
                            fontSize: 13,
                            fontWeight: FontWeight.bold),
                        weekendTextStyle: TextStyle(
                            color: kWhite,
                            fontSize: 13,
                            fontWeight: FontWeight.bold),
                        todayDecoration: BoxDecoration(
                          color: kTrans,
                          border: Border.all(
                            color: kWhite,
                          ),
                          shape: BoxShape.circle,
                        )),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: size.width,
                  padding: const EdgeInsets.all(20.0),
                  child: StreamBuilder<dynamic>(
                      stream: firestore
                          .collection("lifestyleDiary")
                          .doc(authController.getCurrentUser())
                          .collection("dates")
                          .doc(selectedDay.value.toString())
                          .snapshots(),
                      builder: (context, snapshot) {
                        return snapshot.hasData
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  customRow(
                                      'Sleep',
                                      snapshot.data.exists
                                          ? snapshot.data['sleep']
                                          : null,
                                      sleepController),
                                  customRow(
                                      'Steps',
                                      snapshot.data.exists
                                          ? snapshot.data['steps']
                                          : null,
                                      stepsController),
                                  customRow(
                                      'Mood',
                                      snapshot.data.exists
                                          ? snapshot.data['mood']
                                          : null,
                                      moodController),
                                  customRow(
                                      'Period',
                                      snapshot.data.exists
                                          ? snapshot.data['period']
                                          : null,
                                      periodController),
                                ],
                              )
                            : Center(child: SpinKitSpinningLines(color: kRed));
                      }),
                ),
              ],
            ),
          );
        }),
      ),
    ));
  }

  Widget customRow(
      String title, String? value, TextEditingController controller) {
    if (!isEditing.value) {
      controller.text = value ?? '';
    }
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "$title:",
          style: kBodyText.copyWith(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          width: 10,
        ),
        Obx(() {
          return Flexible(
            child: TextField(
              controller: controller,
              enabled: isEditing.value,
              cursorColor: kWhite,
              maxLines: 1,
              style: kBodyText.copyWith(color: kWhite, fontSize: 16),
              textInputAction: TextInputAction.newline,
              keyboardType: TextInputType.multiline,
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.zero,
                  filled: false,
                  hintText: "Add $title",
                  hintStyle:
                      kBodyText.copyWith(color: kLightGrey, fontSize: 14),
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none),
            ),
          );
        }),
      ],
    );
  }
}
