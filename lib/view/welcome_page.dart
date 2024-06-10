// ignore_for_file: must_be_immutable, non_constant_identifier_names
import 'package:database_project/database_service.dart';
import 'package:database_project/view/homepage.dart';
import 'package:flutter/material.dart';
import 'package:database_project/constants.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:database_project/components/rounded_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String ID = "";
  String password = "";
  bool isObscure = true;
  bool showSpinner = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 20.0,
                ),
                Text(
                  'Login',
                  style: kTitleTextStyle,
                ),
              ],
            ),
            const SizedBox(
              height: 30.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 30.0,
                vertical: 5.0,
              ),
              child: TextField(
                keyboardType: TextInputType.number,
                decoration:
                    kTextFieldDecoration.copyWith(labelText: 'Enter your ID'),
                onChanged: (value) {
                  ID = value;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 5.0,
                horizontal: 30.0,
              ),
              child: TextField(
                obscureText: isObscure,
                decoration: kTextFieldDecoration.copyWith(
                  labelText: 'Enter your password',
                  suffix: GestureDetector(
                    onTap: () {
                      setState(() {
                        isObscure = !isObscure;
                      });
                    },
                    child: const Icon(Icons.remove_red_eye_outlined),
                  ),
                ),
                onChanged: (value) {
                  password = value;
                },
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 30.0, vertical: 15.0),
              child: RoundedButton(
                color: Colors.lightBlue.shade400,
                title: 'Sign in',
                onPressed: () async {
                  setState(() {
                    showSpinner = true;
                  });
                  FocusManager.instance.primaryFocus?.unfocus();
                  try {
                    await DatabaseService.login(
                        ID: int.parse(ID), password: password);
                    if (DatabaseService.isUserLogin) {
                      showSpinner = false;
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const HomePage(),
                        ),
                      );
                    }
                  } catch (e) {
                    setState(() {
                      Alert(context: context, title: "登入失敗", desc: e.toString())
                          .show();
                      showSpinner = false;
                    });
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
