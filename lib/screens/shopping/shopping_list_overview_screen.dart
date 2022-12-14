import 'package:fitness_app/screens/shopping/full_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/constants.dart';
import 'shopping_list_detail_screen.dart';

class ShoppingListOverViewScreen extends StatelessWidget {
  ShoppingListOverViewScreen({super.key});
  final List _items = [
    'Full List',
    'Carbs',
    'Fats',
    'Proteins',
    'Fruits',
    'Vegetables',
    'Liquids',
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
        child: Column(children: [
          const SizedBox(
            height: 20,
          ),
          ...List.generate(
            _items.length,
            (index) => Padding(
              padding: const EdgeInsets.only(
                left: 20.0,
                right: 20,
              ),
              child: GestureDetector(
                onTap: () {
                  if (index == 0) {
                    Get.to(() => const FullShoppingListScreen());
                  } else {
                    Get.to(() => ShoppingListDetailScreen(
                          nSelectedListTitle: _items[index],
                        ));
                  }
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  height: 70,
                  width: size.width,
                  decoration: BoxDecoration(
                      color: kWhite, borderRadius: BorderRadius.circular(15)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        index == 0 ? "View ${_items[index]}" : _items[index],
                        style: kButtonText.copyWith(fontSize: 20),
                      ),
                      Visibility(
                        visible: index == 0,
                        child: Icon(
                          Icons.segment,
                          color: kBlack,
                          size: 30,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
        ]),
      ),
    ));
  }
}
