import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:untitled/blocs/home_bloc.dart';
import 'package:untitled/view/auth_page.dart';
import 'package:untitled/view/home_page.dart';
import 'package:untitled/view/task_page.dart';
import '../models/user.dart';
import '../services/authentication_service.dart';

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
          if (state is LoginState) {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => TaskPage(user: state.username)));
          }
        },
        builder: (context, state) {
          if (state is HomeInitial) {
          return AuthPage();
          }
          return const AuthPage();
        },
      ),
    );
  }
}
