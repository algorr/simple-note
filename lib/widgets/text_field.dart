import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final textEditingController;
  const MyTextField({Key? key, required this.textEditingController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(controller: textEditingController,);
  }
}
