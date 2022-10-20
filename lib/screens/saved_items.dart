import 'package:fitness_app/utils/constants.dart';
import 'package:flutter/material.dart';
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
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 40,
              ),
              Center(
                child: SizedBox(
                  height: 55,
                  child: Image.asset("assets/images/logo.png"),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              categoryCard(size, "Exercise Videos", "exercise"),
              categoryCard(size, "Set Workout", "workout"),
              categoryCard(size, "Full Meals", "fullMeals"),
              categoryCard(size, "Ingredients", "ingredients"),
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
