// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:studenthub/View/HomeView.dart';
import 'package:studenthub/View/SubjectView.dart';
import 'package:studenthub/constant/colors.dart';
import 'package:studenthub/constant/strings.dart';
import 'package:studenthub/widget/AppDrawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      theme: ThemeData(useMaterial3: true, colorScheme: lightColorScheme),
      darkTheme: ThemeData(useMaterial3: true, colorScheme: darkColorScheme),
      routes: {
        "/subjectInfo": (context) => const SubjectInfo(),
      },
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.primaryColor,
          title: const Text(
            AppString.appName,
            style: TextStyle(color: AppColor.textColor),
          ),
        ),
        drawer: const AppDrawer(),
        body: const Padding(
          padding: EdgeInsets.all(18),
          child: HomeView(),
        ),
      ),
    );
  }
}
