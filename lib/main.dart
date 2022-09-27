import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:untitled/blocs/home_bloc.dart';
import 'package:untitled/services/authentication_service.dart';
import 'package:untitled/services/task_service.dart';
import 'view/bloc_logic.dart';


void main() async {
  await Hive.initFlutter();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (context) => AuthenticationService()),
        RepositoryProvider(create: (context) => TaskService()),
      ],
      child: MaterialApp(
        title: 'Hive & Bloc',
        debugShowCheckedModeBanner: false,
        theme: _themeOfApp(),
        home: BlocProvider(
          create: (context) => HomeBloc(
              RepositoryProvider.of<AuthenticationService>(context),
              RepositoryProvider.of<TaskService>(context))
            ..add(ServiceEvent()),
          child: const BlocLogic(),
        ),
      ),
    );
  }
}

  ThemeData _themeOfApp() {
    return ThemeData(
        primarySwatch: Colors.red,
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            selectedItemColor: Colors.red, unselectedItemColor: Colors.grey));
  }