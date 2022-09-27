import 'package:flutter/material.dart';
import 'package:untitled/models/task.dart';

import '../consts/task_page_consts.dart';

class CustomTasksListCardView extends StatelessWidget {
  const CustomTasksListCardView({Key? key, required this.e}) : super(key: key);

  final Task e;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(e.task),
        trailing: e.complete
            ? const Icon(TaskPageIconConsts.taskPageCompletedTaskIcon)
            : const Icon(TaskPageIconConsts.taskPageNotCompletedTaskIcon),
      ),
    );
  }
}
