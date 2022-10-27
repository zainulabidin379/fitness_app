import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/constants.dart';

class PictureDiaryScreen extends StatelessWidget {
  const PictureDiaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      backgroundColor: kBlack,
      appBar: AppBar(
        backgroundColor: kBlack,
        title: Text(
          "Picture Diary",
          style: kBodyText.copyWith(fontSize: 20, fontWeight: FontWeight.bold),
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
            const SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: SizedBox(
                height: size.height * 0.3,
                width: size.width * 1,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 4,
                  itemBuilder: (context, index) => Container(
                    margin: const EdgeInsets.only(bottom: 15, right: 15),
                    padding: const EdgeInsets.all(15),
                    height: size.height * 0.3,
                    width: size.width * 0.6,
                    decoration: BoxDecoration(
                        image: const DecorationImage(
                            image: AssetImage(
                              "assets/images/ingredientsBG1.png",
                            ),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(12)),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Container(
                //color: Colors.red,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        // padding: const EdgeInsets.only(right: 4),
                        // margin: const EdgeInsets.only(left: 10),
                        height: 32,
                        width: 32,
                        decoration:
                            BoxDecoration(color: kDark, shape: BoxShape.circle),
                        child: Center(
                          child: Icon(
                            Icons.arrow_back_ios_new,
                            color: kWhite,
                            size: 18,
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: 32,
                        width: 32,
                        decoration:
                            BoxDecoration(color: kDark, shape: BoxShape.circle),
                        child: Center(
                          child: Icon(
                            Icons.arrow_forward_ios_sharp,
                            color: kWhite,
                            size: 18,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              child: Row(
                children: [
                  SizedBox(
                    width: size.width * 0.4,
                  ),
                  Container(
                    height: size.height * 0.05,
                    width: size.width * 0.1,
                    decoration: BoxDecoration(
                        color: kWhite, borderRadius: BorderRadius.circular(12)),
                    child: Icon(
                      Icons.add,
                      color: kBlack,
                    ),
                  ),
                  SizedBox(
                    width: size.width * 0.02,
                  ),
                  Container(
                    height: size.height * 0.05,
                    width: size.width * 0.1,
                    decoration: BoxDecoration(
                        color: kWhite, borderRadius: BorderRadius.circular(12)),
                    child: Icon(
                      Icons.remove,
                      color: kBlack,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
                decoration: BoxDecoration(
                    color: kLightGrey,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15))),
                height: size.height * 0.42,
                width: size.width * 1,
                child: const Center(child: Text('Calendar'))),
          ],
        ),
      ),
    ));
  }
}
