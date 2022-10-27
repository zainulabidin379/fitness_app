import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/constants.dart';
import 'shopping_list_detail_screen.dart';

class ShopingListOverViewScreen extends StatelessWidget {
  ShopingListOverViewScreen({super.key});
  final List<SimpleModel> _items = <SimpleModel>[
    SimpleModel(
      'View Full List',
    ),
    SimpleModel(
      'Carbs',
    ),
    SimpleModel(
      'Fats',
    ),
    SimpleModel(
      'Proteins',
    ),
    SimpleModel(
      'Fruits',
    ),
    SimpleModel(
      'Vegetables',
    ),
    SimpleModel(
      'Liquids',
    ),
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
          "Shopping List",
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
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20, top: 25),
              child: SizedBox(
                height: 700,
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: _items
                      .map(
                        (SimpleModel item) => InkWell(
                          onTap: () => Get.to(() => ShoppingListDetailScreen(
                                nSelectedListTitle: item.title,
                              )),
                          child: Container(
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            height: 70,
                            width: size.width,
                            decoration: BoxDecoration(
                                color: kWhite,
                                borderRadius: BorderRadius.circular(15)),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                left: 26,
                                top: 23,
                              ),
                              child: Text(
                                item.title,
                                style: kButtonText.copyWith(fontSize: 20),
                              ),
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
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

  SimpleModel(
    this.title,
  );
}
