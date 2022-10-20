import 'package:fitness_app/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/constants.dart';

class ShoppingListDetailScreen extends StatelessWidget {
  final String nSelectedListTitle;
  const ShoppingListDetailScreen({super.key, required this.nSelectedListTitle});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      backgroundColor: kBlack,
      appBar: AppBar(
        backgroundColor: kBlack,
        title: Text(
          nSelectedListTitle,
          style: kBodyText.copyWith(fontSize: 20),
        ),
        //centerTitle: true,
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
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20, top: 25),
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                height: 500,
                width: size.width,
                decoration: BoxDecoration(
                    color: kWhite, borderRadius: BorderRadius.circular(15)),
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 26,
                    top: 23,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Tortilla x 1\nBread x 2\nSalmon x 1\nChicken x 500g\nOranges x 10\nBroccoli x 50g\nCarrots x 50g\nMineral Water x 12bottles',
                        //textAlign: TextAlign.start,
                        style: kButtonText.copyWith(
                            fontSize: 20, fontWeight: FontWeight.normal),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            nSelectedListTitle == 'View Full List'
                ? CustomButton(
                    title: 'Clear List',
                    onTap: () {},
                  )
                : CustomButton(
                    title: 'Submit',
                    onTap: () {},
                  ),
          ],
        ),
      ),
    ));
  }
}
