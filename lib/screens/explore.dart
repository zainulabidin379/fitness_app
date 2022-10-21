import 'package:fitness_app/utils/constants.dart';
import 'package:flutter/material.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

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
                child: SizedBox(
                  height: 55,
                  child: Image.asset("assets/images/logo.png"),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              postCard(size, 'Kendrick Lemar', '8 Minutes ago',
                  "assets/images/videosImage.jpg"),
              postCard(size, 'Kendrick Lemar', '8 Minutes ago',
                  "assets/images/videosImage.jpg"),
              postCard(size, 'Kendrick Lemar', '8 Minutes ago',
                  "assets/images/videosImage.jpg"),
            ],
          ),
        ),
      ),
    );
  }

  Padding postCard(Size size, String name, String time, String image) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style:
                kBodyText.copyWith(fontSize: 16, fontWeight: FontWeight.w900),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            time,
            style:
                kBodyText.copyWith(fontSize: 12, fontWeight: FontWeight.w900),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            height: size.height * 0.22,
            width: size.width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                border: Border.all(color: kWhite, width: 1),
                image: DecorationImage(
                    image: AssetImage(image), fit: BoxFit.cover)),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              children: [
                Icon(
                  Icons.favorite,
                  color: kRed,
                  size: 30,
                ),
                const SizedBox(
                  width: 20,
                ),
                Icon(
                  Icons.chat_bubble_outline,
                  color: kWhite,
                  size: 30,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
