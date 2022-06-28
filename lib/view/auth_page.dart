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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 70,vertical: 20),
            child: TextField(
              controller: usernameController,
              decoration:  InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                  labelText: AuthPageConsts.usernameLabelText),
              onTap: () {},
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 70),
            child: TextField(
              controller: passwordController,
              decoration:  InputDecoration(border:  OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                  labelText: AuthPageConsts.passwordLabelText),
              onTap: () {},
            ),
          ),
          AuthButton(
              buttonText: AuthPageConsts.signButtonTitle,
              onPressed: () {
                BlocProvider.of<HomeBloc>(context).add(LoginEvent(
                    usernameController.text, passwordController.text));
                print("SIGIN BUTTON CALISTI");
              }),
          AuthButton(
              buttonText: AuthPageConsts.registerButtonTitle,
              onPressed: () {
                BlocProvider.of<HomeBloc>(context).add(RegisterEvent(
                    usernameController.text, passwordController.text));
                print("REGISTER BUTTON CALISTI");
              }),
        ],
      ),
    );
  }
}
