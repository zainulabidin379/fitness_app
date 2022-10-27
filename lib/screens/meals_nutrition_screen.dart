import 'package:fitness_app/screens/meals/meals_screen.dart';
import 'package:fitness_app/screens/nutrition/nutrition_screen.dart';
import 'package:fitness_app/screens/nutrition/personalised_nutrition_confirmation_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/constants.dart';

class MealsNutritionScreen extends StatelessWidget {
  const MealsNutritionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: kBlack,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: SizedBox(
                      height: 55,
                      child: Image.asset("assets/images/logo.png"),
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    "Meals / Nutrition",
                    style: kBodyText.copyWith(
                        fontWeight: FontWeight.bold, fontSize: 24),
                  ),
                ),
                const SizedBox(
                  height: 55,
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: GestureDetector(
                    onTap: () => Get.to(() => const NutritionScreen()),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const CustomContainer(
                          imageString: "assets/images/ingredientsBG1.png",
                        ),
                        SizedBox(width: size.width * 0.1),
                        Text(
                          'Nutrition',
                          style: kBodyText.copyWith(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: GestureDetector(
                    onTap: () => Get.to(() => const MealsScreen()),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const CustomContainer(
                          imageString: "assets/images/ingredientsBG2.png",
                        ),
                        SizedBox(width: size.width * 0.1),
                        Text(
                          'Meals',
                          style: kBodyText.copyWith(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Center(
                child: GestureDetector(
                  onTap: () => Get.to(
                      () => const PersonalizedNutritionConfirmationScreen()),
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 20),
                    height: 55,
                    width: size.width * 1,
                    decoration: BoxDecoration(
                        color: kWhite, borderRadius: BorderRadius.circular(5)),
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
    return Container(
      margin: const EdgeInsets.only(bottom: 15, right: 15),
      padding: const EdgeInsets.all(15),
      width: 158,
      height: 114,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(imageString), fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(24)),
    );
  }
}
