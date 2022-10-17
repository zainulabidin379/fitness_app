import 'package:fitness_app/screens/questions/question1.dart';
import 'package:fitness_app/utils/constants.dart';
import 'package:fitness_app/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: kBlack,
        appBar: AppBar(
          backgroundColor: kBlack,
          title: Text(
            "PAYMENT",
            style:
                kBodyText.copyWith(fontWeight: FontWeight.bold, fontSize: 20),
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                child: Text(
                  "Payment Method",
                  style: kBodyText.copyWith(
                      fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    GestureDetector(
                      //onTap: onTap,
                      child: Container(
                        margin: const EdgeInsets.only(
                            bottom: 15, right: 15, left: 20),
                        width: 65,
                        height: 120,
                        decoration: BoxDecoration(
                            color: kDark,
                            borderRadius: BorderRadius.circular(11)),
                        child: Icon(
                          Icons.add,
                          color: kWhite,
                        ),
                      ),
                    ),
                    GestureDetector(
                      //onTap: onTap,
                      child: Container(
                          margin: const EdgeInsets.only(bottom: 15, right: 15),
                          padding: const EdgeInsets.all(15),
                          width: 140,
                          height: 120,
                          decoration: BoxDecoration(
                              image: const DecorationImage(
                                  image: AssetImage("assets/images/visaBG.jpg"),
                                  fit: BoxFit.cover),
                              borderRadius: BorderRadius.circular(11)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Align(
                                alignment: Alignment.topRight,
                                child: Image.asset(
                                  "assets/images/visa.png",
                                  color: kWhite,
                                  height: 25,
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: List.generate(
                                        4,
                                        (index) => Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 2),
                                              child: Icon(
                                                Icons.circle,
                                                color: kWhite,
                                                size: 8,
                                              ),
                                            )),
                                  ),
                                  Text(
                                    "1234",
                                    style: kBodyText.copyWith(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Container(
                                    width: 18,
                                    height: 18,
                                    decoration: BoxDecoration(
                                        color: kWhite.withOpacity(0.8),
                                        borderRadius: BorderRadius.circular(5)),
                                    child: Center(
                                      child: Icon(
                                        Icons.check,
                                        color: kGreen,
                                        size: 16,
                                      ),
                                    ),
                                  )
                                ],
                              )
                            ],
                          )),
                    ),
                    GestureDetector(
                      //onTap: onTap,
                      child: Container(
                          margin: const EdgeInsets.only(bottom: 15, right: 15),
                          padding: const EdgeInsets.all(15),
                          width: 140,
                          height: 120,
                          decoration: BoxDecoration(
                              image: const DecorationImage(
                                  image: AssetImage(
                                      "assets/images/mastercardBG.jpg"),
                                  fit: BoxFit.cover),
                              borderRadius: BorderRadius.circular(11)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Align(
                                alignment: Alignment.topRight,
                                child: Image.asset(
                                  "assets/images/mastercard.png",
                                  color: kWhite,
                                  height: 25,
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: List.generate(
                                        4,
                                        (index) => Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 2),
                                              child: Icon(
                                                Icons.circle,
                                                color: kWhite,
                                                size: 8,
                                              ),
                                            )),
                                  ),
                                  Text(
                                    "6789",
                                    style: kBodyText.copyWith(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Container(
                                    width: 18,
                                    height: 18,
                                    decoration: BoxDecoration(
                                        color: kWhite.withOpacity(0.8),
                                        borderRadius: BorderRadius.circular(5)),
                                  )
                                ],
                              )
                            ],
                          )),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15, left: 20, bottom: 5),
                child: Text(
                  "Order Details",
                  style: kBodyText.copyWith(
                      fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
              //Divider
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Divider(
                  thickness: 1.5,
                  color: kGrey,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, bottom: 8, top: 10),
                child: Text(
                  "Trainer",
                  style: kBodyText.copyWith(fontSize: 11),
                ),
              ),
              Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 20, right: 10),
                    height: 40,
                    width: 40,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage("assets/images/img5.jpg"),
                            fit: BoxFit.cover)),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Emily Kevin",
                        style: kBodyText.copyWith(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      Text(
                        "High Intensity Training",
                        style: kBodyText.copyWith(fontSize: 11, color: kGreen),
                      ),
                    ],
                  )
                ],
              ),
              //Divider
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
                child: Divider(
                  thickness: 1.5,
                  color: kGrey,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 20, bottom: 10, top: 10, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Date",
                      style: kBodyText.copyWith(fontSize: 11),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Text(
                      "20 October 2021 - Wednesday",
                      style: kBodyText.copyWith(
                          fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 20, bottom: 10, top: 10, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Time",
                      style: kBodyText.copyWith(fontSize: 11),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Text(
                      "09:30 AM",
                      style: kBodyText.copyWith(
                          fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                  ],
                ),
              ),
              //Divider
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Divider(
                  thickness: 1.5,
                  color: kGrey,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 20, bottom: 10, top: 10, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Estimated Cost",
                      style: kBodyText.copyWith(fontSize: 11),
                    ),
                    Text(
                      "\u{00A3} 75.99",
                      style: kBodyText.copyWith(
                          fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                  ],
                ),
              ),
              //Divider
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Divider(
                  thickness: 1.5,
                  color: kGrey,
                ),
              ),
              SizedBox(
                height: size.height * 0.07,
              ),
              CustomButton(
                title: "Confirm",
                onTap: () => Get.to(() => const Question1Screen()),
              )
            ],
          ),
        ),
      ),
    );
  }
}
