import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_time_format/date_time_format.dart';
import 'package:fitness_app/constants/constants.dart';
import 'package:fitness_app/controllers/bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

class ExploreScreen extends StatelessWidget {
  ExploreScreen({super.key});
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
              GestureDetector(
                onTap: () {
                  _navController.navigateTo(0);
                },
                child: Center(
                  child: SizedBox(
                    height: 55,
                    child: Image.asset("assets/images/logo.png"),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              StreamBuilder<dynamic>(
                  stream: FirebaseFirestore.instance
                      .collection("explore")
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Column(
                        children: List.generate(
                          snapshot.data.docs.length,
                          (index) => postCard(
                              size,
                              snapshot.data.docs[index]['name'],
                              snapshot.data.docs[index]['timestamp'],
                              snapshot.data.docs[index]['image']),
                        ),
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
            ],
          ),
        ),
      ),
    );
  }

  Padding postCard(Size size, String name, Timestamp time, String image) {
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
            DateTimeFormat.relative(time.toDate(),
                ifNow: 'Now', appendIfAfter: 'ago'),
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
              border: Border.all(color: kWhite, width: 1),
              borderRadius: BorderRadius.circular(24),
            ),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(24),
                child: CachedNetworkImage(
                  imageUrl: image,
                  imageBuilder: (context, imageProvider) => Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  errorWidget: (context, url, error) => Icon(
                    Icons.error,
                    color: kWhite,
                  ),
                  placeholder: (context, url) =>
                      SpinKitSpinningLines(color: kRed),
                  fit: BoxFit.cover,
                )),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.favorite_outline,
                    color: kWhite,
                    size: 30,
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.chat_bubble_outline,
                    color: kWhite,
                    size: 30,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
