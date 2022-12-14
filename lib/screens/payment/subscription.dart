import 'package:fitness_app/constants/controllers.dart';
import 'package:fitness_app/screens/authentication/sign_in_screen.dart';
import 'package:fitness_app/screens/coupon/coupon_code_screen.dart';
import 'package:fitness_app/constants/constants.dart';
import 'package:fitness_app/screens/payment/payment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';

import '../../widgets/custom_button.dart';

class SubscriptionScreen extends StatefulWidget {
  final bool? loggedIn;
  const SubscriptionScreen({super.key, this.loggedIn});

  @override
  State<SubscriptionScreen> createState() => _SubscriptionScreenState();
}

class _SubscriptionScreenState extends State<SubscriptionScreen> {
  var selectedSubscription = "".obs;
  var subscriptionAmount = 0.0.obs;
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
        appBar: AppBar(
          backgroundColor: kBlack,
          leading: widget.loggedIn ?? false
              ? const SizedBox()
              : GestureDetector(
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
            child: Obx(() => Column(
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
                      onTap: () {
                        selectedSubscription.value = "trial";
                        subscriptionAmount.value = 9.99;
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 15),
                        width: size.width,
                        decoration: BoxDecoration(
                            color: (selectedSubscription.value == 'trial')
                                ? kWhite
                                : kLightGrey,
                            borderRadius: BorderRadius.circular(20)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 40),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "7 DAYS TRIAL",
                                style: kBodyText.copyWith(
                                    color:
                                        (selectedSubscription.value == 'trial')
                                            ? kBlack
                                            : kWhite,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                              Text(
                                "After that you will be automatically\ncharged \u{00A3} 9.99/month",
                                style: kBodyText.copyWith(
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                    color:
                                        (selectedSubscription.value == 'trial')
                                            ? kBlack
                                            : kWhite),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        selectedSubscription.value = "monthly";
                        subscriptionAmount.value = 9.99;
                      },
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 15),
                        width: size.width,
                        height: 80,
                        decoration: BoxDecoration(
                            color: (selectedSubscription.value == 'monthly')
                                ? kWhite
                                : kLightGrey,
                            borderRadius: BorderRadius.circular(11)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "MONTHLY",
                                style: kBodyText.copyWith(
                                    color: (selectedSubscription.value ==
                                            'monthly')
                                        ? kBlack
                                        : kWhite,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                              Text(
                                "\u{00A3} 9.99",
                                style: kBodyText.copyWith(
                                    color: (selectedSubscription.value ==
                                            'monthly')
                                        ? kBlack
                                        : kWhite,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        selectedSubscription.value = "3monthly";
                        subscriptionAmount.value = 24.99;
                      },
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 30),
                        width: size.width,
                        height: 80,
                        decoration: BoxDecoration(
                            color: (selectedSubscription.value == '3monthly')
                                ? kWhite
                                : kLightGrey,
                            borderRadius: BorderRadius.circular(11)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "3 MONTHLY",
                                style: kBodyText.copyWith(
                                    color: (selectedSubscription.value ==
                                            '3monthly')
                                        ? kBlack
                                        : kWhite,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "\u{00A3} 24.99",
                                    style: kBodyText.copyWith(
                                        color: (selectedSubscription.value ==
                                                '3monthly')
                                            ? kBlack
                                            : kWhite,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "Save \u{00A3} 4.98",
                                    style: kBodyText.copyWith(
                                        color: (selectedSubscription.value ==
                                                '3monthly')
                                            ? kBlack
                                            : kWhite,
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
                        "By clicking 'Next' I confirm I have read and accept and agree to the terms and conditions and privacy policy.",
                        textAlign: TextAlign.start,
                        style: kBodyText.copyWith(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomButton(
                      title: "Redeem Code",
                      onTap: () => Get.to(() => const CouponCodeScreen()),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                        onTap: () {
                          //  Get.to(() => const BottomNav());
                          if (selectedSubscription.value != '') {
                            if (authController.isLoggedIn.value) {
                              Get.to(() => PaymentScreen(
                                    subscription: selectedSubscription.value,
                                    amount: subscriptionAmount.value,
                                  ));
                            } else {
                              Get.to(() => const SignInScreen());
                              Get.rawSnackbar(
                                messageText: Text(
                                  "Please Login to continue!",
                                  style: kBodyText.copyWith(color: kBlack),
                                ),
                                backgroundColor: kWhite,
                                snackPosition: SnackPosition.TOP,
                                borderRadius: 10,
                                margin: const EdgeInsets.all(10),
                              );
                            }
                          } else {
                            Get.rawSnackbar(
                              messageText: Text(
                                "Please choose a subscription to continue",
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
                          margin: const EdgeInsets.only(
                              bottom: 10, right: 10, top: 15),
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
                )),
          ),
        ),
      ),
    );
  }
}
