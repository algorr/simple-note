import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/home_bloc.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final usernameController = TextEditingController();
    final passwordController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register Page'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          TextField(
            controller: usernameController,
            decoration: const InputDecoration(labelText: 'Username'),
            onTap: () {},
          ),
          TextField(
            controller: passwordController,
            decoration: const InputDecoration(labelText: 'Password'),
            onTap: () {},
          ),
          ElevatedButton(
              onPressed: () {
                BlocProvider.of<HomeBloc>(context).add(LoginEvent(
                    usernameController.text, passwordController.text));
              },
              child: const Text("Sign")),
          ElevatedButton(
              onPressed: () {
                BlocProvider.of<HomeBloc>(context).add(RegisterEvent(
                    usernameController.text, passwordController.text));
              },
              child: const Text("Register")),
        ],
      ),
    );
  }
}
