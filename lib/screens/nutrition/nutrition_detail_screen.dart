import 'package:cached_network_image/cached_network_image.dart';
import 'package:fitness_app/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

class NutritionDetailScreen extends StatelessWidget {
  const NutritionDetailScreen(
      {super.key,
      required this.name,
      required this.image,
      required this.categories});
  final String name;
  final String image;
  final List<dynamic> categories;
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
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(24)),
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
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Text(
                      name,
                      style: kBodyText.copyWith(
                          fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  ),
                  Row(
                    children: [
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
                ],
              ),
            ),
            ...List.generate(
              categories.length,
              (index) => Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20),
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  height: 40,
                  width: size.width * 0.4,
                  decoration: BoxDecoration(
                      color: kWhite, borderRadius: BorderRadius.circular(12)),
                  child: Center(
                      child: Text(
                    categories[index].toUpperCase(),
                    style: kButtonText,
                  )),
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
