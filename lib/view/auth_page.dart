import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/consts/auth_page_consts.dart';
import 'package:untitled/widgets/auth_button.dart';
import '../blocs/home_bloc.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final usernameController = TextEditingController();
    final passwordController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text(AuthPageConsts.appBarTitle),
        centerTitle: true,
      ),
      body: Column(
        children: [
          TextField(
            controller: usernameController,
            decoration: const InputDecoration(
                labelText: AuthPageConsts.usernameLabelText),
            onTap: () {},
          ),
          TextField(
            controller: passwordController,
            decoration: const InputDecoration(
                labelText: AuthPageConsts.passwordLabelText),
            onTap: () {},
          ),
          AuthButton(
              buttonText: AuthPageConsts.signButtonTitle,
              onPressed: () {
                BlocProvider.of<HomeBloc>(context).add(LoginEvent(
                    usernameController.text, passwordController.text));
              }),
          AuthButton(
              buttonText: AuthPageConsts.registerButtonTitle,
              onPressed: () {
                BlocProvider.of<HomeBloc>(context).add(RegisterEvent(
                    usernameController.text, passwordController.text));
              }),
        ],
      ),
    );
  }
}
