import 'package:fitness_app/screens/meals/meal_detail_screen.dart';
import 'package:fitness_app/screens/meals/meal_filter_screen.dart';
import 'package:fitness_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../nutrition/personalised_nutrition_confirmation_screen.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({super.key});

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
          actions: [
            GestureDetector(
              onTap: () => Get.to(() => const MealFilterScreen()),
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
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              Center(
                child: Text(
                  "Meals",
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
                  padding: const EdgeInsets.only(left: 20, top: 10, right: 20),
                  child: GestureDetector(
                    onTap: () => Get.to(() => const MealDetailScreen()),
                    child: Row(
                      children: [
                        const CustomContainer(
                          imageString: "assets/images/ingredientsBG1.png",
                        ),
                        SizedBox(width: size.width * 0.01),
                        Text(
                          'Name of Meal',
                          style: kBodyText.copyWith(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                child: Center(
                  child: GestureDetector(
                    onTap: () => Get.to(
                        () => const PersonalizedNutritionConfirmationScreen()),
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
