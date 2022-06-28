import 'package:flutter/material.dart';

class AuthButton extends StatelessWidget {
  final String buttonText;
  final Function onPressed;

  const AuthButton(
      {Key? key, required this.buttonText, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width*.35,
        height:MediaQuery.of(context).size.height*.05 ,
        child: ElevatedButton(
          onPressed: () {
            onPressed();
          },
          child: Text(buttonText),
        ),
      ),
    );
  }
}
