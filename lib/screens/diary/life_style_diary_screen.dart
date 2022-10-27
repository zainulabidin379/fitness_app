import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/constants.dart';

class LifeStyleDiaryScreen extends StatelessWidget {
  const LifeStyleDiaryScreen({super.key});
 
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      backgroundColor: kBlack,
      appBar: AppBar(
        backgroundColor: kBlack,
        title: Text(
          "LifeStyle Diary",
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
              height: 200,
            ),
            SizedBox(
              height: size.height * 0.6,
              child: ListView.builder(
                itemCount: 4,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                      //color: Colors.red,
                      child: Row(
                    children: [
                      Text(
                        "07",
                        style: kBodyText.copyWith(
                            fontSize: 32, fontWeight: FontWeight.bold),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          CustomRow(
                            title: 'Sleep:',
                            editableText: '8 hours at night, 2 hour nap',
                          ),
                          CustomRow(
                            title: "Steps:",
                            editableText: "14k",
                          ),
                          CustomRow(
                            title: "Mood:",
                            editableText: "Good",
                          ),
                          CustomRow(
                            title: "Period:",
                            editableText: "Due in four  weeks",
                          ),
                        ],
                      )
                    ],
                  )),
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}

class CustomRow extends StatelessWidget {
  const CustomRow({
    Key? key,
    required this.title,
    required this.editableText,
  }) : super(key: key);
  final String title;
  final String editableText;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(left: 20.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: size.width * 0.2,
            child: Text(
              title,
              style:
                  kBodyText.copyWith(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Text(
            editableText,
            style: kBodyText.copyWith(
                color: kGrey, fontSize: 14, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
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
