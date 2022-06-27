import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/home_bloc.dart';


class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('HomePage'),
          centerTitle: true,
        ),
        body: Column(
          children: [
          /*  ElevatedButton(
                onPressed: () async {
                  final result = await showDialog<String>(
                      context: context,
                      builder: (context) =>
                          Dialog(
                            child: CreateNewTask(state.username),
                          ));
                  if (result != null) {
                    BlocProvider.of<TaskBloc>(context)
                        .add(AddTaskEvent(result, state.username));
                  }
                },
                child: const Text('add'))*/
          ],
        ),

      );
    },);
  }}