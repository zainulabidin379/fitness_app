import 'package:fitness_app/screens/payment.dart';
import 'package:fitness_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/custom_button.dart';

class SubscriptionScreen extends StatefulWidget {
  const SubscriptionScreen({super.key});

  @override
  State<SubscriptionScreen> createState() => _SubscriptionScreenState();
}

class _SubscriptionScreenState extends State<SubscriptionScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: kBlack,
        appBar: AppBar(
          backgroundColor: kBlack,
          leading: GestureDetector(
            onTap: () => Get.back(),
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Icon(
                Icons.arrow_back_ios_new,
                color: kDark,
                size: 25,
              ),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: Text(
                    "Please choose a subscription",
                    style: kBodyText.copyWith(
                        fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
                Text(
                  "Choose one of the following",
                  style: kBodyText.copyWith(fontSize: 16),
                ),
                GestureDetector(
                  //onTap: onTap,
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 15),
                    width: size.width,
                    decoration: BoxDecoration(
                        color: kWhite, borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 40),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "7 DAYS TRIAL",
                            style: kBodyText.copyWith(
                                color: kBlack,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                          Text(
                            "After that you will be automatically\ncharged \u{00A3} 9.99/month",
                            style: kBodyText.copyWith(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: kBlack),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  //onTap: onTap,
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 15),
                    width: size.width,
                    height: 80,
                    decoration: BoxDecoration(
                        color: kWhite, borderRadius: BorderRadius.circular(11)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "MONTHLY",
                            style: kBodyText.copyWith(
                                color: kBlack,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                          Text(
                            "\u{00A3} 9.99",
                            style: kBodyText.copyWith(
                                color: kBlack,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  //onTap: onTap,
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 30),
                    width: size.width,
                    height: 80,
                    decoration: BoxDecoration(
                        color: kWhite, borderRadius: BorderRadius.circular(11)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "3 MONTHLY",
                            style: kBodyText.copyWith(
                                color: kBlack,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "\u{00A3} 24.99",
                                style: kBodyText.copyWith(
                                    color: kBlack,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                "Save \u{00A3} 4.98",
                                style: kBodyText.copyWith(
                                    color: kBlack,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    "By clicking 'next step' I confirm I have read and accept and agree to the terms and conditions and privacy policy.",
                    textAlign: TextAlign.start,
                    style: kBodyText.copyWith(
                        fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomButton(title: "Redeem Code", onTap: () {}),
                Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () => Get.to(() => const PaymentScreen()),
                    child: Container(
                      margin:
                          const EdgeInsets.only(bottom: 10, right: 10, top: 15),
                      height: 50,
                      width: 120,
                      decoration: BoxDecoration(
                          color: kWhite,
                          borderRadius: BorderRadius.circular(48)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Next",
                            style: kButtonText,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Icon(
                            Icons.navigate_next,
                            color: kBlack,
                            size: 25,
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
