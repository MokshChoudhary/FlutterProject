// ignore_for_file: file_names, library_private_types_in_public_api

import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:studenthub/LoginScreen.dart';
import 'package:studenthub/constant/colors.dart';
import 'package:studenthub/database/HubDatabase.dart';
import 'package:studenthub/service/ServersAPI.dart';

import 'homeScreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  _SplashScreenState();
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

  void serverCheck() {
    ServerAPI.ping().then((value) {
      Map<String, dynamic> s = jsonDecode(value.body);
      if (value.statusCode == 200) {
        if (kDebugMode) log("Value : ${s['status']}", time: DateTime.now());
        loginCheck();
      }
    });
  }

  void loginCheck() async {
    final HubDatabase database =
        await $FloorHubDatabase.databaseBuilder('studentHub.db').build();
    database.loginDao.findAllUser().then((value) => {
          if (value.isNotEmpty)
            {
              if (value.isNotEmpty)
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
                      builder: (BuildContext context) => LoginScreen(),
                    ),
                  ),
                )
            }
          else
            Timer(
              const Duration(seconds: 3),
              () => Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (BuildContext context) => LoginScreen(),
                ),
              ),
            )
        });
  }

  @override
  Widget build(BuildContext context) {
    serverCheck();
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
