import 'package:flutter/material.dart';

import '../utils/constants.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  final String title;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Center(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          height: 55,
          width: size.width * 0.6,
          decoration: BoxDecoration(
              color: kWhite, borderRadius: BorderRadius.circular(5)),
          child: Center(
              child: Text(
            title,
            style: kButtonText,
          )),
        ),
      ),
    );
  }
}
