import 'package:flutter/material.dart';
import 'package:untitled/view/task_page.dart';

class CreateNewTask extends StatelessWidget {
  const CreateNewTask(this.username, {Key? key}) : super(key: key);
  final String username;

  @override
  Widget build(BuildContext context) {
    final inputController = TextEditingController();
    return Column(
      children: [
        const Text("What task do you want to create?"),
        TextField(
          controller: inputController,
        ),
        ElevatedButton(
            onPressed: ()  {
            Navigator.pop(context,inputController.text);
            },
            child: const Text('SAVE'))
      ],
    );
  }


}
