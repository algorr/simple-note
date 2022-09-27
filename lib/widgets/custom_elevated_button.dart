import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    Key? key,
    required this.onPressed,
    required this.text,
    required this.backgroundColor,
    required this.paddingSize,
    required this.fontSize,
  }) : super(key: key);

  final VoidCallback onPressed;
  final String text;
  final Color backgroundColor;
  final double paddingSize;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            backgroundColor: backgroundColor,
            padding: EdgeInsets.symmetric(
                horizontal: paddingSize, vertical: paddingSize),
            textStyle:
                TextStyle(fontSize: fontSize, fontWeight: FontWeight.normal)),
        child: Text(text),
      ),
    );
  }
}

class CustomElevatedButtonConsts {
  // Colors
  static const Color backgroundColor = Colors.red;

  // Texts
  static const String signUpText = 'Sign Up!';
  static const String signInText = 'Sign In!';

  // Size
  static const double fontSize = 15.0;
  static const double paddingSize = 15.0;
}
