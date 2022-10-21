import 'package:fitness_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SavedItemsScreen extends StatefulWidget {
  const SavedItemsScreen({super.key});

  @override
  State<SavedItemsScreen> createState() => _SavedItemsScreenState();
}

class _SavedItemsScreenState extends State<SavedItemsScreen> {
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
            children: [
              const SizedBox(
                height: 20,
              ),
              categoryCard(size, "Exercise Videos", "exercise"),
              categoryCard(size, "Set Workout", "workout"),
              categoryCard(size, "Full Meals", "fullMeals"),
              categoryCard(size, "Ingredients", "ingredients"),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget categoryCard(Size size, String title, String image) {
    return Container(
      height: size.height * 0.2,
      width: size.width,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          image: DecorationImage(
              image: AssetImage("assets/images/$image.jpg"),
              fit: BoxFit.cover)),
      child: Align(
        alignment: Alignment.bottomLeft,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Text(
            title,
            style: GoogleFonts.montserrat(
                textStyle: Theme.of(context).textTheme.headline1,
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: kWhite),
          ),
        ),
      ),
    );
  }
}
