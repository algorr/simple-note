import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/consts/auth_page_consts.dart';
import 'package:untitled/widgets/auth_button.dart';
import '../viewmodel/home_bloc.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final usernameController = TextEditingController();
    final passwordController = TextEditingController();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text(AuthPageConsts.appBarTitle),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Image.asset('assets/images/auth.png'),
            Padding(
              padding: const EdgeInsets.only(top: 350),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 70, right: 70, top: 40),
                    child: TextField(
                      keyboardType: TextInputType.name,
                      controller: usernameController,
                      decoration: InputDecoration(
                         prefixIcon: Icon(Icons.person_outline),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15)),
                          labelText: AuthPageConsts.usernameLabelText),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 70, right: 70, top: 10),
                    child: TextField(
                      controller: passwordController,
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.key_outlined),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15)),
                          labelText: AuthPageConsts.passwordLabelText),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
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
            ),
          ],
        ),
      ),
    );
  }
}
