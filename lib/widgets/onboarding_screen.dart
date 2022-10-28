import 'package:fitness_app/constants/constants.dart';
import 'package:fitness_app/screens/subscription.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingPageWidget extends StatelessWidget {
  const OnboardingPageWidget(
      {Key? key,
      required this.image,
      required this.title,
      required this.description,
      required this.pageNo})
      : super(key: key);
  final String image;
  final String title;
  final String description;
  final int pageNo;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Stack(
        children: [
          Column(
            children: [
              Image.asset(
                "assets/images/$image.jpg",
                fit: BoxFit.cover,
                width: size.width,
                height: size.height * 0.55,
              ),
              SizedBox(
                height: size.height * 0.4,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        SizedBox(height: size.height * 0.03),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            title,
                            textAlign: TextAlign.center,
                            style: kButtonText.copyWith(
                                fontSize: 22, color: kWhite),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: size.height * 0.02),
                          child: Text(
                            description,
                            textAlign: TextAlign.center,
                            style: kBodyText.copyWith(fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          height: size.height * 0.02,
                          margin: const EdgeInsets.only(bottom: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(
                                5,
                                (index) => Container(
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 3),
                                      height: 8,
                                      width: 8,
                                      decoration: BoxDecoration(
                                          color: (index + 1 == pageNo)
                                              ? kWhite
                                              : kLightGrey,
                                          shape: BoxShape.circle),
                                    )),
                          ),
                        ),
                        (pageNo == 5)
                            ? Align(
                                alignment: Alignment.centerRight,
                                child: GestureDetector(
                                  onTap: () =>
                                      Get.to(() => const SubscriptionScreen()),
                                  child: Container(
                                    margin: EdgeInsets.only(
                                        bottom: size.height * 0.01, right: 20),
                                    height: 50,
                                    width: 192,
                                    decoration: BoxDecoration(
                                        color: kWhite,
                                        borderRadius:
                                            BorderRadius.circular(48)),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Subscription",
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
                            : const SizedBox(),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            top: 20,
            left: 17,
            child: GestureDetector(
              onTap: () => Get.back(),
              child: Container(
                padding: const EdgeInsets.only(right: 4),
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
        ],
      ),
    );
  }
}
