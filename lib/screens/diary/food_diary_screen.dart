import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/constants.dart';
import '../shopping/shopping_list_detail_screen.dart';

class FoodDiaryScreen extends StatelessWidget {
  FoodDiaryScreen({super.key});
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
        title: Text(
          "Food Diary",
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
          children: [
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
