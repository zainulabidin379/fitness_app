import 'package:fitness_app/screens/bottom_nav.dart';
import 'package:fitness_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
      //home: const VideoScreen(),
      home: const BottomNav(
        currentTab: 0,
      ),
    );
  }
}
