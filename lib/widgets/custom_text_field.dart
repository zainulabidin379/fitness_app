import 'package:fitness_app/constants/constants.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String nHintText;
  final String? Function(String?) validator;
  final TextEditingController controller;
  final TextInputAction inputAction;
  final TextInputType inputType;
  const CustomTextField(
      {Key? key,
      required this.controller,
      required this.nHintText,
      required this.inputAction,
      required this.inputType,
      required this.validator})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: TextFormField(
            controller: controller,
            cursorColor: kBlack,
            style: kBodyText.copyWith(color: kBlack),
            textInputAction: inputAction,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              fillColor: kLightGrey,
              filled: true,
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 18, horizontal: 20),
              hintText: nHintText,
              hintStyle: kBodyText.copyWith(color: kBlack),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide(
                  color: kLightGrey,
                  width: 1,
                ),
              ),
            ),
            validator: validator),
      ),
    );
  }
}
