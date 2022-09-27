import 'package:flutter/material.dart';
import 'package:untitled/widgets/custom_text_form_field.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key, required this.user}) : super(key: key);

  final String user;

  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 50),
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/images/person.jpg'),
                radius: 40,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomProfileFormField(
                  nameController: nameController,
                  hintText: 'name',
                  title: 'Name',
                ),
                CustomProfileFormField(
                  nameController: nameController,
                  hintText: 'password',
                  title: 'Password',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CustomProfileFormField extends StatelessWidget {
  const CustomProfileFormField({
    Key? key,
    required this.nameController,
    required this.title,
    required this.hintText,
  }) : super(key: key);

  final TextEditingController nameController;
  final String title;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 40,
              width: 200,
              child: CustomTextFormField(
                  hintText: hintText,
                  focusedBorderColor: Colors.red,
                  enabledBorderColor: Colors.grey,
                  controller: nameController,
                  keyboardType: TextInputType.name,
                  obscureText: false),
            ),
          )
        ],
      ),
    );
  }
}
