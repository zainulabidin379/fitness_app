import 'package:fitness_app/screens/nutrition/nutrition_detail_screen.dart';
import 'package:fitness_app/screens/nutrition/nutrition_filter_screen.dart';
import 'package:fitness_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'personalised_nutrition_confirmation_screen.dart';

class NutritionScreen extends StatelessWidget {
  const NutritionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
                margin: const EdgeInsets.only(left: 15),
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
          actions: [
            GestureDetector(
              onTap: () => Get.to(() => const NutritionFilterScreen()),
              child: Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Icon(
                  Icons.filter_alt,
                  color: kWhite,
                  size: 25,
                ),
              ),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                Center(
                  child: Text(
                    "Nutrition",
                    style: kBodyText.copyWith(
                        fontWeight: FontWeight.bold, fontSize: 24),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    decoration: BoxDecoration(
                        //ckgroundColor: Colors.white,
                        color: kWhite,
                        borderRadius: BorderRadius.circular(10)),

                    //margin: const EdgeInsets.symmetric(vertical: 10),
                    height: 60,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8, top: 8),
                      child: TextField(
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.search,
                            color: kBlack,
                            size: 24,
                          ),
                          border: InputBorder.none,
                          hintText: 'Search',
                        ),
                        cursorColor: kBlack,
                      ),
                    ),
                  ),
                ),
                ...List.generate(
                    6,
                    (index) => Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: GestureDetector(
                            onTap: () =>
                                Get.to(() => const NutritionDetailScreen()),
                            child: Row(
                              children: [
                                const CustomContainer(
                                  imageString:
                                      "assets/images/ingredientsBG1.png",
                                ),
                                const SizedBox(width: 10),
                                Text(
                                  'Name of ingredients',
                                  style: kBodyText.copyWith(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                )
                              ],
                            ),
                          ),
                        )),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                  child: Center(
                    child: GestureDetector(
                      onTap: () => Get.to(() =>
                          const PersonalisedNutritionConfirmationScreen()),
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        height: 55,
                        width: size.width * 1,
                        decoration: BoxDecoration(
                            color: kWhite,
                            borderRadius: BorderRadius.circular(5)),
                        child: Center(
                            child: Text(
                          'Apply for personalised nutrition plan',
                          style: kButtonText,
                        )),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomContainer extends StatelessWidget {
  final String imageString;
  const CustomContainer({
    Key? key,
    required this.imageString,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.only(bottom: 15, right: 15),
      padding: const EdgeInsets.all(15),
      height: size.width * 0.22,
      width: size.width * 0.3,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(imageString), fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(24)),
    );
  }
}
