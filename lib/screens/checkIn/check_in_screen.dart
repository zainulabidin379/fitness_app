import 'package:fitness_app/utils/constants.dart';
import 'package:fitness_app/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'check_in_form_screen.dart';

class CheckInScreen extends StatelessWidget {
  const CheckInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: kBlack,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Center(
              child: SizedBox(
                height: 55,
                child: Image.asset("assets/images/logo.png"),
              ),
            ),
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
            SizedBox(
              height: 400,
              child: ListView.builder(
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
