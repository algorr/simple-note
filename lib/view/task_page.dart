import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/blocs/task_bloc.dart';
import 'package:untitled/consts/task_page_consts.dart';
import 'package:untitled/services/task_service.dart';
import 'package:untitled/view/create_new_task.dart';

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
              title: const Text(TaskPageConsts.appbarTitle),
              centerTitle: true,
            ),
            floatingActionButton: FloatingActionButton(child: const Icon(Icons.plus_one_rounded),onPressed: ()async{
              final result = await showDialog(context: context, builder: (context) => Dialog(child: CreateNewTask(user),));
              if (result != null) {
                BlocProvider.of<TaskBloc>(context)
                    .add(AddTaskEvent(result, user));
              }
            },),
            body: state is TaskLoadedState
                ? SizedBox(

                    child: Column(
                      children: [
                        Expanded(
                          child: ListView(
                            children: [
                              ...state.tasks.map(
                                (e) => Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                                  child: Card(
                                    child: ListTile(
                                      title: Text(e.task),
                                    ),
                                  ),
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
