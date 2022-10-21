import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/constants.dart';

class PersonalisedNutritionConfirmationScreen extends StatelessWidget {
  const PersonalisedNutritionConfirmationScreen({super.key});

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
        body: Container(
          // height: 200,
          //color: Colors.red,
          child: Center(
              child: Container(
            height: 250,
            width: 250,
            decoration: BoxDecoration(
                color: kWhite, borderRadius: BorderRadius.circular(125)),
            child: Center(
              child: Text(
                textAlign: TextAlign.center,
                'An email has been sent\nto the Survival Team\nwho will be in touch\nabout your personalised\nnutrition plan within 48\nhours!',
                style: kBodyText.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
            ),
          )),
        ),
      ),
    );
  }
}
