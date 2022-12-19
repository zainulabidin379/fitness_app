import 'package:fitness_app/constants/constants.dart';
import 'package:fitness_app/constants/controllers.dart';
import 'package:fitness_app/constants/firebase_constants.dart';
import 'package:fitness_app/screens/checkIn/veiw_check_in.dart';
import 'package:fitness_app/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';

import 'check_in_form_screen.dart';

class CheckInScreen extends StatelessWidget {
  const CheckInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String checkIn(String number) {
      switch (number[number.length - 1]) {
        case "1":
          {
            return "${number}st Check In";
          }
        case "2":
          {
            return "${number}nd Check In";
          }
        case "3":
          {
            return "${number}rd Check In";
          }
        default:
          {
            return "${number}th Check In";
          }
      }
    }

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
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Check Ins",
                    style: kBodyText.copyWith(
                        fontWeight: FontWeight.bold, fontSize: 24),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  StreamBuilder<dynamic>(
                      stream: firestore
                          .collection("checkIns")
                          .where("uid",
                              isEqualTo: authController.getCurrentUser())
                          .snapshots(),
                      builder: (context, snapshot) {
                        return snapshot.hasData
                            ? Column(
                                children: List.generate(
                                    snapshot.data.docs.length,
                                    (index) => GestureDetector(
                                          onTap: () => Get.to(() => ViewCheckIn(
                                              title: checkIn(snapshot
                                                  .data.docs[index]["checkIn"]
                                                  .toString()),
                                              answers: snapshot.data.docs[index]
                                                  ["answers"])),
                                          child: Container(
                                            margin: const EdgeInsets.symmetric(
                                                horizontal: 20, vertical: 5),
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 10),
                                            color: kTrans,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  checkIn(snapshot.data
                                                      .docs[index]["checkIn"]
                                                      .toString()),
                                                  style: kBodyText.copyWith(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 16),
                                                ),
                                                Column(
                                                  children: [
                                                    Text(
                                                      DateFormat('EEEE').format(
                                                          snapshot
                                                              .data
                                                              .docs[index]
                                                                  ["timestamp"]
                                                              .toDate()),
                                                      style: kBodyText.copyWith(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 12),
                                                    ),
                                                    const SizedBox(
                                                      height: 3,
                                                    ),
                                                    Text(
                                                      DateFormat(
                                                              'dd-MMMM-yyyy, hh:mm a')
                                                          .format(snapshot
                                                              .data
                                                              .docs[index]
                                                                  ["timestamp"]
                                                              .toDate()),
                                                      style: kBodyText.copyWith(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 10),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        )),
                              )
                            : Center(child: SpinKitSpinningLines(color: kRed));
                      }),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
          ),
          CustomButton(
            title: 'Check In',
            onTap: () => Get.to(() => const CheckInFormScreen()),
          )
        ],
      ),
    ));
  }
}
