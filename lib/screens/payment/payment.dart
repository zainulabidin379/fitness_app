import 'package:fitness_app/constants/firebase_constants.dart';
import 'package:fitness_app/screens/questions/question1.dart';
import 'package:fitness_app/constants/constants.dart';
import 'package:fitness_app/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';
import 'package:get/get.dart';

class PaymentScreen extends StatefulWidget {
  final String subscription;
  final double amount;
  const PaymentScreen(
      {super.key, required this.subscription, required this.amount});

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
              StreamBuilder<dynamic>(
                  stream: firestore.collection("trainer").snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Row(
                        children: [
                          Container(
                              margin:
                                  const EdgeInsets.only(left: 20, right: 10),
                              height: 40,
                              width: 40,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                              child: Image.network(
                                snapshot.data.docs[0]["image"],
                                fit: BoxFit.cover,
                                loadingBuilder: (BuildContext context,
                                    Widget child,
                                    ImageChunkEvent? loadingProgress) {
                                  if (loadingProgress == null) {
                                    return child;
                                  }
                                  return Center(
                                    child: CircularProgressIndicator(
                                      color: kRed,
                                      strokeWidth: 3,
                                      value:
                                          loadingProgress.expectedTotalBytes !=
                                                  null
                                              ? loadingProgress
                                                      .cumulativeBytesLoaded /
                                                  loadingProgress
                                                      .expectedTotalBytes!
                                              : null,
                                    ),
                                  );
                                },
                              )),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                snapshot.data.docs[0]["name"],
                                style: kBodyText.copyWith(
                                    fontWeight: FontWeight.bold, fontSize: 15),
                              ),
                              const SizedBox(
                                height: 2,
                              ),
                              Text(
                                snapshot.data.docs[0]["tagline"],
                                style: kBodyText.copyWith(
                                    fontSize: 11, color: kGreen),
                              ),
                            ],
                          )
                        ],
                      );
                    } else {
                      return Center(
                          child: SpinKitSpinningLines(
                        color: kRed,
                      ));
                    }
                  }),
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
                      DateFormat('dd MMMM yyyy - EEEE').format(DateTime.now()),
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
                      DateFormat('hh:mm a').format(DateTime.now()),
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
                      (widget.subscription == "trial")
                          ? "Cost after 7 day trial"
                          : "Estimated Cost",
                      style: kBodyText.copyWith(fontSize: 11),
                    ),
                    Text(
                      "\u{00A3} ${widget.amount}",
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
                title: (widget.subscription == "trial")
                    ? "Start 7 Day Trial"
                    : "Confirm",
                onTap: () => Get.to(() => const Question1Screen()),
              )
            ],
          ),
        ),
      ),
    );
  }
}
