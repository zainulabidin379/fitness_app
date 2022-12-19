import 'package:fitness_app/constants/controllers.dart';
import 'package:fitness_app/constants/firebase_constants.dart';
import 'package:fitness_app/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

import '../../constants/constants.dart';

class ShoppingListDetailScreen extends StatefulWidget {
  final String nSelectedListTitle;
  const ShoppingListDetailScreen({super.key, required this.nSelectedListTitle});

  @override
  State<ShoppingListDetailScreen> createState() =>
      _ShoppingListDetailScreenState();
}

class _ShoppingListDetailScreenState extends State<ShoppingListDetailScreen> {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      backgroundColor: kBlack,
      appBar: AppBar(
        backgroundColor: kBlack,
        title: Text(
          widget.nSelectedListTitle,
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
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Column(
          children: [
            Expanded(
                child: Container(
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              width: size.width,
              decoration: BoxDecoration(
                  color: kWhite, borderRadius: BorderRadius.circular(15)),
              child: StreamBuilder<dynamic>(
                  stream: firestore
                      .collection("shoppingList")
                      .doc(authController.getCurrentUser())
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      if (snapshot.data.exists) {
                        controller.text =
                            snapshot.data[widget.nSelectedListTitle].join('\n');
                      }
                      return TextField(
                        controller: controller,
                        cursorColor: kBlack,
                        style: kBodyText.copyWith(color: kBlack, fontSize: 16),
                        textInputAction: TextInputAction.newline,
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.zero,
                            filled: false,
                            hintText: "Add items",
                            hintStyle: kBodyText.copyWith(
                                color: kBlack.withOpacity(0.5), fontSize: 16),
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none),
                      );
                    } else {
                      return Center(child: SpinKitSpinningLines(color: kRed));
                    }
                  }),
            )),
            CustomButton(
                    title: 'Submit',
                    onTap: () async {
                      FocusScope.of(context).unfocus();
                      Get.dialog(
                        SpinKitSpinningLines(color: kRed),
                        barrierDismissible: false,
                      );
                      firestore
                          .collection("shoppingList")
                          .doc(authController.getCurrentUser())
                          .get()
                          .then((value) {
                        if (value.exists) {
                          firestore
                              .collection("shoppingList")
                              .doc(authController.getCurrentUser())
                              .update({
                            widget.nSelectedListTitle:
                                controller.text.split('\n'),
                          }).then((value) {
                            Get.back();
                            Get.rawSnackbar(
                              messageText: Text(
                                "Your shopping list is updated successfully",
                                style: kBodyText.copyWith(color: kBlack),
                              ),
                              backgroundColor: kWhite,
                              snackPosition: SnackPosition.TOP,
                              borderRadius: 10,
                              margin: const EdgeInsets.all(10),
                            );
                          });
                        } else {
                          firestore
                              .collection("shoppingList")
                              .doc(authController.getCurrentUser())
                              .set({
                            "id": authController.getCurrentUser(),
                            'Carbs': [],
                            'Fats': [],
                            'Proteins': [],
                            'Fruits': [],
                            'Vegetables': [],
                            'Liquids': [],
                            "timestamp": DateTime.now(),
                          }).then((value) {
                            firestore
                                .collection("shoppingList")
                                .doc(authController.getCurrentUser())
                                .update({
                              widget.nSelectedListTitle:
                                  controller.text.split('\n'),
                            }).then((value) {
                              Get.back();
                              Get.rawSnackbar(
                                messageText: Text(
                                  "Your shopping list is updated successfully",
                                  style: kBodyText.copyWith(color: kBlack),
                                ),
                                backgroundColor: kWhite,
                                snackPosition: SnackPosition.TOP,
                                borderRadius: 10,
                                margin: const EdgeInsets.all(10),
                              );
                            });
                          });
                        }
                      });
                    },
                  ),
          ],
        ),
      ),
    ));
  }
}
