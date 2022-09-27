import 'package:flutter/material.dart';
import 'package:untitled/widgets/custom_elevated_button.dart';

class CreateNewTask extends StatelessWidget {
  const CreateNewTask(this.username, {Key? key}) : super(key: key);
  final String username;

  @override
  Widget build(BuildContext context) {
    final inputController = TextEditingController();
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            top: 25,
          ),
          child: const Text("What task do you want to create?"),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 15, left: 20, right: 20),
          child: TextField(
            controller: inputController,
            decoration: InputDecoration(
              hintText: 'Do Something',
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
                borderRadius: BorderRadius.circular(10.0),
              ),
              disabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
                borderRadius: BorderRadius.circular(10.0),
              ),
              fillColor: Colors.grey,
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
                borderRadius: BorderRadius.circular(10.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red),
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),
        ),
        CustomElevatedButton(
            onPressed: () {
              Navigator.pop(context, inputController.text);
            },
            text: 'Save',
            backgroundColor: CustomElevatedButtonConsts.backgroundColor,
            paddingSize: CustomElevatedButtonConsts.paddingSize,
            fontSize: CustomElevatedButtonConsts.fontSize)
      ],
    );
  }
}

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
