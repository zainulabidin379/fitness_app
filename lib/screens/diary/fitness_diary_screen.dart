import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/constants.dart';
import '../shopping/shopping_list_detail_screen.dart';

class FitnessDiaryScreen extends StatelessWidget {
  FitnessDiaryScreen({super.key});
  final List<SimpleModel> _items = <SimpleModel>[
    SimpleModel('Breakfast', 'Oats, Banana, berries,almond milk'),
    SimpleModel('Lunch', 'mixed salad, sweet potatoes,plant-based meatballs'),
    SimpleModel('Dinner', 'Pasta, mixed beans,aspatagus'),
    SimpleModel('In-between meals', 'nothing'),
    SimpleModel('Liquids', '4 litres water,2 litres herbal'),
  ];

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
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                "Fitness Diary\n2022",
                style: kBodyText.copyWith(
                  fontSize: 32,
                  // fontWeight: FontWeight.bold
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0, bottom: 20),
              child: SizedBox(
                // color: Colors.red,
                height: size.height * 0.1,
                width: size.width * 1,
                child: ListView.builder(
                  //itemExtent: 100,
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Container(
                      height: size.height * 0.1,
                      width: size.width * 0.2,
                      decoration: BoxDecoration(
                          color: kGrey, borderRadius: BorderRadius.circular(8)),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Monday",
                            style: kBodyText.copyWith(
                              fontSize: 15,
                              // fontWeight: FontWeight.bold
                            ),
                          ),
                          Text(
                            "7",
                            style: kBodyText.copyWith(
                              fontSize: 32,
                              // fontWeight: FontWeight.bold
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.6,
              child: ListView.builder(
                itemCount: 4,
                itemBuilder: (context, index) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 20, bottom: 20, top: 10),
                      child: Text(
                        "Today",
                        style: kBodyText.copyWith(
                          fontSize: 24,
                          // fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 20.0, right: 20, top: 10, bottom: 10),
                      child: Container(
                        // margin: const EdgeInsets.symmetric(vertical: 5),
                        height: size.height * 0.35,
                        width: size.width,
                        decoration: BoxDecoration(
                            color: kWhite,
                            borderRadius: BorderRadius.circular(8)),
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 26,
                            top: 23,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '1. 5 km Run\n2. Own WOD at Everlast:\n.   6 rounds for time of 40m.\n.    KB walking lunges (12kg).\n.    40m handstand walking.',
                                //textAlign: TextAlign.start,
                                style: kButtonText.copyWith(
                                    fontSize: 24,
                                    fontWeight: FontWeight.normal),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 100,
            ),
            Container(
              decoration: BoxDecoration(
                  color: kLightGrey,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15))),
              height: 600,
              child: ListView(
                padding: EdgeInsets.zero,
                children: _items
                    .map(
                      (SimpleModel item) => InkWell(
                        onTap: () => Get.to(
                          () => ShoppingListDetailScreen(
                            nSelectedListTitle: item.title,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: Container(
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            height: 85,
                            width: size.width,
                            decoration: BoxDecoration(
                                color: kBlack,
                                borderRadius: BorderRadius.circular(8)),
                            child: Row(
                              // mainAxisAlignment: MainAxisAlignment.end,
                              // crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: size.width * 0.05,
                                ),
                                SizedBox(
                                  width: 100,
                                  child: Text(
                                    item.title,
                                    style: kBodyText.copyWith(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                SizedBox(
                                  width: size.width * 0.05,
                                ),
                                Flexible(
                                  child: Align(
                                    alignment: Alignment.centerRight,
                                    child: Padding(
                                      padding: const EdgeInsets.only(right: 50),
                                      child: Text(
                                        //textAlign: TextAlign.right,
                                        item.itemNames,
                                        style: kBodyText.copyWith(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}

class SimpleModel {
  String title;
  String itemNames;

  SimpleModel(
    this.title,
    this.itemNames,
  );
}
