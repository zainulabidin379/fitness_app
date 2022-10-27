import 'package:fitness_app/constants/constants.dart';
import 'package:fitness_app/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'check_in_form_screen.dart';

class CheckInScreen extends StatelessWidget {
  CheckInScreen({super.key});

  final ScrollController scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Text(
              "Check Ins",
              style:
                  kBodyText.copyWith(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              height: 400,
              child: Scrollbar(
                controller: scrollController,
                thumbVisibility: true,
                trackVisibility: true,
                child: ListView.builder(
                  controller: scrollController,
                  itemCount: 8,
                  itemBuilder: (context, index) => ListTile(
                    leading: Text(
                      '1st Check In',
                      style: kBodyText.copyWith(
                          fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    title: Padding(
                      padding: const EdgeInsets.only(left: 70.0),
                      child: Center(
                        child: Text(
                          'Wednesday',
                          style: kBodyText.copyWith(
                              fontWeight: FontWeight.bold, fontSize: 14),
                        ),
                      ),
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(left: 70.0),
                      child: Center(
                        child: Text(
                          '24-Feb-2022, 11:48pm',
                          style: kBodyText.copyWith(
                              fontWeight: FontWeight.bold, fontSize: 14),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            CustomButton(
              title: 'Check In',
              onTap: () => Get.to(() => const CheckInFormScreen()),
            )
          ],
        ),
      ),
    ));
  }
}
