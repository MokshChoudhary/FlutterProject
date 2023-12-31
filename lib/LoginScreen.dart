// ignore_for_file: file_names, library_private_types_in_public_api

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:studenthub/LoginImpl.dart';
import 'package:studenthub/constant/colors.dart';
import 'package:studenthub/database/LoginData.dart';
import 'package:studenthub/database/StudentData.dart';
import 'package:studenthub/homeScreen.dart';
import 'package:studenthub/registerView/registerScreen.dart';
import 'package:studenthub/utils/LoadingDilog.dart';
import 'package:studenthub/utils/Securty.dart';

import 'database/HubDatabase.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreen createState() => _LoginScreen();
}

class _LoginScreen extends State<StatefulWidget> {
  final scaffoldCurrent = GlobalKey<ScaffoldMessengerState>();
  bool _passwordVisibity = false;

  LoginImpl loginImpl = LoginImpl();

  Future<HubDatabase> getdatabase() async {
    final HubDatabase database =
        await $FloorHubDatabase.databaseBuilder('studentHub.db').build();
    return database;
  }

  showSnackBar(String msg) {
    scaffoldCurrent.currentState?.showSnackBar(SnackBar(
      content: Text(msg.isEmpty ? 'Please Enter the UserId & Password' : msg),
    ));
  }

  @override
  Widget build(BuildContext context) {
    String userIDValue = "";
    String passValue = "";

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
                    TextField(
                      autocorrect: false,
                      onChanged: (value) => userIDValue = value,
                      decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'Enter your username',
                      ),
                    ),
                    TextField(
                      autocorrect: false,
                      obscureText: !_passwordVisibity,
                      onChanged: (value) => passValue = value,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                            onPressed: () {
                              _passwordVisibity = !_passwordVisibity;
                              setState(() {});
                            },
                            icon: Icon(!_passwordVisibity
                                ? Icons.visibility
                                : Icons.visibility_off)),
                        border: const UnderlineInputBorder(),
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
                                const LoadingDilog();
                                log("Loging button press $userIDValue , $passValue");
                                if (userIDValue.isNotEmpty &&
                                    passValue.isNotEmpty) {
                                  try {
                                    if (userIDValue.toString() == "moksh" &&
                                        passValue == "System123#") {
                                      Navigator.of(context).pushReplacement(
                                          MaterialPageRoute(
                                              builder: (BuildContext context) =>
                                                  const LoginScreen()));
                                    }
                                    getdatabase().then((db) => {
                                          db.loginDao
                                              .findUser(
                                                  userIDValue.toString().trim(),
                                                  Security().encrypt(passValue
                                                      .toString()
                                                      .trim()))
                                              .then((login) => {
                                                    if (login.isNotEmpty)
                                                      {
                                                        //check in the local database
                                                        Navigator.of(context)
                                                            .pushReplacement(
                                                          MaterialPageRoute(
                                                              builder: (BuildContext
                                                                      context) =>
                                                                  const HomeScreen()),
                                                        )
                                                        // db.loginDao
                                                        //     .findUser(
                                                        //         userIDValue.trim(),
                                                        //         passValue.trim())
                                                        //     .then((value) => {

                                                        //         })
                                                      }
                                                    else
                                                      {
                                                        //Check in the server database
                                                        loginImpl
                                                            .getStudentLogin(
                                                                userIDValue,
                                                                passValue)
                                                            .then((req) async {
                                                          if (req == null) {
                                                            log("Login request ${req.toString()}");
                                                            return;
                                                          }
                                                          if (req
                                                              is StudentData) {
                                                            req;
                                                          } else {
                                                            showSnackBar(
                                                                "Wrong UserID or Password!!");
                                                            return;
                                                          }
                                                          StudentData studentData = StudentData(
                                                              req.studentId,
                                                              req.studentFirstName,
                                                              req.studentLastName,
                                                              req.gender,
                                                              req.cgpa,
                                                              req.classId,
                                                              req.dob,
                                                              req.aadharNumber,
                                                              req.address,
                                                              req.subCast,
                                                              req.religion,
                                                              req.marksObtain,
                                                              req.attendsObtain,
                                                              req.joinIn,
                                                              req.fatherFirstName,
                                                              req.fatherLastName,
                                                              req.motherFirstName,
                                                              req.motherLastName,
                                                              req.gardiuanNumber,
                                                              req.password);
                                                          var loginData = LoginData(
                                                              uniqueId:
                                                                  studentData
                                                                      .studentId,
                                                              loginBy: LoginType
                                                                  .student
                                                                  .index,
                                                              userId: studentData
                                                                  .studentId,
                                                              password: Security()
                                                                  .encrypt(
                                                                      studentData
                                                                          .password));
                                                          log("Responce we get : $studentData");
                                                          log("Responce we get : $loginData");
                                                          db.studentDao
                                                              .insertStudent(
                                                                  studentData)
                                                              .then((value) => db
                                                                  .loginDao
                                                                  .insertUser(
                                                                      loginData)
                                                                  .then((value) =>
                                                                      Navigator.of(
                                                                              context)
                                                                          .pushReplacement(
                                                                        MaterialPageRoute(
                                                                          builder: (BuildContext context) =>
                                                                              const HomeScreen(),
                                                                        ),
                                                                      )));
                                                        }),
                                                      }
                                                  })
                                        });
                                  } catch (e) {
                                    log(e.toString());
                                    showSnackBar("Something went wrong!!");
                                  }
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
                                log("Register button press $userIDValue , $passValue");
                                if (userIDValue.isNotEmpty &&
                                    passValue.isNotEmpty) {
                                  userIDValue == "admin" &&
                                          passValue == "p@ssw0rd"
                                      ? Navigator.of(context).pushReplacement(
                                          MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                const RegisterScreen(),
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
