import 'package:fitness_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/custom_button.dart';
import '../../widgets/custom_text_field.dart';
import 'payment.dart';

class CouponCodeScreen extends StatelessWidget {
  const CouponCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: kBlack,
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 40,
              ),
              Text(
                'Enter coupon code to redeem',
                style: kBodyText.copyWith(fontWeight: FontWeight.bold),
              ),

              const SizedBox(
                height: 40,
              ),

              const CustomTextField(
                nHintText: 'Email*',
              ),

              const SizedBox(
                height: 30,
              ),
              CustomButton(
                title: "Send",
                onTap: () => Get.to(() => const PaymentScreen()),
              ),

              // Image.asset(
              //   "assets/images/img1.jpg",
              //   fit: BoxFit.cover,
              //   width: size.width,
              //   height: size.height * 0.55,
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
