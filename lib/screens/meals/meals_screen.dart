import 'package:fitness_app/constants/firebase_constants.dart';
import 'package:fitness_app/screens/meals/meal_detail_screen.dart';
import 'package:fitness_app/screens/meals/meal_filter_screen.dart';
import 'package:fitness_app/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
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
              StreamBuilder<dynamic>(
                  stream: firestore.collection("meals").snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Column(
                        children: List.generate(
                            snapshot.data.docs.length,
                            (index) => Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 5),
                                  child: GestureDetector(
                                    onTap: () => Get.to(() => MealDetailScreen(
                                          name: snapshot.data.docs[index]
                                              ['name'],
                                          image: snapshot.data.docs[index]
                                              ['image'],
                                          description: snapshot.data.docs[index]
                                              ['description'],
                                          categories: snapshot.data.docs[index]
                                              ['category'],
                                        )),
                                    child: Row(
                                      children: [
                                        CustomContainer(
                                          imageString: snapshot.data.docs[index]
                                              ['image'],
                                        ),
                                        const SizedBox(width: 10),
                                        Flexible(
                                          child: Text(
                                            snapshot.data.docs[index]['name'],
                                            style: kBodyText.copyWith(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                )),
                      );
                    } else {
                      return Padding(
                        padding: const EdgeInsets.only(top: 30),
                        child: Center(
                          child: SpinKitSpinningLines(
                            color: kRed,
                          ),
                        ),
                      );
                    }
                  }),
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
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.only(bottom: 15, right: 15),
      height: size.width * 0.22,
      width: size.width * 0.3,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(24)),
      child: ClipRRect(
          borderRadius: BorderRadius.circular(24),
          child: Image.network(
            imageString,
            fit: BoxFit.cover,
            loadingBuilder: (BuildContext context, Widget child,
                ImageChunkEvent? loadingProgress) {
              if (loadingProgress == null) return child;
              return Center(
                child: CircularProgressIndicator(
                  color: kRed,
                  strokeWidth: 3,
                  value: loadingProgress.expectedTotalBytes != null
                      ? loadingProgress.cumulativeBytesLoaded /
                          loadingProgress.expectedTotalBytes!
                      : null,
                ),
              );
            },
          )),
    );
  }
}
