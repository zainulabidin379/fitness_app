import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:fitness_app/constants/controllers.dart';
import 'package:http/http.dart' as http;
import 'package:fitness_app/constants/firebase_constants.dart';
import 'package:fitness_app/screens/questions/question1.dart';
import 'package:fitness_app/constants/constants.dart';
import 'package:fitness_app/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
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
  Map<String, dynamic>? paymentIntentData;
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
                              child: CachedNetworkImage(
                                imageUrl: snapshot.data.docs[0]["image"],
                                imageBuilder: (context, imageProvider) =>
                                    Container(
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: imageProvider,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                errorWidget: (context, url, error) => Icon(
                                  Icons.error,
                                  color: kWhite,
                                ),
                                placeholder: (context, url) =>
                                    SpinKitSpinningLines(color: kRed),
                                fit: BoxFit.cover,
                              )),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                snapshot.data.docs[0]["name"],
                                style: kBodyText.copyWith(
                                    fontWeight: FontWeight.bold, fontSize: 17),
                              ),
                              const SizedBox(
                                height: 2,
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
                onTap: () {
                  if (widget.subscription != "trial") {
                    makePayment(widget.amount.toString());
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> makePayment(String amount) async {
    try {
      paymentIntentData = await createPaymentIntent(amount, 'GBP');
      await Stripe.instance
          .initPaymentSheet(
              paymentSheetParameters: SetupPaymentSheetParameters(
                  paymentIntentClientSecret:
                      paymentIntentData!['client_secret'],
                  googlePay: const PaymentSheetGooglePay(
                      merchantCountryCode: "UK", testEnv: true),
                  style: ThemeMode.dark,
                  customerId: paymentIntentData!["customer"],
                  merchantDisplayName: 'Survival'))
          .then((value) {});

      displayPaymentSheet();
    } catch (e, s) {
      print('exception:$e$s');
    }
  }

  displayPaymentSheet() async {
    try {
      await Stripe.instance.presentPaymentSheet().then((newValue) async {
        Get.dialog(
          SpinKitSpinningLines(color: kRed),
          barrierDismissible: false,
        );
        await firestore
            .collection("users")
            .doc(authController.getCurrentUser())
            .update({
          "subscription": widget.subscription,
        }).then((value) {
          Get.to(() => const Question1Screen());
        });
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Subscribed Successfully")));
      }).onError((error, stackTrace) {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("Payment Failed")));
        print('Exception/DISPLAYPAYMENTSHEET==> $error $stackTrace');
      });
    } on StripeException catch (e) {
      print('Exception/DISPLAYPAYMENTSHEET==> $e');
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Payment Failed")));
    } catch (e) {
      print('$e');
    }
  }

  createPaymentIntent(String amount, String currency) async {
    try {
      Map<String, dynamic> body = {
        'amount': calculateAmount(amount),
        'currency': currency,
        'payment_method_types[]': 'card'
      };
      var response = await http.post(
          Uri.parse('https://api.stripe.com/v1/payment_intents'),
          body: body,
          headers: {
            'Authorization':
                'Bearer sk_test_51K6zopGzO3hgvNqilLvm5M0aFVzRfNc9mXamoIZoDX6MXMzuz1GMo2QgRW7XTf7Zf2Pdhoo1c6HWP2pcsEefVeEJ00x5RKPuem',
            'Content-Type': 'application/x-www-form-urlencoded'
          });

      return jsonDecode(response.body);
    } catch (err) {
      print('err charging user: ${err.toString()}');
    }
  }

  calculateAmount(String amount) {
    final a = ((double.parse(amount)) * 100).toInt();

    return a.toString();
  }
}
