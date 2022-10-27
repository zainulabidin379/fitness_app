import 'package:fitness_app/screens/welcome_screen.dart';
import 'package:fitness_app/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';

import '../widgets/custom_button.dart';

class VideoScreen extends StatefulWidget {
  const VideoScreen({super.key});

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  @override
  void initState() {
    FlutterNativeSplash.remove();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: kBlack,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(),
            SizedBox(
              height: 55,
              child: Image.asset("assets/images/logo.png"),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: size.height * 0.115),
              child: CustomButton(
                title: "Skip",
                onTap: () => Get.to(() => const WelcomeScreen()),
              ),
            )
          ],
        ),
      ),
    );
  }
}
