import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:fitness_app/constants/controllers.dart';
import 'package:fitness_app/constants/firebase_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:uuid/uuid.dart';

import '../../constants/constants.dart';

class PictureDiaryScreen extends StatefulWidget {
  const PictureDiaryScreen({super.key});

  @override
  State<PictureDiaryScreen> createState() => _PictureDiaryScreenState();
}

class _PictureDiaryScreenState extends State<PictureDiaryScreen> {
  var selectedDay = DateUtils.dateOnly(DateTime.now()).obs;

  var selectedImageId = ''.obs;

  File? image;
  final picker = ImagePicker();

  Future pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        image = File(pickedFile.path);
      });
      uploadImageToFirebase();
    }
  }

  Future captureImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      setState(() {
        image = File(pickedFile.path);
      });

      uploadImageToFirebase();
    }
  }

  Future uploadImageToFirebase() async {
    Get.dialog(
      SpinKitSpinningLines(color: kRed),
      barrierDismissible: false,
    );

    String fileName = const Uuid().v4();
    Reference firebaseStorageRef =
        FirebaseStorage.instance.ref().child('pictureDiary/$fileName');
    UploadTask uploadTask = firebaseStorageRef.putFile(image!);
    try {
      uploadTask.whenComplete(() async {
        String url = await firebaseStorageRef.getDownloadURL();
        firestore
            .collection("pictureDiary")
            .doc(authController.getCurrentUser())
            .collection("images")
            .doc(fileName)
            .set({
          "image": url,
          "id": fileName,
          "date": DateTime(selectedDay.value.year, selectedDay.value.month,
                  selectedDay.value.day)
              .toString(),
          "timestamp": DateTime.now(),
        }).then((value) {
          Get.back();
          Get.rawSnackbar(
            messageText: Text(
              "Your picture diary is updated successfully",
              style: kBodyText.copyWith(color: kBlack),
            ),
            backgroundColor: kWhite,
            snackPosition: SnackPosition.TOP,
            borderRadius: 10,
            margin: const EdgeInsets.all(10),
          );
        });
      });
    } on FirebaseException catch (error) {
      Get.rawSnackbar(
        messageText: Text(
          error.toString(),
          style: kBodyText.copyWith(color: kBlack),
        ),
        backgroundColor: kWhite,
        snackPosition: SnackPosition.TOP,
        borderRadius: 10,
        margin: const EdgeInsets.all(10),
      );
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
          "Picture Diary",
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: size.height * 0.3,
              width: size.width,
              child: StreamBuilder<dynamic>(
                  stream: firestore
                      .collection("pictureDiary")
                      .doc(authController.getCurrentUser())
                      .collection("images")
                      .where("date",
                          isEqualTo: DateTime(
                                  selectedDay.value.year,
                                  selectedDay.value.month,
                                  selectedDay.value.day)
                              .toString())
                      .snapshots(),
                  builder: (context, snapshot) {
                    return snapshot.hasData
                        ? snapshot.data.docs.length > 0
                            ? ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: snapshot.data.docs.length,
                                itemBuilder: (context, index) =>
                                    GestureDetector(
                                  onTap: () {
                                    selectedImageId.value =
                                        snapshot.data.docs[index]["id"];
                                  },
                                  child: Container(
                                    margin: EdgeInsets.only(
                                        bottom: 15,
                                        left: 20,
                                        right: (snapshot.data.docs.length - 1 ==
                                                index)
                                            ? 20
                                            : 0),
                                    height: size.height * 0.3,
                                    width: size.width * 0.6,
                                    child: CachedNetworkImage(
                                      imageUrl: snapshot.data.docs[index]
                                          ["image"],
                                      imageBuilder: (context, imageProvider) =>
                                          Obx(() {
                                        return Container(
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: (selectedImageId
                                                              .value ==
                                                          snapshot.data
                                                                  .docs[index]
                                                              ["id"])
                                                      ? kRed
                                                      : kTrans,
                                                  width: 3),
                                              image: DecorationImage(
                                                image: imageProvider,
                                                fit: BoxFit.cover,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(12)),
                                        );
                                      }),
                                      errorWidget: (context, url, error) =>
                                          Icon(
                                        Icons.error,
                                        color: kWhite,
                                      ),
                                      placeholder: (context, url) =>
                                          SpinKitSpinningLines(color: kRed),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              )
                            : Center(
                                child: Text(
                                  "No images uploaded",
                                  style: kBodyText.copyWith(color: kLightGrey),
                                ),
                              )
                        : Center(child: SpinKitSpinningLines(color: kRed));
                  }),
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () => captureImage(),
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    height: size.width * 0.1,
                    width: size.width * 0.1,
                    decoration: BoxDecoration(
                        color: kWhite, borderRadius: BorderRadius.circular(12)),
                    child: Icon(
                      Icons.camera_alt,
                      color: kBlack,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => pickImage(),
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    height: size.width * 0.1,
                    width: size.width * 0.1,
                    decoration: BoxDecoration(
                        color: kWhite, borderRadius: BorderRadius.circular(12)),
                    child: Icon(
                      Icons.collections,
                      color: kBlack,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    if (selectedImageId.value != '') {
                      Get.dialog(
                        SpinKitSpinningLines(color: kRed),
                        barrierDismissible: false,
                      );
                      firestore
                          .collection("pictureDiary")
                          .doc(authController.getCurrentUser())
                          .collection("images")
                          .doc(selectedImageId.value)
                          .delete()
                          .then((value) {
                        FirebaseStorage.instance
                            .ref("pictureDiary/${selectedImageId.value}")
                            .delete()
                            .then((value) {
                          Get.back();
                          selectedImageId.value = '';
                          Get.rawSnackbar(
                            messageText: Text(
                              "Your picture diary is updated successfully",
                              style: kBodyText.copyWith(color: kBlack),
                            ),
                            backgroundColor: kWhite,
                            snackPosition: SnackPosition.TOP,
                            borderRadius: 10,
                            margin: const EdgeInsets.all(10),
                          );
                        });
                      });
                    } else {
                      Get.rawSnackbar(
                        messageText: Text(
                          "Please choose image to delete",
                          style: kBodyText.copyWith(color: kBlack),
                        ),
                        backgroundColor: kWhite,
                        snackPosition: SnackPosition.TOP,
                        borderRadius: 10,
                        margin: const EdgeInsets.all(10),
                      );
                    }
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    height: size.width * 0.1,
                    width: size.width * 0.1,
                    decoration: BoxDecoration(
                        color: kWhite, borderRadius: BorderRadius.circular(12)),
                    child: Icon(
                      Icons.delete,
                      color: kBlack,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Obx(() {
              return Container(
                  height: size.height * 0.48,
                  decoration: BoxDecoration(
                      color: kLightGrey,
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15))),
                  child: Center(
                    child: Container(
                      width: size.width * 0.85,
                      height: size.width * 0.75,
                      decoration: BoxDecoration(
                          color: kWhite,
                          borderRadius: BorderRadius.circular(15)),
                      child: TableCalendar(
                        focusedDay: selectedDay.value,
                        firstDay: DateTime.utc(2010, 01, 01),
                        lastDay: DateTime.utc(2050, 12, 30),
                        rowHeight: 35,
                        selectedDayPredicate: (day) {
                          return isSameDay(selectedDay.value, day);
                        },
                        onDaySelected: (selectedDate, focusedDay) {
                          if (!isSameDay(selectedDay.value, selectedDate)) {
                            selectedDay.value =
                                DateUtils.dateOnly(selectedDate);
                            setState(() {});
                          }
                        },
                        headerStyle: HeaderStyle(
                            leftChevronIcon:
                                Icon(Icons.chevron_left, color: kBlack),
                            rightChevronIcon:
                                Icon(Icons.chevron_right, color: kBlack),
                            formatButtonVisible: false,
                            titleCentered: true,
                            titleTextStyle: TextStyle(
                                color: kBlack, fontWeight: FontWeight.bold)),
                        calendarFormat: CalendarFormat.month,
                        daysOfWeekStyle: DaysOfWeekStyle(
                          weekdayStyle: TextStyle(
                            color: kBlack,
                            fontSize: 12,
                          ),
                          weekendStyle: TextStyle(
                            color: kBlack,
                            fontSize: 12,
                          ),
                        ),
                        calendarStyle: CalendarStyle(
                            selectedTextStyle: TextStyle(
                                color: kWhite,
                                fontSize: 12,
                                fontWeight: FontWeight.bold),
                            selectedDecoration: BoxDecoration(
                                color: kRed, shape: BoxShape.circle),
                            outsideDaysVisible: false,
                            defaultTextStyle: TextStyle(
                                color: kBlack,
                                fontSize: 12,
                                fontWeight: FontWeight.bold),
                            holidayTextStyle: TextStyle(
                                color: kBlack,
                                fontSize: 12,
                                fontWeight: FontWeight.bold),
                            todayTextStyle: TextStyle(
                                color: kBlack,
                                fontSize: 12,
                                fontWeight: FontWeight.bold),
                            weekendTextStyle: TextStyle(
                                color: kBlack,
                                fontSize: 12,
                                fontWeight: FontWeight.bold),
                            todayDecoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: kBlack))),
                      ),
                    ),
                  ));
            }),
          ],
        ),
      ),
    ));
  }
}
