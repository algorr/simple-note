import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    Key? key,
    required this.hintText,
    required this.focusedBorderColor,
    required this.enabledBorderColor,
    required this.controller,
    required this.keyboardType,
    required this.obscureText
  }) : super(key: key);

  final TextEditingController controller;
  final String hintText;
  final Color focusedBorderColor;
  final Color enabledBorderColor;
  final TextInputType keyboardType;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      keyboardType: keyboardType,
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.circular(10.0),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.circular(10.0),
        ),
        fillColor: Colors.grey,
        contentPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: enabledBorderColor),
          borderRadius: BorderRadius.circular(10.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: focusedBorderColor),
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}


// Consts for Custom Text Form Field
class CustomTextFormFieldConsts {
  // Colors
  static const Color enabledBorderColor = Colors.grey;
  static const Color focusedBorderColor = Colors.red;
  static const Color disabledBorder = Colors.grey;

  //Texts
  static const String emailHintText = 'Email';
  static const String passwordHintText = 'Password';
  static const String nameHintText = 'Name';
  static const String surnameHintText = 'Surname';
  static const String titleHintText = 'Title';
}