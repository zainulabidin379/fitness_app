import 'package:fitness_app/constants/firebase_constants.dart';
import 'package:fitness_app/controllers/auth_controller.dart';
import 'package:fitness_app/controllers/bottom_nav.dart';
import 'package:fitness_app/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final BottomNavController _navController = Get.put(BottomNavController());
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
              SizedBox(
                height: 55,
                child: Image.asset("assets/images/logo.png"),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: StreamBuilder<dynamic>(
                      stream: firestore
                          .collection("users")
                          .doc(AuthController.instance.getCurrentUser())
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Text(
                            "Hello ${snapshot.data["name"]}",
                            style: kBodyText.copyWith(
                                fontWeight: FontWeight.bold, fontSize: 22),
                          );
                        } else {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 30),
                                child: SpinKitSpinningLines(
                                  color: kRed,
                                  size: 30,
                                ),
                              ),
                            ],
                          );
                        }
                      }),
                ),
              ),
              categoryCard(size, "Exercise Videos", "videosImage", 2),
              categoryCard(size, "Set Workout", "setsImage", 3),
              categoryCard(size, "Nutrition", "nutritionImage", 4),
            ],
          ),
        ),
      ),
    );
  }

  Widget categoryCard(Size size, String title, String image, int tab) {
    return GestureDetector(
      onTap: () {
        _navController.navigateTo(tab);
      },
      child: Container(
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
      ),
    );
  }
}
