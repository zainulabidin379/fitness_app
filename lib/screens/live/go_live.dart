import 'package:fitness_app/constants/constants.dart';
import 'package:fitness_app/constants/firebase_constants.dart';
import 'package:fitness_app/controllers/bottom_nav.dart';
import 'package:fitness_app/screens/live/live.dart';
import 'package:fitness_app/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

class GoLive extends StatefulWidget {
  const GoLive({super.key});

  @override
  State<GoLive> createState() => _GoLiveState();
}

class _GoLiveState extends State<GoLive> {
  final BottomNavController _navController = Get.put(BottomNavController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBlack,
      body: Column(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: GestureDetector(
                onTap: () {
                  _navController.navigateTo(0);
                },
                child: SizedBox(
                  height: 55,
                  child: Image.asset("assets/images/logo.png"),
                ),
              ),
            ),
          ),
          Center(
            child: Text(
              "Live",
              style:
                  kBodyText.copyWith(fontWeight: FontWeight.bold, fontSize: 24),
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                StreamBuilder<dynamic>(
                    stream: firestore
                        .collection("live")
                        .doc("789654123")
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        if (snapshot.data["isLive"]) {
                          return Center(
                            child: CustomButton(
                                title: "Join Live",
                                onTap: () {
                                  Get.to(() => const LiveScreen());
                                }),
                          );
                        } else {
                          return Padding(
                            padding: const EdgeInsets.all(20),
                            child: Center(
                              child: Text(
                                "No host is live at the moment",
                                textAlign: TextAlign.center,
                                style: kBodyText,
                              ),
                            ),
                          );
                        }
                      } else {
                        return Center(child: SpinKitSpinningLines(color: kRed));
                      }
                    }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
