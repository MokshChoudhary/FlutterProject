// ignore_for_file: file_names

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:my_app/constant/colors.dart';
import 'package:my_app/registerView/registerScreen.dart';

import 'database/HubDatabase.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final scaffoldCurrent = GlobalKey<ScaffoldMessengerState>();

  Future<HubDatabase> getdatabase() async {
    final HubDatabase database =
        await $FloorHubDatabase.databaseBuilder('studentHub.db').build();
    return database;
  }

  showSnackBar(String msg) {
    scaffoldCurrent.currentState?.showSnackBar(SnackBar(
      content: Text(msg.isEmpty ? 'Pleas enter the UserId & Password' : msg),
    ));
  }

  @override
  Widget build(BuildContext context) {
    final userIDController = TextEditingController();
    final passController = TextEditingController();
    return MaterialApp(
      scaffoldMessengerKey: scaffoldCurrent,
      theme: ThemeData(useMaterial3: true, colorScheme: lightColorScheme),
      darkTheme: ThemeData(useMaterial3: true, colorScheme: darkColorScheme),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: const Text(""),
        ),
        body: Column(
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Student",
                      style: TextStyle(
                        color: MediaQuery.of(context).platformBrightness ==
                                Brightness.dark
                            ? AppColor.secondaryTextColor
                            : AppColor.textColor,
                        fontSize: 48,
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: const BoxDecoration(
                      color: AppColor.primaryColor,
                      borderRadius: BorderRadius.all(
                        Radius.circular(12.0),
                      ),
                    ),
                    child: Text(
                      "Hub",
                      style: TextStyle(
                        color: MediaQuery.of(context).platformBrightness ==
                                Brightness.dark
                            ? AppColor.textColor
                            : AppColor.secondaryTextColor,
                        fontSize: 48,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    TextFormField(
                      autocorrect: false,
                      controller: userIDController,
                      decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'Enter your username',
                      ),
                    ),
                    TextField(
                      autocorrect: false,
                      obscureText: true,
                      controller: passController,
                      decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'Enter your password',
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                            child: OutlinedButton(
                              onPressed: () {
                                log("Loging button press ${userIDController.text} , ${passController.text}");
                                if (userIDController.text.isNotEmpty ||
                                    passController.text.isNotEmpty) {
                                  getdatabase().then((value) => {
                                        value.loginDao
                                            .findUser(
                                                userIDController.text.trim(),
                                                passController.text.trim())
                                            .then((value) => {
                                                  Navigator.of(context)
                                                      .pushReplacement(
                                                    MaterialPageRoute(
                                                      builder: (BuildContext
                                                              context) =>
                                                          LoginScreen(),
                                                    ),
                                                  ),
                                                }),
                                      });
                                } else {
                                  showSnackBar("Pleas enter userID & password");
                                }
                              },
                              child: const Text(
                                'Login',
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                            child: OutlinedButton(
                              onPressed: () {
                                log("Register button press ${userIDController.text} , ${passController.text}");
                                if (userIDController.text.isNotEmpty &&
                                    passController.text.isNotEmpty) {
                                  userIDController.text == "admin" &&
                                          passController.text == "p@ssw0rd"
                                      ? Navigator.of(context).pushReplacement(
                                          MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                RegisterScreen(),
                                          ),
                                        )
                                      : showSnackBar(
                                          "Wrong UserID or Password!!");
                                }
                              },
                              child: const Text(
                                'Register',
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
