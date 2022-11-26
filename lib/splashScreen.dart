// ignore_for_file: file_names, library_private_types_in_public_api

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:my_app/LoginScreen.dart';
import 'package:my_app/constant/colors.dart';
import 'package:my_app/database/HubDBHelper.dart';
import 'package:my_app/database/HubDatabase.dart';

import 'homeScreen.dart';

class SplashScreen extends StatefulWidget {
  final HubDatabase database;
  const SplashScreen({super.key, required this.database});

  @override
  _SplashScreenState createState() => _SplashScreenState(database: database);
}

class _SplashScreenState extends State<SplashScreen> {
  final HubDatabase database;
  _SplashScreenState({required this.database});
  List<Widget> getCenterText() {
    return [
      Center(
        child: Container(
          padding: const EdgeInsets.all(8.0),
          child: const Text(
            "Student",
            style: TextStyle(
              color: AppColor.secondaryTextColor,
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
          child: const Text(
            "Hub",
            style: TextStyle(
              color: AppColor.textColor,
              fontSize: 48,
            ),
          ),
        ),
      ),
    ];
  }

  @override
  Future<void> initState() async {
    super.initState();
    database.loginDao.findAllUser().then((value) => {
          if (value.isNotEmpty)
            {
              if (value.length > 0)
                Timer(
                  const Duration(seconds: 3),
                  () => Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (BuildContext context) => const HomeScreen(),
                    ),
                  ),
                )
              else
                Timer(
                  const Duration(seconds: 3),
                  () => Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (BuildContext context) => const LoginScreen(),
                    ),
                  ),
                )
            }
          else
            Timer(
              const Duration(seconds: 3),
              () => Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (BuildContext context) => const LoginScreen(),
                ),
              ),
            )
        });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Center(
        child: ListView(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            children: getCenterText()),
      ),
    );
  }
}
