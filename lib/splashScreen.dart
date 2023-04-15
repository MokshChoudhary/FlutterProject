// ignore_for_file: file_names, library_private_types_in_public_api, unused_local_variable, use_build_context_synchronously

import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:studenthub/LoginScreen.dart';
import 'package:studenthub/constant/colors.dart';
import 'package:studenthub/database/HubDatabase.dart';
import 'package:studenthub/service/ServersAPI.dart';

import 'database/SettingData.dart';
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

  Future<void> _showMyDialog() async {
    final HubDatabase database =
        await $FloorHubDatabase.databaseBuilder('studentHub.db').build();
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Connection Alert'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('Server Connection...'),
                Text('Could not able to connect with server!'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
                onPressed: () {
                  try {
                    Future<List<SettingData>> setting =
                        database.settingDao.getAllSettings();
                    setting.then((value) => {
                          if (value.isNotEmpty)
                            {
                              database.settingDao
                                  .updateSetting(SettingData(true, 0))
                            }
                        });
                  } catch (e) {
                    log("Message $e");
                  }
                },
                child: const Text("Offline Mode")),
            TextButton(
              child: const Text('Retry'),
              onPressed: () {
                Navigator.of(context).pop();
                serverCheck();
              },
            ),
          ],
        );
      },
    );
  }

  void serverCheck() {
    ServerAPI.ping().then((value) {
      if (value != Null) {
        Map<String, dynamic> s = jsonDecode((value as http.Response).body);
        if (value.statusCode == 200) {
          if (kDebugMode) log("Value : ${s['status']}", time: DateTime.now());
          loginCheck();
        }
      } else {
        _showMyDialog();
      }
    });
  }

  void loginCheck() async {
    final HubDatabase database =
        await $FloorHubDatabase.databaseBuilder('studentHub.db').build();
    getDatabasesPath().then((v) => log("Datatabase path : $v"));
    Timer(
      const Duration(seconds: 3),
      () => Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (BuildContext context) => const LoginScreen(),
        ),
      ),
    );
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
