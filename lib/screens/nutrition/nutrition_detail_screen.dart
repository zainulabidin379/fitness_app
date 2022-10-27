import 'package:fitness_app/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NutritionDetailScreen extends StatelessWidget {
  const NutritionDetailScreen({super.key});

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
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                //margin: const EdgeInsets.only(bottom: 15, right: 15),
                //padding: const EdgeInsets.all(15),
                width: size.width,
                height: 190,
                decoration: BoxDecoration(
                    image: const DecorationImage(
                        image: AssetImage('assets/images/ingredientsBG2.png'),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(24)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                children: [
                  Text(
                    'Name of ingredients',
                    style: kBodyText.copyWith(
                        fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  SizedBox(
                    width: size.width * 0.15,
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.shopping_cart,
                        color: kWhite,
                      )),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.bookmark_add,
                        color: kWhite,
                      )),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20),
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                height: 40,
                width: size.width * 0.4,
                decoration: BoxDecoration(
                    color: kWhite, borderRadius: BorderRadius.circular(12)),
                child: Center(
                    child: Text(
                  'Category Name',
                  style: kButtonText,
                )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20),
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                height: 40,
                width: size.width * 0.4,
                decoration: BoxDecoration(
                    color: kWhite, borderRadius: BorderRadius.circular(12)),
                child: Center(
                    child: Text(
                  'Category Name',
                  style: kButtonText,
                )),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
