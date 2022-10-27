import 'package:fitness_app/constants/constants.dart';
import 'package:fitness_app/constants/firebase_constants.dart';
import 'package:fitness_app/controllers/auth_controller.dart';
import 'package:fitness_app/screens/bottom_nav.dart';
import 'package:fitness_app/screens/questions/question1.dart';
import 'package:fitness_app/screens/subscription.dart';
import 'package:fitness_app/screens/video_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

class WrapperScreen extends StatelessWidget {
  WrapperScreen({Key? key}) : super(key: key);
  final AuthController authController = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (authController.isLoggedIn.value == true) {
        return StreamBuilder<dynamic>(
            stream: firestore
                .collection("users")
                .doc(AuthController.authInstance.getCurrentUser())
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                if (snapshot.data['subscription'] == null &&
                    snapshot.data['questionsAnswered'] == false) {
                  return const SubscriptionScreen(
                    loggedIn: true,
                  );
                } else if (snapshot.data['subscription'] != null &&
                    snapshot.data['questionsAnswered'] == false) {
                  return const Question1Screen();
                } else {
                  return const BottomNav();
                }
              } else {
                return Center(
                  child: SpinKitSpinningLines(color: kRed),
                );
              }
            });
      } else {
        return const VideoScreen();
      }
    });
  }
}
