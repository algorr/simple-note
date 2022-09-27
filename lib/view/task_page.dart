import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/blocs/task_bloc.dart';
import 'package:untitled/consts/task_page_consts.dart';
import 'package:untitled/services/task_service.dart';
import 'package:untitled/widgets/create_new_task.dart';
import 'package:untitled/widgets/custom_tasks_list_card_view.dart';

enum CheckBox { tick, notTick }

class TaskPage extends StatelessWidget {
  final String user;

  const TaskPage({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TaskBloc(RepositoryProvider.of<TaskService>(context))
        ..add(FetchTasksEvent(user)),
      child: BlocBuilder<TaskBloc, TaskState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: const Text(TaskPageTextConsts.appbarTitle),
              centerTitle: true,
            ),
            floatingActionButton: _CustomFloatingButton(user: user),
            body: state is TaskLoadedState
                ? SizedBox(
                    child: Column(
                      children: [
                        Expanded(
                          child: ListView(
                            children: [
                              ...state.tasks.map(
                                (e) => Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 5),
                                  child:CustomTasksListCardView(e: e)
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                : const Center(
                    child: CircularProgressIndicator(),
                  ),
          );
        },
      ),
    );
  }
}

class _CustomFloatingButton extends StatelessWidget {
  const _CustomFloatingButton({
    Key? key,
    required this.user,
  }) : super(key: key);

  final String user;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: const Icon(TaskPageIconConsts.taskPageAddNoteIcon),
      onPressed: () async {
        final result = await showModalBottomSheet(
          elevation: 10,
          shape: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
            context: context,
            builder: (context) => CreateNewTask(user));
        if (result != null) {
          BlocProvider.of<TaskBloc>(context)
              .add(AddTaskEvent(result, user));
        }
      },
    );
  }
}


/* showDialog(
                    context: context,
                    builder: (context) => Dialog(
                          child: CreateNewTask(user),
                        ));*/