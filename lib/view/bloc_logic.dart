import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/view/auth_page.dart';
import 'package:untitled/view/task_page.dart';
import '../viewmodel/home_bloc.dart';


class BlocLogic extends StatefulWidget {
  const BlocLogic({Key? key}) : super(key: key);

  @override
  State<BlocLogic> createState() => _BlocLogicState();
}

class _BlocLogicState extends State<BlocLogic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) {
          print(state);
          if (state is LoginState) {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => TaskPage(user: state.username)));
          }
        },
        builder: (context, state) {
          print(state);
          if (state is LoginState) {
          return  TaskPage(user: state.username,);
          }
          if (state is HomeInitial) {
          return const AuthPage();
          }
          return const AuthPage();
        },
      ),
    );
  }
}
