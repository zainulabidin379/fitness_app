import 'package:fitness_app/constants/controllers.dart';
import 'package:fitness_app/constants/firebase_constants.dart';
import 'package:fitness_app/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

import '../../constants/constants.dart';

class FullShoppingListScreen extends StatefulWidget {
  const FullShoppingListScreen({super.key});

  @override
  State<FullShoppingListScreen> createState() => _FullShoppingListScreenState();
}

class _FullShoppingListScreenState extends State<FullShoppingListScreen> {
  final TextEditingController carbsController = TextEditingController();
  final TextEditingController fatsController = TextEditingController();
  final TextEditingController proteinsController = TextEditingController();
  final TextEditingController fruitsController = TextEditingController();
  final TextEditingController vegetablesController = TextEditingController();
  final TextEditingController liquidsController = TextEditingController();
  var isEditing = false.obs;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      backgroundColor: kBlack,
      appBar: AppBar(
        backgroundColor: kBlack,
        title: Text(
          "Full List",
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
      floatingActionButton: Visibility(
        visible: carbsController.text.isNotEmpty ||
            fatsController.text.isNotEmpty ||
            proteinsController.text.isNotEmpty ||
            fruitsController.text.isNotEmpty ||
            vegetablesController.text.isNotEmpty ||
            liquidsController.text.isNotEmpty,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 80, right: 10),
          child: Obx(() {
            return isEditing.value
                ? ElevatedButton(
                    onPressed: () {
                      FocusScope.of(context).unfocus();
                      Get.dialog(
                        SpinKitSpinningLines(color: kRed),
                        barrierDismissible: false,
                      );
                      firestore
                          .collection("shoppingList")
                          .doc(authController.getCurrentUser())
                          .update({
                        'Carbs': carbsController.text.split('\n'),
                        'Fats': fatsController.text.split('\n'),
                        'Proteins': proteinsController.text.split('\n'),
                        'Fruits': fruitsController.text.split('\n'),
                        'Vegetables': vegetablesController.text.split('\n'),
                        'Liquids': liquidsController.text.split('\n'),
                      }).then((value) {
                        Get.back();
                        isEditing.value = false;
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
                    },
                    style: ButtonStyle(
                        fixedSize: MaterialStateProperty.all<Size?>(
                            const Size(150, 55)),
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                        backgroundColor: MaterialStateProperty.all<Color>(kRed),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.done,
                          color: kWhite,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text("Update".toUpperCase(), style: kBodyText),
                      ],
                    ))
                : FloatingActionButton(
                    onPressed: () {
                      isEditing.value = true;
                    },
                    backgroundColor: kRed,
                    isExtended: true,
                    child: Icon(isEditing.value ? Icons.done : Icons.edit),
                  );
          }),
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
                        carbsController.text =
                            snapshot.data['Carbs'].join("\n");
                        fatsController.text = snapshot.data['Fats'].join("\n");
                        proteinsController.text =
                            snapshot.data['Proteins'].join("\n");
                        fruitsController.text =
                            snapshot.data['Fruits'].join("\n");
                        vegetablesController.text =
                            snapshot.data['Vegetables'].join("\n");
                        liquidsController.text =
                            snapshot.data['Liquids'].join("\n");
                      }
                      return SingleChildScrollView(
                        child: Column(
                          children: [
                            Visibility(
                                visible: carbsController.text.isNotEmpty,
                                child: listSection("Carbs", carbsController)),
                            Visibility(
                                visible: fatsController.text.isNotEmpty,
                                child: listSection("Fats", fatsController)),
                            Visibility(
                                visible: proteinsController.text.isNotEmpty,
                                child: listSection(
                                    "Proteins", proteinsController)),
                            Visibility(
                                visible: fruitsController.text.isNotEmpty,
                                child: listSection("Fruits", fruitsController)),
                            Visibility(
                                visible: vegetablesController.text.isNotEmpty,
                                child: listSection(
                                    "Vegetables", vegetablesController)),
                            Visibility(
                                visible: liquidsController.text.isNotEmpty,
                                child:
                                    listSection("Liquids", liquidsController)),
                          ],
                        ),
                      );
                    } else {
                      return Center(child: SpinKitSpinningLines(color: kRed));
                    }
                  }),
            )),
            CustomButton(
              title: 'Clear List',
              onTap: () {
                FocusScope.of(context).unfocus();
                Get.dialog(
                  SpinKitSpinningLines(color: kRed),
                  barrierDismissible: false,
                );
                firestore
                    .collection("shoppingList")
                    .doc(authController.getCurrentUser())
                    .update({
                  'Carbs': [],
                  'Fats': [],
                  'Proteins': [],
                  'Fruits': [],
                  'Vegetables': [],
                  'Liquids': [],
                }).then((value) {
                  Get.back();
                  isEditing.value = false;
                  Get.rawSnackbar(
                    messageText: Text(
                      "Your shopping list is cleared successfully",
                      style: kBodyText.copyWith(color: kBlack),
                    ),
                    backgroundColor: kWhite,
                    snackPosition: SnackPosition.TOP,
                    borderRadius: 10,
                    margin: const EdgeInsets.all(10),
                  );
                });
              },
            )
          ],
        ),
      ),
    ));
  }

  Widget listSection(String title, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: kBodyText.copyWith(
              color: kBlack, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Obx(() {
          return TextField(
            controller: controller,
            enabled: isEditing.value,
            cursorColor: kBlack,
            textAlignVertical: TextAlignVertical.top,
            style: kBodyText.copyWith(color: kBlack, fontSize: 16),
            textInputAction: TextInputAction.newline,
            keyboardType: TextInputType.multiline,
            maxLines: null,
            decoration: InputDecoration(
                contentPadding: EdgeInsets.zero,
                isDense: true,
                filled: false,
                hintText: "Add items",
                hintStyle: kBodyText.copyWith(
                    color: kBlack.withOpacity(0.5), fontSize: 16),
                border: InputBorder.none,
                focusedBorder: InputBorder.none),
          );
        }),
        const SizedBox(
          height: 20,
        )
      ],
    );
  }
}
