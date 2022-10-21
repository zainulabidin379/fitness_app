import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/constants.dart';

class NutritionFilterScreen extends StatelessWidget {
  const NutritionFilterScreen({super.key});

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
                height: 20,
              ),
              Center(
                child: Text(
                  "Nutrition Filters",
                  style: kBodyText.copyWith(
                      fontWeight: FontWeight.bold, fontSize: 24),
                ),
              ),
              const SizedBox(
                height: 70,
              ),
              Center(
                child: Text(
                  "Category",
                  style: kBodyText.copyWith(
                      fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  CustomContainer(
                    size: size,
                    filterTitle: 'PROTEIN',
                  ),
                  CustomContainer(
                    size: size,
                    filterTitle: 'CARBS',
                  ),
                ],
              ),
              Row(
                children: [
                  CustomContainer(
                    size: size,
                    filterTitle: 'FATS',
                  ),
                  CustomContainer(
                    size: size,
                    filterTitle: 'VITAMINS',
                  ),
                ],
              ),
              Row(
                children: [
                  CustomContainer(
                    size: size,
                    filterTitle: 'MINERALS',
                  ),
                  CustomContainer(
                    size: size,
                    filterTitle: 'FLUIDS',
                  ),
                ],
              ),
              Row(
                children: [
                  CustomContainer(
                    size: size,
                    filterTitle: 'HERBALS',
                  ),
                  CustomContainer(
                    size: size,
                    filterTitle: 'CONDIMENTS',
                  ),
                ],
              ),
              Row(
                children: [
                  CustomContainer(
                    size: size,
                    filterTitle: 'SUPERFOODS',
                  ),
                  CustomContainer(
                    size: size,
                    filterTitle: 'TOXIN FOODS',
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Center(
                  child: GestureDetector(
                    onTap: () => Get.back(),
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      height: 55,
                      width: size.width * 1,
                      decoration: BoxDecoration(
                          color: kWhite,
                          borderRadius: BorderRadius.circular(5)),
                      child: Center(
                          child: Text(
                        'Apply filters',
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
  final String filterTitle;
  const CustomContainer({
    Key? key,
    required this.size,
    required this.filterTitle,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Padding(
        padding: const EdgeInsets.only(
          left: 20.0,
          right: 20.0,
        ),
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          height: 55,
          decoration: BoxDecoration(
              color: kWhite, borderRadius: BorderRadius.circular(12)),
          child: Center(
              child: Text(
            filterTitle,
            style: kButtonText,
          )),
        ),
      ),
    );
  }
}
