import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/blocs/home_bloc.dart';
import 'package:untitled/view/auth_page.dart';
import 'package:untitled/view/home_page.dart';
import 'package:untitled/view/task_page.dart';

import '../blocs/task_bloc.dart';

class BlocLogic extends StatefulWidget {
  const BlocLogic({Key? key}) : super(key: key);

  @override
  State<BlocLogic> createState() => _BlocLogicState();
}

class _BlocLogicState extends State<BlocLogic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
         if(state is HomeInitial){
           return const AuthPage();
         }if(state is LoginState){
           return TaskPage(user: state.username);
         }
         return Container(color: Colors.red,);
        },
      ),
    );
  }
}
