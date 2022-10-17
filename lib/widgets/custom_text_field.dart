import 'package:flutter/material.dart';

import '../utils/constants.dart';

class CustomTextField extends StatelessWidget {
  final String nHintText;
  const CustomTextField({
    Key? key,
    required this.nHintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: 55,
      width: size.width - 50,
      child: TextFormField(
        cursorColor: kBlack,
        decoration: InputDecoration(
            enabledBorder: const OutlineInputBorder(),
            focusedBorder: const OutlineInputBorder(),
            filled: true,
            fillColor: kLightGrey,
            hintText: nHintText,
            hintStyle: kBodyText.copyWith(color: kBlack)),
      ),
    );
  }
}
