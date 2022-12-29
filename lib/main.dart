import 'package:fitness_app/constants/constants.dart';
import 'package:fitness_app/constants/firebase_constants.dart';
import 'package:fitness_app/controllers/auth_controller.dart';
import 'package:fitness_app/controllers/bottom_nav.dart';
import 'package:fitness_app/controllers/nutrition_meal_filter.dart';
import 'package:fitness_app/controllers/questions_controller.dart';
import 'package:fitness_app/controllers/set_workout_filter.dart';
import 'package:fitness_app/controllers/workout_videos_filter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await firebaseInitialization.then((value) {
    Get.put(AuthController());
    Get.put(BottomNavController());
    Get.put(QuestionsController());
    Get.put(WorkoutVideoFilterController());
    Get.put(SetWorkoutFilterController());
    Get.put(NutritionMealFilterController());
    Stripe.publishableKey ="pk_test_51K6zopGzO3hgvNqiBpdObqiUXUvwOePcYDZ6I6kZvsgIHXKHT3EtsUoN4Ab4vmFNPHHhFh8bHvb1IZvAS7SxPyOj00LOd6ChOV";
  });
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Survival',
      theme: ThemeData(
        textTheme: GoogleFonts.montserratTextTheme(Theme.of(context).textTheme),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        scrollbarTheme: ScrollbarThemeData(
          thumbVisibility: MaterialStateProperty.all(true),
          trackVisibility: MaterialStateProperty.all(true),
          thickness: MaterialStateProperty.all(3),
          thumbColor: MaterialStateProperty.all(kWhite),
          trackColor: MaterialStateProperty.all(kWhite.withOpacity(0.5)),
          radius: const Radius.circular(10),
        ),
        appBarTheme: AppBarTheme(
          toolbarTextStyle:
              GoogleFonts.montserratTextTheme(Theme.of(context).textTheme)
                  .bodyText2,
          titleTextStyle:
              GoogleFonts.montserratTextTheme(Theme.of(context).textTheme)
                  .headline6,
        ),
      ),
      home: Center(
          child: SpinKitSpinningLines(
        color: kRed,
      )),
    );
  }
}
